// compile with -no-pie
// gcc ./gym.c -no-pie -g -o ./gym
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define MALLOC "m"
#define FREE "f"
#define LIST "l"
#define EDIT "e"
#define EXIT "exit"

#define FREED 0
#define UNDERUSE 1

void* ptrs[100];
int used[100] = {0};
int request_size[100] = {0};
int cnt = 0;

void print_menu(){
  char *MENU[6] = {
    "Choose from the following menu:\n",
    "0. [exit]\n",
    "1. [m]alloc with size, e.g. m 2\n",
    "2. [f]ree with index, e.g, f 1\n",
    "3. [e]dit allocated chunk's content, e.g, e 2\n",
    "4. [l]ist all pointers, e.g, l\n"};

  //scanf("%d", &cnt);
  // printf(stdout, "%s", MENU_HEAD);
  for(int i = 0; i < 6; i++)
    fprintf(stderr, "%s", MENU[i]);
  /*fprintf(stderr, "%s", MENU_2);*/
  /*fprintf(stderr, "%s", MENU_3);*/
}

void act_malloc(int n){
  fprintf(stderr, "Allocating %d bytes\n", n);
  ptrs[cnt] = malloc(n);
  used[cnt] = UNDERUSE;
  request_size[cnt] = n;
  cnt++;
}

void act_free(int n){
  if (used[n] == FREED)
    return;
  fprintf(stderr, "Freeing pointer %d: %p\n", n, ptrs[n]);
  free(ptrs[n]);
  used[n] = FREED;
}

void act_edit(int n, char *s, int len){
  if (used[n] == FREED)
    return;
  /*fprintf(stderr, "Editing pointer %d: %p\n", n, ptrs[n]);*/
  /*fprintf(stderr, "New string length %d\n", len);*/
  int l1 = strlen(ptrs[n]);
  int l2 = len;
  int l;
  if (l1 < l2) l = l2;
  else l = l1;
  memcpy(ptrs[n], s, l);
}

void list_ptrs(){
  fprintf(stderr, "Index\tPointers\tRequested Size\tStatus\n");
  for (int i = 0; i < cnt; i++){
    fprintf(stderr, "%d\t%p\t%u\t", i, ptrs[i], request_size[i]);
    if (used[i] == UNDERUSE)
      fprintf(stderr, "Under Use\n");
    else if (used[i] == FREED)
      fprintf(stderr, "Freed\n");
  }
}

void win(){
  fprintf(stderr, "You Win!\n");
  exit(0);
}

int main(){
  char buf[100];
  char str[100];
  int n;
  setbuf(stderr, NULL);
  while (1){
    print_menu();
    ssize_t l = read(0, buf, 90);
    if (strstr(buf, MALLOC) || buf[0] == '1'){
      sscanf(buf + sizeof(MALLOC), "%d", &n);
      act_malloc(n);
    }
    else if (strstr(buf, FREE) || buf[0] == '2'){
      sscanf(buf + sizeof(FREE), "%d", &n);
      act_free(n);
    }
    else if (strstr(buf, EDIT) || buf[0] == '3'){
      // e 0 aaaa
      char *first_space = strstr(buf, " ");
      char *second_space = strstr(first_space + 1, " ");
      int str_len = l - (second_space - buf) - 2;
      sscanf(buf + sizeof(EDIT), "%d %[^\n]", &n, str);
      if (used[n] == UNDERUSE)
        act_edit(n, second_space+1, str_len);
      else
        fprintf(stderr, "pointer cannot be edited\n");
    }
    else if (strstr(buf, LIST) || buf[0] == '4')
      list_ptrs();
    else if (strstr(buf, EXIT) || buf[0] == '0')
      break;
    else continue;
  }
  return 0;
}
