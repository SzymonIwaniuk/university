#include <signal.h>
void sig_ignore(int sig) { signal(SIGUSR1, SIG_IGN); }
