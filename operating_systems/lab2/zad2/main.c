#define _POSIX_C_SOURCE 199309L
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  int option;

  if (strcmp(argv[1], "default") == 0) {
    option = 1;
  } else if (strcmp(argv[1], "ignore") == 0) {
    option = 2;
  } else if (strcmp(argv[1], "handle") == 0) {
    option = 3;
  } else if (strcmp(argv[1], "mask") == 0) {
    option = 4;
  } else {
    return -1;
  }

  int child_pid = fork();
  if (child_pid == 0) {
    execl("./child", "child", NULL);
    exit(1);
  }

  sleep(1);
  union sigval value;
  value.sival_int = option;
  sigqueue(child_pid, SIGUSR2, value);
  wait(NULL);
}
