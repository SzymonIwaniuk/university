#include <signal.h>
void sig_mask(int sig) {
  signal(sig, SIG_IGN);
  sigset_t mask;
  sigemptyset(&mask);
  sigaddset(&mask, sig);
  sigprocmask(SIG_BLOCK, &mask, NULL);
}
