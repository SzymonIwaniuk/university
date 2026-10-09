#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

void handler(int sig) { printf("Handler called for signal %d\n", sig); }
void sig_default(int sig) { signal(sig, SIG_DFL); }
void sig_ignore(int sig) { signal(sig, SIG_IGN); }

void sig_handle(int sig) { signal(sig, handler); }
void sig_mask(int sig) {
  sigset_t mask;
  sigemptyset(&mask);
  sigaddset(&mask, sig);
  sigprocmask(SIG_BLOCK, &mask, NULL);
}

void sig_unblock(int sig) {
  sigset_t mask;
  sigemptyset(&mask);
  sigaddset(&mask, sig);
  sigprocmask(SIG_UNBLOCK, &mask, NULL);
}

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

  switch (option) {
  case 1:
    sig_default(SIGUSR1);
    break;

  case 2:
    sig_ignore(SIGUSR1);
    break;

  case 3:
    sig_handle(SIGUSR1);
    break;

  case 4:
    sig_mask(SIGUSR1);
    break;
  }

  int n = 20;
  for (int i = 1; i <= n; i++) {
    printf("%d\n", i);

    if (i == 5 || i == 15) {
      printf("Sending USR1 signal\n");
      raise(SIGUSR1);
    }

    if (i == 10) {
      sigset_t pending;
      sigpending(&pending);
      int is_pending = sigismember(&pending, SIGUSR1);
      if (is_pending) {
        printf("Unblocking USR1\n");
        sig_unblock(SIGUSR1);
      }
    }

    usleep(250000);
  }

  printf("Loop executed completely\n");
  return 0;
}
