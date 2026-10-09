#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <sys/types.h>
#include <unistd.h>

#define INIT "INIT"
#define CONN "CONN"
#define MSG "MSG"

typedef struct message {
  long msg_type;
  char header[8];
  char content[128];
  int id;
} message;
