#include<stdio.h>
#include<stdlib.h>

int main(){

  void * ptr[10];

  for(int i = 0; i < 10; i++)
    ptr[i] = malloc(10);

  for(int i = 0; i < 10; i++)
    free(ptr[i]);

  return 0;
}



