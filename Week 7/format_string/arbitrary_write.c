// gcc ./arbitrary_write.c -o arbitrary_write.o

#include<stdio.h>
int main(){
  int n, m;
  printf("hello%n%n\n", &m, &n);
  printf("n = %d\n", n);
  printf("m = %d\n", m);
  return 0;
}
