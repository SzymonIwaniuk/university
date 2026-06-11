#include "common.h"

int main(void) {
  if (buffer_init(&left, sizeof(frame), CAMERA_BUF) == -1) {
    perror("buffer_init left camera");
    exit(1);
  }
  if (buffer_init(&right, sizeof(frame), CAMERA_BUF) == -1) {
    perror("buffer_init right camera");
    exit(1);
  }
  if (buffer_init(&stereo, sizeof(pair), STEREO_BUF) == -1) {
    perror("buffer_init stereo");
    exit(1);
  }
  if (buffer_init(&state, sizeof(robot_state), STATE_BUF) == -1) {
    perror("buffer_init state");
    exit(1);
  }

  pthread_t th[6];
  if (pthread_create(&th[0], NULL, camera_thread, &left) != 0) {
    perror("pthread_create camera left");
    exit(1);
  }
  if (pthread_create(&th[1], NULL, camera_thread, &right) != 0) {
    perror("pthread_create camera right");
    exit(1);
  }
  if (pthread_create(&th[2], NULL, sync_thread, NULL) != 0) {
    perror("pthread_create sync");
    exit(1);
  }
  if (pthread_create(&th[3], NULL, writer_thread, NULL) != 0) {
    perror("pthread_create writer");
    exit(1);
  }
  if (pthread_create(&th[4], NULL, state_thread, NULL) != 0) {
    perror("pthread_create state");
    exit(1);
  }
  if (pthread_create(&th[5], NULL, logger_thread, NULL) != 0) {
    perror("pthread_create logger");
    exit(1);
  }

  for (int i = 0; i < 6; i++) {
    pthread_join(th[i], NULL);
  }

  return 0;
}
