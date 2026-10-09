#include <signal.h>
#include <stdio.h>
void handler(int sig) { printf("Handler called for signal %d\n", sig); }
void sig_handle(int sig) { signal(sig, handler); }
