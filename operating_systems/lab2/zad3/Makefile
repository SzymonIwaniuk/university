CC = gcc
CFLAGS = -Wall -fPIC

SRC_DIR = src
BIN_DIR = bin
LIB_DIR = lib

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(SRC_DIR)/sig_default.o $(SRC_DIR)/sig_ignore.o $(SRC_DIR)/sig_handle.o $(SRC_DIR)/sig_mask.o
TARGET = $(BIN_DIR)/main
CHILD = $(BIN_DIR)/child
LIB_STATIC = $(LIB_DIR)/libsignals.a
LIB_SHARED = $(LIB_DIR)/libsignals.so

all: dirs static shared dynamic

dirs:
	@mkdir -p $(BIN_DIR) $(LIB_DIR)

$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

$(LIB_STATIC): $(OBJS)
	ar rcs $(LIB_STATIC) $(OBJS)

$(LIB_SHARED): $(OBJS)
	$(CC) -shared -o $(LIB_SHARED) $(OBJS)

static: dirs $(LIB_STATIC)
	$(CC) -o $(TARGET) $(SRC_DIR)/main.c
	$(CC) $(CFLAGS) -o $(CHILD) $(SRC_DIR)/child.c -L$(LIB_DIR) -lsignals

shared: dirs $(LIB_SHARED)
	$(CC) -o $(TARGET) $(SRC_DIR)/main.c
	$(CC) $(CFLAGS) -o $(CHILD) $(SRC_DIR)/child.c -L$(LIB_DIR) -lsignals -Wl,-rpath,'$$ORIGIN/../lib'

dynamic: dirs $(LIB_SHARED)
	$(CC) -o $(TARGET) $(SRC_DIR)/main.c
	$(CC) $(CFLAGS) -DDYNAMIC_LOAD -o $(CHILD) $(SRC_DIR)/child.c -ldl

clean:
	rm -f $(SRC_DIR)/*.o
	rm -rf $(BIN_DIR) $(LIB_DIR)
