#include<unistd.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
extern int errno;
int main(){
	int res;
  res = execl("/bin/echo", "/bin/echo", "1", (char*) NULL);
  printf("%d\n", res);
  printf("Error reason: %s\n", strerror(errno));
  return 0;
}
