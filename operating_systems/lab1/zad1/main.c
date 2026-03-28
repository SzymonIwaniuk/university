#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#define M 5
int zmiennaGlobalna = 0;

int main(int argc, char *argv[]) {
  int N = atoi(argv[1]);
  int pid;

  for (int i = 0; i < N; i++) {
    pid = vfork();

    if (pid == 0) {
      zmiennaGlobalna++;
      for (int j = 0; j < M; j++) {
        printf("Potomek (PID: (%d))\n", getpid());
        sleep(1);
      }

      exit(0);
    }
  }

  for (int i = 0; i < N; i++) {
    wait(NULL);
  }

  printf("\nRodzic (%d) zmiennaGlobalna=(%d)\n", getpid(), zmiennaGlobalna);
  return 0;
}
