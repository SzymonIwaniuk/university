#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  int N = atoi(argv[1]);
  const char *M = argv[2];

  for (int i = 0; i < N; i++) {
    int child_pid = fork();
    if (child_pid == 0) {
      // path, name of script, passed char, NULL <- program know where args end
      execl("./child", "child", M, NULL);
      exit(1);
    }
  }

  for (int i = 0; i < N; i++) {
    wait(NULL);
  }

  printf("Rodzic (PID: (%d))\n", getpid());
  return 0;
}
