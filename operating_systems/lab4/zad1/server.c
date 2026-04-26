#include <stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>

struct message {
  char command[5];
  char content[128];
  int id;

} message;

int main(int argc, char *argv[]) {
  key_t key;
  int msgid;

  key = ftok(argv[0], 'k');

  msgid = msgget(key, 0666 | IPC_CREAT);

  while {
    msgrcv(msgid, &message, sizeof(message), 1, 0);
  }
}
