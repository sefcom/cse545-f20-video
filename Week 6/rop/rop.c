#include<stdio.h>
#include<unistd.h>

int main(){
  execve("/bin/bash", NULL, NULL);
}
