FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install tzdata -y && apt install net-tools vim man file -y
RUN apt-get install -y build-essential
RUN yes| unminimize

WORKDIR /home/ubuntu

RUN mkdir -p src bin

COPY ex1/main.c ./src/ex1.c
COPY ex2/main.c ./src/ex2.c
COPY ex3/main.c ./src/ex3.c

RUN gcc src/ex1.c -o bin/ex1 -lpthread -lrt
RUN gcc src/ex2.c -o bin/ex2 -lpthread -lrt
RUN gcc src/ex3.c -o bin/ex3 -lpthread -lrt

CMD ["/bin/bash"]
