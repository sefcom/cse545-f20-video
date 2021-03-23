#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#define CHECK 1
#define LOG 2
#define EXIT 3

char menu[3][30] = {"Check Participation", "Log Participation", "Exit"};

void print_greeting(){
  printf("Welcome to CSE545 In-class Lab 1\n");
}

void print_menu(){
  for (int i = 0; i < 3; i++)
    printf("%d. %s\n", i + 1, menu[i]);
  printf("Please select from menu: ");
  fflush(stdout);
}


int validate(){
  time_t t;
  int a, b, c, result = 1;
  char *buf = NULL;
  size_t size = 0;
  srand((unsigned)time(&t));
  return 1;
}


void record(char id[15]){
  char command[50] = {};
  sprintf(command, "touch records/%s", id);
  printf("id: %s\n", id);
  printf("command: %s\n", command);
  system(command);
}

void check(char* id){
	char path[50] = {};
	sprintf(path, "records/%s", id);
	printf("path: %s\n", path);
	execl("/bin/cat", "/bin/cat", path, NULL);
}


void interaction(){
  int n;
  char *buf = NULL;
  size_t size = 0;
  ssize_t len;
  char asuid[15] = {};
  while(1){
    print_menu();
    getline(&buf, &size, stdin);
    n = atoi(buf);

    switch(n){
      case LOG:
        if (validate() == 1){
          printf("Your ASUID: ");
          fflush(stdout);
          fgets(asuid, 15, stdin);
          record(asuid);
          printf("You got it!\n");
        }
        else{
          printf("Verification error\n");
          return;
        }
        break;
      case CHECK:
          printf("Your ASUID: ");
          fflush(stdout);
          len = getline(&buf, &size, stdin);
	  buf[len - 1] = 0;
	check(buf);
	break;
      case EXIT:
        printf("Bye!\n");
        return;
      default:
        printf("Wrong menu selection\n");
    }
  }
}


int main(){
  print_greeting();
  interaction();
  return 0;
}
