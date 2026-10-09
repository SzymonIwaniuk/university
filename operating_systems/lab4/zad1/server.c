#include "clserv.h"

int main(int argc, char *argv[]) {
  (void)argc;

  int max_clients = atoi(argv[1]);
  key_t server_key;
  int server_msgid;

  if ((server_key = ftok("server", 'K')) == -1) {
    perror("server ftok");
    exit(1);
  }

  if ((server_msgid = msgget(server_key, 0644 | IPC_CREAT)) == -1) {
    perror("server msgget");
    exit(1);
  }

  int clients_msgids[max_clients];
  int client_count = 0;
  size_t payload_size = sizeof(message) - sizeof(long);
  message recieve_msg;
  printf("Server started waiting for messages\n");

  while (1) {
    if (msgrcv(server_msgid, &recieve_msg, payload_size, 1, 0) > 0) {

      if (strcmp(recieve_msg.header, INIT) == 0) {
        if (client_count >= max_clients) {
          printf("Too many clients\n");
          continue;
        }

        key_t client_key;
        int client_msgid;

        if ((client_key = ftok("server", recieve_msg.id)) == -1) {
          perror("client ftok");
          continue;
        }

        if ((client_msgid = msgget(client_key, 0644 | IPC_CREAT)) == -1) {
          perror("client msgget");
          continue;
        }

        clients_msgids[client_count] = client_msgid;

        message send_msg;
        send_msg.msg_type = 1;
        strcpy(send_msg.header, CONN);
        send_msg.id = client_count;
        msgsnd(client_msgid, &send_msg, payload_size, 0);

        printf("New client connected %d\n", client_count);
        fflush(stdout);
        client_count++;

      } else if (strcmp(recieve_msg.header, MSG) == 0) {

        for (int i = 0; i < client_count; i++) {

          if (i != recieve_msg.id) {
            msgsnd(clients_msgids[i], &recieve_msg, payload_size, 0);
          }
        }

        printf("Broadcasted message from client %d\n", recieve_msg.id);
        fflush(stdout);

      } else {
        printf("Malformed message");
        fflush(stdout);
        continue;
      }
    }
  }

  return 0;
}
