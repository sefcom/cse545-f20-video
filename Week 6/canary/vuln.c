#include<stdio.h>
#include<string.h>
#include<unistd.h>
#include<ctype.h>

void foo(){
  printf("abc");
  char vuln_buf[50];
  gets(vuln_buf);
}

int main(){
	setbuf(stdout, NULL);

  char vuln_buf[50];
  gets(vuln_buf);
  foo();
}
