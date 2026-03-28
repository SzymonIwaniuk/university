#include "definitions.h"
#include <sys/file.h>

int main(int argc, char *argv[]) {
  int M = atoi(argv[1]);
  char buffer[50];
  FILE *fptr = fopen(OUTPUT_FILE, "a+");

  flock(fileno(fptr), LOCK_EX);

  for (int j = 0; j < M; j++) {
    // append to file
    int len = sprintf(buffer, "Potomek (PID: (%d))\n", getpid());
    // 1 - rozmiar elementów w bajtach
    fwrite(buffer, 1, len, fptr);
    // wypycha dane do os
    fflush(fptr);
  }
  flock(fileno(fptr), LOCK_UN);
  fclose(fptr);
  return 0;
}
