CC      = gcc
CFLAGS  = -Wall -Wextra -O2 -g -pthread

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
    LDFLAGS = -lpthread -lm
else
    LDFLAGS = -lpthread -lrt -lm
endif

.PHONY: all clean run

all: program1

common.o: common.c common.h
	$(CC) $(CFLAGS) -c common.c -o common.o

program1.o: program1.c common.h
	$(CC) $(CFLAGS) -c program1.c -o program1.o

program1: common.o program1.o
	$(CC) $^ -o $@ $(LDFLAGS)

run: program1
	./program1

clean:
	rm -f *.o program1
	rm -rf frames robot_state.log
