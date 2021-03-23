// gcc -o test_buf.o -g ./test_buf.c
#include <stdio.h>

int main(){
  char buf[] = "%llx %llx %llx %llx %llx %llx %llx %llx\n";

  printf(buf);
  return 0;

}
