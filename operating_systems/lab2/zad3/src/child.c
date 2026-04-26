#define _GNU_SOURCE
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#ifdef DYNAMIC_LOAD
#include <dlfcn.h>
void *lib_handle;
void (*sig_default)(int);
void (*sig_ignore)(int);
void (*sig_handle)(int);
void (*sig_mask)(int);
#else
void sig_default(int sig);
void sig_ignore(int sig);
void sig_handle(int sig);
void sig_mask(int sig);
#endif

int option = 0;

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
#ifdef DYNAMIC_LOAD
  lib_handle = dlopen("../lib/libsignals.so", RTLD_LAZY);
  if (!lib_handle) {
    return -1;
  }

  sig_default = dlsym(lib_handle, "sig_default");
  sig_ignore = dlsym(lib_handle, "sig_ignore");
  sig_handle = dlsym(lib_handle, "sig_handle");
  sig_mask = dlsym(lib_handle, "sig_mask");
#endif

  struct sigaction act;
  act.sa_sigaction = au;
  sigemptyset(&act.sa_mask);
  act.sa_flags = SA_SIGINFO;
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
#ifdef DYNAMIC_LOAD
  dlclose(lib_handle);
#endif
  return 0;
}
