#include "clserv.h"

void connect_to_server(int server_msgid, pid_t client_pid,
                       size_t payload_size) {
  message msg;
  msg.msg_type = 1;
  strcpy(msg.header, INIT);
  msg.id = client_pid;

  msgsnd(server_msgid, &msg, payload_size, 0);
}

void send_message(int server_msgid, int client_id, size_t payload_size,
                  char *content) {
  message msg;
  msg.msg_type = 1;
  strcpy(msg.header, MSG);
  msg.id = client_id;

  strncpy(msg.content, content, sizeof(msg.content) - 1);
  msgsnd(server_msgid, &msg, payload_size, 0);
}

int main(void) {
  int server_msgid;
  key_t server_key;
  pid_t client_pid = getpid();

  // connect to server queue
  if ((server_key = ftok("server", 'K')) == -1) {
    perror("server ftok");
    exit(1);
  }

  if ((server_msgid = msgget(server_key, 0644)) == -1) {
    perror("server msgget");
    exit(1);
  }

  key_t client_key;
  int client_msgid;

  // create client queue
  if ((client_key = ftok("server", client_pid)) == -1) {
    perror("client ftok");
    exit(1);
  }

  if ((client_msgid = msgget(client_key, 0644 | IPC_CREAT)) == -1) {
    perror("client msgget");
    exit(1);
  }

  size_t payload_size = sizeof(message) - sizeof(long);
  char input_buffer[128];
  int client_id = -1;
  message msg;

  // handle init before fork
  while (client_id == -1) {
    printf("Write %s to connect to server\n", INIT);

    if (fgets(input_buffer, sizeof(input_buffer), stdin) != NULL) {
      input_buffer[strcspn(input_buffer, "\n")] = 0;

      if (strcmp(input_buffer, INIT) == 0) {
        connect_to_server(server_msgid, client_pid, payload_size);
      }

      if (msgrcv(client_msgid, &msg, payload_size, 1, 0) > 0 &&
          strcmp(msg.header, CONN) == 0) {
        client_id = msg.id;
        printf("Assigned client ID: %d\n", client_id);
      }
    }

    pid_t child = fork();

    if (child == 0) {
      // Listener
      while (1) {
        if (msgrcv(client_msgid, &msg, payload_size, 1, 0) > 0) {
          if (strcmp(msg.header, MSG) == 0) {
            printf("Client %d: %s\n", msg.id, msg.content);
            fflush(stdout);
          }
        }
      }
    } else {
      // Typer
      while (1) {
        if (fgets(input_buffer, sizeof(input_buffer), stdin) != NULL) {
          input_buffer[strcspn(input_buffer, "\n")] = 0;
          send_message(server_msgid, client_id, payload_size, input_buffer);
        }
      }
    }

    return 0;
  }
}
