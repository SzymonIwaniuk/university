#ifndef COMMON_H
#define COMMON_H

#define _POSIX_C_SOURCE 200809L

#include <pthread.h>
#include <semaphore.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#define NS_PER_SEC 1000000000L
#define FRAME_DATA_SIZE 32

#define CAMERA_PERIOD_NS 40000000L
#define WRITER_PERIOD_NS 100000000L
#define STATE_PERIOD_NS 10000000L
#define LOGGER_PERIOD_NS 100000000L
#define MAX_DIFF_NS 20000000L
#define CAMERA_BUF 8
#define STEREO_BUF 8
#define STATE_BUF 16
#define FRAMES_DIR "frames"
#define LOG_PATH "robot_state.log"
#define DELAY 15000000L

// Structs
typedef struct {
  int frame_no;
  struct timespec ts;
  char source;
  unsigned char data[FRAME_DATA_SIZE];
} frame;

typedef struct {
  int pair_id;
  frame left;
  frame right;
  double dt_ms;
} pair;

typedef struct {
  int seq;
  struct timespec ts;
  double x, y;
  char dir;
} robot_state;

typedef struct {
  void *data;
  size_t item_size;
  int capacity;
  int in;
  int out;
  int count;
  pthread_mutex_t mutex;
  sem_t full;
} buffer;

extern buffer left, right, stereo, state;

// functions
void *camera_thread(void *arg);
void *sync_thread(void *arg);
void *writer_thread(void *arg);
void *state_thread(void *arg);
void *logger_thread(void *arg);
int buffer_init(buffer *b, size_t item_size, int capacity);
void buffer_put(buffer *b, const void *item);
void buffer_get(buffer *b, void *item);
void ts_add_ns(struct timespec *t, long ns);
void wait_period(struct timespec *next, long period_ns);

#endif
