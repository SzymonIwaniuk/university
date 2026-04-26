#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

#define MIN(a, b) (((a) < (b)) ? (a) : (b))
#define PROCESSES_COUNT 10
#define WIDTH 0.00001

double function(double x) { return 4.0 / (x * x + 1.0); }

double area(double x_start, double x_end) {
  double xk = MIN(x_end, x_start + WIDTH);
  double yk = function(xk);
  return yk * WIDTH;
}

double integral(double x_start, double x_end) {
  double result = 0.0;
  long long rec_count = (long long)((x_end - x_start) / WIDTH);
  long long rec_per_process = rec_count / PROCESSES_COUNT;

  pid_t pid_table[PROCESSES_COUNT];
  int fd[PROCESSES_COUNT][2];

  for (int i = 0; i < PROCESSES_COUNT; i++) {
    pipe(fd[i]);
    int pid = fork();

    if (pid == 0) {
      for (int j = 0; j <= i; j++) {
        close(fd[j][0]);
      }

      long long start_rec = i * rec_per_process;
      //
      long long end_rec =
          (i == PROCESSES_COUNT - 1) ? rec_count : (i + 1) * rec_per_process;

      double tmp = 0.0;
      for (long long j = start_rec; j < end_rec; j++) {
        tmp += area(x_start + (j * WIDTH), x_end);
      }

      write(fd[i][1], &tmp, sizeof(tmp));
      close(fd[i][1]);
      exit(0);

    } else {
      pid_table[i] = pid;
      close(fd[i][1]);
    }
  }

  for (int i = 0; i < PROCESSES_COUNT; i++) {
    double child_val;
    read(fd[i][0], &child_val, sizeof(child_val));
    result += child_val;
    close(fd[i][0]);
  }

  for (int i = 0; i < PROCESSES_COUNT; i++) {
    waitpid(pid_table[i], NULL, 0);
  }

  return result;
}

int main() {
  double array[2];
  double result;

  FILE *fifo_in = fopen("./send_array", "rb");
  fread(array, sizeof(double), 2, fifo_in);
  fclose(fifo_in);

  result = integral(array[0], array[1]);

  FILE *fifo_out = fopen("./get_result", "wb");
  fwrite(&result, sizeof(double), 1, fifo_out);
  fclose(fifo_out);

  return 0;
}
