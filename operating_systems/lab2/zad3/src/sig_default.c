#include <signal.h>
#include <stdio.h>

void sig_default(int sig) { signal(sig, SIG_DFL); }
