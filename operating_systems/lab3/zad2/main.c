#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  double x_start = atof(argv[1]);
  double x_end = atof(argv[2]);
  double array[2] = {x_start, x_end};
  double result;

  mkfifo("./send_array", 0666);
  mkfifo("./get_result", 0666);

  FILE *fifo_send = fopen("./send_array", "wb");

  fwrite(array, sizeof(double), 2, fifo_send);
  fclose(fifo_send);

  FILE *fifo_get = fopen("./get_result", "rb");

  fread(&result, sizeof(double), 1, fifo_get);
  fclose(fifo_get);

  printf("%f\n", result);
  return 0;
}
