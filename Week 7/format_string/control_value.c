// gcc ./arbitrary_write.c -o arbitrary_write.o

#include<stdio.h>
int main(){
  char buf[] = "%0200x%0200x%0200x%0200x%0200x%13$n\npadd\x88\xdd\xff\xff\xff\x7f\x00\x00";
  int n, m = 1;
  printf(buf);
  printf("%1$010d", 10);
  printf("n = %d", n);
  printf("m = %d", m);
  return 0;
}
