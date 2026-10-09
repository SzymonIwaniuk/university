#include "common.h"

#include <math.h>
#include <sys/stat.h>
#include <sys/types.h>

buffer left, right, stereo, state;

void ts_add_ns(struct timespec *t, long ns) {
  t->tv_nsec += ns;
  while (t->tv_nsec >= NS_PER_SEC) {
    t->tv_nsec -= NS_PER_SEC;
    t->tv_sec++;
  }
}

void wait_period(struct timespec *next, long period_ns) {
  ts_add_ns(next, period_ns);
  clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, next, NULL);
}

void *slot(buffer *b, int i) {
  return (char *)b->data + (size_t)i * b->item_size;
}

int buffer_init(buffer *b, size_t item_size, int capacity) {
  if ((b->data = calloc((size_t)capacity, item_size)) == NULL) {
    return -1;
  }
  b->item_size = item_size;
  b->capacity = capacity;
  b->in = b->out = b->count = 0;
  if (pthread_mutex_init(&b->mutex, NULL) != 0) {
    free(b->data);
    return -1;
  }
  if (sem_init(&b->full, 0, 0) != 0) {
    pthread_mutex_destroy(&b->mutex);
    free(b->data);
    return -1;
  }
  return 0;
}

void buffer_put(buffer *b, const void *item) {
  int post = 0;
  pthread_mutex_lock(&b->mutex);
  memcpy(slot(b, b->in), item, b->item_size);
  b->in = (b->in + 1) % b->capacity;
  if (b->count < b->capacity) {
    b->count++;
    post = 1;
  } else {
    b->out = (b->out + 1) % b->capacity;
  }
  pthread_mutex_unlock(&b->mutex);
  if (post) {
    sem_post(&b->full);
  }
}

void buffer_get(buffer *b, void *item) {
  sem_wait(&b->full);
  pthread_mutex_lock(&b->mutex);
  memcpy(item, slot(b, b->out), b->item_size);
  b->out = (b->out + 1) % b->capacity;
  b->count--;
  pthread_mutex_unlock(&b->mutex);
}

void *camera_thread(void *arg) {
  buffer *out = arg;
  char tag = out == &left ? 'L' : 'R';

  unsigned int seed = (unsigned int)(time(NULL) ^ ((uintptr_t)out << 1));
  int n = 0;
  struct timespec next;
  clock_gettime(CLOCK_MONOTONIC, &next);
  if (out == &right) {
    ts_add_ns(&next, DELAY);
  }

  while (1) {
    frame f;
    f.frame_no = ++n;
    f.source = tag;
    clock_gettime(CLOCK_REALTIME, &f.ts);
    for (size_t i = 0; i < FRAME_DATA_SIZE; i++) {
      f.data[i] = (unsigned char)(rand_r(&seed) & 0xff);
    }
    buffer_put(out, &f);
    printf("[Camera %c] frame=%d ts=%ld.%09ld\n", tag, f.frame_no,
           (long)f.ts.tv_sec, f.ts.tv_nsec);
    fflush(stdout);
    wait_period(&next, CAMERA_PERIOD_NS);
  }
  return NULL;
}

void *sync_thread(void *arg) {
  (void)arg;
  frame l, r;
  int hl = 0, hr = 0, id = 0;

  while (1) {
    if (!hl) {
      buffer_get(&left, &l);
      hl = 1;
    }
    if (!hr) {
      buffer_get(&right, &r);
      hr = 1;
    }
    long d = (l.ts.tv_sec - r.ts.tv_sec) * NS_PER_SEC +
             (l.ts.tv_nsec - r.ts.tv_nsec);
    long ad = d < 0 ? -d : d;
    if (ad < MAX_DIFF_NS) {
      pair p;
      p.pair_id = ++id;
      p.left = l;
      p.right = r;
      p.dt_ms = (double)d / 1.0e6;
      buffer_put(&stereo, &p);
      printf("[Sync] pair=%d L=%d R=%d dt=%.2fms\n", p.pair_id, l.frame_no,
             r.frame_no, p.dt_ms);
      fflush(stdout);
      hl = hr = 0;
    } else if (d < 0) {
      hl = 0;
    } else {
      hr = 0;
    }
  }
  return NULL;
}

void *writer_thread(void *arg) {
  (void)arg;

  mkdir(FRAMES_DIR, 0755);

  struct timespec next;
  int n = 0;
  char path[256];

  clock_gettime(CLOCK_MONOTONIC, &next);

  while (1) {
    wait_period(&next, WRITER_PERIOD_NS);
    pair p;
    buffer_get(&stereo, &p);
    n++;

    FILE *f;
    snprintf(path, sizeof path, "%s/left_%04d.jpg", FRAMES_DIR, n);
    if ((f = fopen(path, "wb")) != NULL) {
      fprintf(f, "FRAME=%d SRC=L TS=%ld.%09ld DT=%.3fms\n", p.left.frame_no,
              (long)p.left.ts.tv_sec, p.left.ts.tv_nsec, p.dt_ms);
      fwrite(p.left.data, 1, FRAME_DATA_SIZE, f);
      fputc('\n', f);
      fclose(f);
    }

    snprintf(path, sizeof path, "%s/right_%04d.jpg", FRAMES_DIR, n);
    if ((f = fopen(path, "wb")) != NULL) {
      fprintf(f, "FRAME=%d SRC=R TS=%ld.%09ld DT=%.3fms\n", p.right.frame_no,
              (long)p.right.ts.tv_sec, p.right.ts.tv_nsec, p.dt_ms);
      fwrite(p.right.data, 1, FRAME_DATA_SIZE, f);
      fputc('\n', f);
      fclose(f);
    }
    printf("[Writer] saved pair=%04d (sync_id=%d)\n", n, p.pair_id);
    fflush(stdout);
  }
  return NULL;
}

void *state_thread(void *arg) {
  (void)arg;
  const double side = 10.0, speed = 5.0, half = side / 2.0;

  int seq = 0;
  double t = 0.0;
  double dt = (double)STATE_PERIOD_NS / 1.0e9;
  struct timespec next;
  clock_gettime(CLOCK_MONOTONIC, &next);

  while (1) {
    wait_period(&next, STATE_PERIOD_NS);
    double d = fmod(t * speed, 4.0 * side);
    int seg = (int)(d / side);
    double u = d - seg * side;

    robot_state s;
    s.seq = ++seq;
    clock_gettime(CLOCK_REALTIME, &s.ts);
    s.x = seg == 0 ? -half + u : seg == 1 ? half : seg == 2 ? half - u : -half;
    s.y = seg == 0 ? -half : seg == 1 ? -half + u : seg == 2 ? half : half - u;
    s.dir = "ENWS"[seg];

    buffer_put(&state, &s);
    t += dt;
  }
  return NULL;
}

void *logger_thread(void *arg) {
  (void)arg;
  FILE *f;
  struct timespec next;

  if ((f = fopen(LOG_PATH, "w")) == NULL) {
    perror("logger fopen");
    return NULL;
  }
  fprintf(f, "# seq, ts, x, y, dir\n");

  clock_gettime(CLOCK_MONOTONIC, &next);

  while (1) {
    wait_period(&next, LOGGER_PERIOD_NS);
    robot_state s;
    buffer_get(&state, &s);
    fprintf(f, "%d,%ld.%09ld,%.4f,%.4f,%c\n", s.seq, (long)s.ts.tv_sec,
            s.ts.tv_nsec, s.x, s.y, s.dir);
    fflush(f);
    printf("[Logger] seq=%d x=%.2f y=%.2f dir=%c\n", s.seq, s.x, s.y, s.dir);
    fflush(stdout);
  }
  return NULL;
}
