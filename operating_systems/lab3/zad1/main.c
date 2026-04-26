#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#define MIN(a, b) (((a) < (b)) ? (a) : (b))

double function(double x) { return 4 / (x * x + 1); }

double area(double x_start, double width) {
  double xk = MIN(1, x_start + width);
  double yk = function(xk);
  return yk * width;
}

void k_integral(int k, double width, double res[2]) {
  struct timespec start, end;
  clock_gettime(CLOCK_MONOTONIC, &start);

  double result = 0;
  long long rec_count = (long long)(1 / width);
  long long rec_per_process = rec_count / k;

  pid_t pid_table[k];
  int fd[k][2];

  for (int i = 0; i < k; i++) {
    pipe(fd[i]);
    int pid = fork();

    if (pid == 0) {
      for (int j = 0; j <= i; j++) {
        close(fd[j][0]);
      }

      long long start_rec = i * rec_per_process;
      long long end_rec = (i == k - 1) ? rec_count : (i + 1) * rec_per_process;

      double tmp = 0.0;
      for (long long j = start_rec; j < end_rec; j++) {
        tmp += area(j * width, width);
      }

      write(fd[i][1], &tmp, sizeof(tmp));
      close(fd[i][1]);
      exit(0);

    } else {
      pid_table[i] = pid;
      close(fd[i][1]);
    }
  }

  for (int i = 0; i < k; i++) {
    waitpid(pid_table[i], NULL, 0);
  }

  for (int i = 0; i < k; i++) {
    double child_val;
    read(fd[i][0], &child_val, sizeof(child_val));
    result += child_val;
    close(fd[i][0]);
  }

  clock_gettime(CLOCK_MONOTONIC, &end);
  double dif =
      (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

  res[0] = result;
  res[1] = dif;
}

int main(int argc, char *argv[]) {
  double width = atof(argv[1]);
  int n = atoi(argv[2]);
  double res[2];

  for (int k = 1; k <= n; k++) {
    k_integral(k, width, res);
    printf("k = %d res = %.10f time = %.6f \n", k, res[0], res[1]);
  }

  return 0;
}
