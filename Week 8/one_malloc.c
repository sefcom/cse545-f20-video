#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>

int main(){
  void * p[10];
  for (int i = 0; i < 10; i++){
    p[i] = malloc(10);
    memset(p[i], '0' + i, 10);
  }
  return 0;
}
