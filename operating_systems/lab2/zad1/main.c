#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

void sig_default(int sig) {}
void sig_ignore(int sig) {}
void sig_handle(int sig) {}
void sig_mask(int sig) {}

int main(int argc, char *argv[]) {
  int option;
  if (strcmp(argv[1], "default")) {
    option = 1;
  } else if (strcmp(argv[1], "ignore")) {
    option = 2;
  } else if (strcmp(argv[1], "handle")) {
    option = 3;
  } else if (strcmp(argv[1], "mask")) {
    option = 4;
  } else {
    return -1;
  }

  int n = 20;
  for (int i = 0;; i++) {
  }
  switch (option) {
  case 1:
    signal(SIGUSR1, sig_default);
  case 2:
    signal(SIGUSR1, sig_ignore);
  case 3:
    signal(SIGUSR1, sig_handle);
  case 4:
    signal(SIGUSR1, sig_mask);
  }
