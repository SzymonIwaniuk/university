#ifndef SIGNALS_H
#define SIGNALS_H
void handler(int sig);
void sig_default(int sig);
void sig_ignore(int sig);
void sig_handle(int sig);
void sig_mask(int sig);
#endif
