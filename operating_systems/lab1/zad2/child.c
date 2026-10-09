#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  int M = atoi(argv[1]);

  for (int j = 0; j < M; j++) {
    printf("Potomek (PID: (%d))\n", getpid());
    sleep(1);
  }

  return 0;
}
