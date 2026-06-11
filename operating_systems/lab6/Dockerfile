FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install tzdata -y && apt install net-tools vim man file make -y
RUN apt-get install -y build-essential
RUN yes| unminimize

WORKDIR /home/ubuntu

RUN mkdir -p src/ex1 bin

COPY ex1/common.h ex1/common.c ex1/program1.c ./src/ex1/

RUN gcc -Wall -Wextra -O2 -g -pthread \
    src/ex1/common.c src/ex1/program1.c \
    -o bin/ex1 -lpthread -lrt -lm

CMD ["/bin/bash"]
