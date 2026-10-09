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
#define K 128
#define STR_LEN 10
#define PRIORITY_CHANCE 30

#define SHM_NAME "/myshm"
#define SEM_ANY "/any"
#define SEM_FULL_PRIORITY "/full_priority"
#define SEM_EMPTY_PRIORITY "/empty_priority"
#define SEM_MUTEX_PRIORITY "/mutex_priority"
#define SEM_FULL_NORMAL "/full_normal"
#define SEM_EMPTY_NORMAL "/empty_normal"
#define SEM_MUTEX_NORMAL "/mutex_normal"
#define SEM_ORDER "/order_%d"
#define CHARSET "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

typedef struct {
  char priority_buf[((K / 2) / (STR_LEN + 1))][STR_LEN + 1];
  int priority_in;
  int priority_out;
  char normal_buf[((K / 2) / (STR_LEN + 1))][STR_LEN + 1];
  int normal_in;
  int normal_out;
} SharedData;

SharedData *shdata;
sem_t *sem_any;
sem_t *sem_full_priority, *sem_empty_priority, *sem_mutex_priority;
sem_t *sem_full_normal, *sem_empty_normal, *sem_mutex_normal;
sem_t *sem_order[N];

void generate_string(char *buf) {
  for (int i = 0; i < STR_LEN; i++) {
    buf[i] = CHARSET[rand() % (int)(sizeof CHARSET - 1)];
  }
  buf[STR_LEN] = '\0';
}

void producer(int id) {
  srand(time(NULL) + getpid());
  char str[STR_LEN + 1];
  while (1) {
    generate_string(str);
    sem_wait(sem_order[id]);

    int is_priority = (rand() % 100) < PRIORITY_CHANCE;
    if (is_priority) {
      sem_wait(sem_empty_priority);
      sem_wait(sem_mutex_priority);
      strcpy(shdata->priority_buf[shdata->priority_in], str);
      shdata->priority_in =
          (shdata->priority_in + 1) % ((K / 2) / (STR_LEN + 1));
      printf("[Producer %d] PRIORITY: %s\n", id + 1, str);
      fflush(stdout);
      sem_post(sem_mutex_priority);
      sem_post(sem_full_priority);
    } else {
      sem_wait(sem_empty_normal);
      sem_wait(sem_mutex_normal);
      strcpy(shdata->normal_buf[shdata->normal_in], str);
      shdata->normal_in = (shdata->normal_in + 1) % ((K / 2) / (STR_LEN + 1));
      printf("[Producer %d] NORMAL: %s\n", id + 1, str);
      fflush(stdout);
      sem_post(sem_mutex_normal);
      sem_post(sem_full_normal);
    }

    sem_post(sem_any);
    sem_post(sem_order[(id + 1) % N]);
  }
}

void consumer(int id) {
  char line[64];
  char str[STR_LEN + 1];
  const char *queue_name;
  while (1) {
    sem_wait(sem_any);

    if (sem_trywait(sem_full_priority) == 0) {
      queue_name = "PRIORITY";
      sem_wait(sem_mutex_priority);
      strcpy(str, shdata->priority_buf[shdata->priority_out]);
      shdata->priority_out =
          (shdata->priority_out + 1) % ((K / 2) / (STR_LEN + 1));
      sem_post(sem_mutex_priority);
      sem_post(sem_empty_priority);
    } else {
      queue_name = "NORMAL";
      sem_wait(sem_full_normal);
      sem_wait(sem_mutex_normal);
      strcpy(str, shdata->normal_buf[shdata->normal_out]);
      shdata->normal_out = (shdata->normal_out + 1) % ((K / 2) / (STR_LEN + 1));
      sem_post(sem_mutex_normal);
      sem_post(sem_empty_normal);
    }

    int pos = snprintf(line, sizeof line, "[Consumer %d] %s read: ", id + 1,
                       queue_name);
    write(STDOUT_FILENO, line, pos);
    for (int i = 0; str[i] != '\0'; i++) {
      write(STDOUT_FILENO, &str[i], 1);
      usleep(300000);
    }
    write(STDOUT_FILENO, "\n", 1);
  }
}

int main(void) {
  char name[64];
  int shm_fd;

  shm_unlink(SHM_NAME);
  sem_unlink(SEM_ANY);
  sem_unlink(SEM_FULL_PRIORITY);
  sem_unlink(SEM_EMPTY_PRIORITY);
  sem_unlink(SEM_MUTEX_PRIORITY);
  sem_unlink(SEM_FULL_NORMAL);
  sem_unlink(SEM_EMPTY_NORMAL);
  sem_unlink(SEM_MUTEX_NORMAL);

  for (int i = 0; i < N; i++) {
    snprintf(name, sizeof name, SEM_ORDER, i);
    sem_unlink(name);
  }

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

  if ((sem_any = sem_open(SEM_ANY, O_CREAT | O_EXCL, 0666, 0)) == SEM_FAILED) {
    perror("any");
    exit(1);
  }
  if ((sem_full_priority = sem_open(SEM_FULL_PRIORITY, O_CREAT | O_EXCL, 0666,
                                    0)) == SEM_FAILED) {
    perror("full_priority");
    exit(1);
  }
  if ((sem_empty_priority = sem_open(SEM_EMPTY_PRIORITY, O_CREAT | O_EXCL, 0666,
                                     (K / 2) / (STR_LEN + 1))) == SEM_FAILED) {
    perror("empty_priority");
    exit(1);
  }
  if ((sem_mutex_priority = sem_open(SEM_MUTEX_PRIORITY, O_CREAT | O_EXCL, 0666,
                                     1)) == SEM_FAILED) {
    perror("mutex_priority");
    exit(1);
  }
  if ((sem_full_normal = sem_open(SEM_FULL_NORMAL, O_CREAT | O_EXCL, 0666,
                                  0)) == SEM_FAILED) {
    perror("full_normal");
    exit(1);
  }
  if ((sem_empty_normal = sem_open(SEM_EMPTY_NORMAL, O_CREAT | O_EXCL, 0666,
                                   (K / 2) / (STR_LEN + 1))) == SEM_FAILED) {
    perror("empty_normal");
    exit(1);
  }
  if ((sem_mutex_normal = sem_open(SEM_MUTEX_NORMAL, O_CREAT | O_EXCL, 0666,
                                   1)) == SEM_FAILED) {
    perror("mutex_normal");
    exit(1);
  }
  for (int i = 0; i < N; i++) {
    snprintf(name, sizeof name, SEM_ORDER, i);
    if ((sem_order[i] = sem_open(name, O_CREAT | O_EXCL, 0666,
                                 i == 0 ? 1 : 0)) == SEM_FAILED) {
      perror(name);
      exit(1);
    }
  }

  printf("Producers: %d  Consumers: %d  Buffer: %d  Priority chance: %d%%\n\n",
         N, M, K, PRIORITY_CHANCE);

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

  for (int i = 0; i < N + M; i++) {
    wait(NULL);
  }

  shm_unlink(SHM_NAME);
  sem_unlink(SEM_ANY);
  sem_unlink(SEM_FULL_PRIORITY);
  sem_unlink(SEM_EMPTY_PRIORITY);
  sem_unlink(SEM_MUTEX_PRIORITY);
  sem_unlink(SEM_FULL_NORMAL);
  sem_unlink(SEM_EMPTY_NORMAL);
  sem_unlink(SEM_MUTEX_NORMAL);

  for (int i = 0; i < N; i++) {
    snprintf(name, sizeof name, SEM_ORDER, i);
    sem_unlink(name);
  }

  return 0;
}
