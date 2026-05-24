#include <fcntl.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#define N 5
#define M 5
#define K 5
#define STR_LEN 10

#define SHM_NAME "/myshm"
#define SEM_DONE "/done"
#define SEM_WRITE_ACCESS "/write_access"
#define SEM_READ_MUTEX "/read_mutex"
#define SEM_FULL "/full_%d"
#define SEM_WRITER "/writer_%d"
#define CHARSET "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

typedef struct {
  char buffer[K][STR_LEN + 1];
  int in;
  int out;
  int reader_count;
} SharedData;

SharedData *shdata;
sem_t *sem_done, *sem_write_access, *sem_read_mutex;
sem_t *sem_full[M];
sem_t *sem_writers[N];

void generate_string(char *buf) {
  for (int i = 0; i < STR_LEN; i++)
    buf[i] = CHARSET[rand() % (int)(sizeof CHARSET - 1)];
  buf[STR_LEN] = '\0';
}

void producer(int id) {
  // https://stackoverflow.com/questions/15767691/whats-the-c-library-function-to-generate-random-string
  // random seed
  //
  srand(time(NULL) + getpid());
  char str[STR_LEN + 1];
  while (1) {
    generate_string(str);
    sem_wait(sem_writers[id]);
    sem_wait(sem_write_access);

    strcpy(shdata->buffer[shdata->in], str);
    shdata->in = (shdata->in + 1) % K;

    printf("[Producer %d] wrote: \"%s\"\n", id + 1, str);
    fflush(stdout);

    sem_post(sem_write_access);
    for (int j = 0; j < M; j++)
      sem_post(sem_full[j]);
    for (int j = 0; j < M; j++)
      sem_wait(sem_done);

    shdata->out = (shdata->out + 1) % K;
    sem_post(sem_writers[(id + 1) % N]);
  }
}

void consumer(int id) {
  char line[64];
  char str[STR_LEN + 1];
  while (1) {
    sem_wait(sem_full[id]);
    sem_wait(sem_read_mutex);

    shdata->reader_count++;
    if (shdata->reader_count == 1)
      sem_wait(sem_write_access);

    sem_post(sem_read_mutex);

    strcpy(str, shdata->buffer[shdata->out]);
    sem_wait(sem_read_mutex);
    shdata->reader_count--;
    if (shdata->reader_count == 0)
      sem_post(sem_write_access);
    sem_post(sem_read_mutex);
    sem_post(sem_done);
    int pos = snprintf(line, sizeof line, "[Consumer %d] reading: \"", id + 1);

    write(STDOUT_FILENO, line, pos);
    for (int i = 0; str[i] != '\0'; i++) {
      write(STDOUT_FILENO, &str[i], 1);
      usleep(300000);
    }
    write(STDOUT_FILENO, "\"\n", 2);
  }
}

int main(void) {
  char name[64];
  int shm_fd;

  // clean last session
  shm_unlink(SHM_NAME);
  sem_unlink(SEM_DONE);
  sem_unlink(SEM_WRITE_ACCESS);
  sem_unlink(SEM_READ_MUTEX);

  for (int j = 0; j < M; j++) {
    snprintf(name, sizeof name, SEM_FULL, j);
    sem_unlink(name);
  }

  for (int i = 0; i < N; i++) {
    snprintf(name, sizeof name, SEM_WRITER, i);
    sem_unlink(name);
  }

  // create shared memory
  if ((shm_fd = shm_open(SHM_NAME, O_CREAT | O_RDWR, 0666)) == -1) {
    perror("shm_open");
    exit(1);
  }

  ftruncate(shm_fd, sizeof(SharedData));

  if ((shdata = mmap(NULL, sizeof(SharedData), PROT_READ | PROT_WRITE,
                     MAP_SHARED, shm_fd, 0)) == MAP_FAILED) {
    perror("mmap");
    exit(1);
  }

  close(shm_fd);

  if ((sem_done = sem_open(SEM_DONE, O_CREAT | O_EXCL, 0666, 0)) ==
      SEM_FAILED) {
    perror("done");
    exit(1);
  }
  if ((sem_write_access = sem_open(SEM_WRITE_ACCESS, O_CREAT | O_EXCL, 0666,
                                   1)) == SEM_FAILED) {
    perror("write");
    exit(1);
  }
  if ((sem_read_mutex = sem_open(SEM_READ_MUTEX, O_CREAT | O_EXCL, 0666, 1)) ==
      SEM_FAILED) {
    perror("read_mutex");
    exit(1);
  }
  for (int j = 0; j < M; j++) {
    snprintf(name, sizeof name, SEM_FULL, j);
    if ((sem_full[j] = sem_open(name, O_CREAT | O_EXCL, 0666, 0)) ==
        SEM_FAILED) {
      perror(name);
      exit(1);
    }
  }
  for (int i = 0; i < N; i++) {
    snprintf(name, sizeof name, SEM_WRITER, i);
    if ((sem_writers[i] = sem_open(name, O_CREAT | O_EXCL, 0666,
                                   i == 0 ? 1 : 0)) == SEM_FAILED) {
      perror(name);
      exit(1);
    }
  }

  printf("Producers: %d  Consumers: %d  Buffer: %d\n\n", N, M, K);

  // Producers and consumers inheritate pointer to shared memory
  pid_t pid;

  for (int i = 0; i < N; i++) {
    if ((pid = fork()) == -1) {
      perror("fork producer");
      exit(1);
    }
    if (pid == 0) {
      producer(i);
      exit(1);
    }
  }

  for (int i = 0; i < M; i++) {
    if ((pid = fork()) == -1) {
      perror("fork consumer");
      exit(1);
    }
    if (pid == 0) {
      consumer(i);
      exit(1);
    }
  }

  for (int i = 0; i < N + M; i++)
    wait(NULL);

  // cleanup
  shm_unlink(SHM_NAME);
  sem_unlink(SEM_DONE);
  sem_unlink(SEM_WRITE_ACCESS);
  sem_unlink(SEM_READ_MUTEX);

  for (int j = 0; j < M; j++) {
    snprintf(name, sizeof name, SEM_FULL, j);
    sem_unlink(name);
  }

  for (int i = 0; i < N; i++) {
    snprintf(name, sizeof name, SEM_WRITER, i);
    sem_unlink(name);
  }

  return 0;
}
