#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int option = 0;
void handler(int sig) { printf("Handler called for signal %d\n", sig); }

void sig_default(int sig) { signal(sig, SIG_DFL); }

void sig_ignore(int sig) { signal(sig, SIG_IGN); }

void sig_handle(int sig) { signal(sig, handler); }

void sig_mask(int sig) {
  // signal set
  sigset_t mask;
  sigemptyset(&mask);
  sigaddset(&mask, sig);
  // signals in set are blocked
  sigprocmask(SIG_BLOCK, &mask, NULL);
}

void sig_unblock(int sig) {
  sigset_t mask;
  sigemptyset(&mask);
  sigaddset(&mask, sig);
  sigprocmask(SIG_UNBLOCK, &mask, NULL);
}

void au(int sig, siginfo_t *info, void *ucontext) {
  option = info->si_value.sival_int;
}

int main(int argc, char *argv[]) {
  // config structure
  struct sigaction act;
  act.sa_sigaction = au;
  // set which signals should be blocked during handler
  sigemptyset(&act.sa_mask);
  act.sa_flags = SA_SIGINFO;
  // handler for signal SIGUSR2
  sigaction(SIGUSR2, &act, NULL);

  pause();

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
