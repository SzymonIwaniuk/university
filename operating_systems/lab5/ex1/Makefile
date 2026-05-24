CC      = gcc
CFLAGS  = -Wall -Wextra -g

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
    LDFLAGS =
else
    LDFLAGS = -lpthread -lrt
endif
TARGET  = main

.PHONY: all clean

all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

clean:
	rm -f $(TARGET)
