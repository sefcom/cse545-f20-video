#include<string.h>


#define D "a"

int main(){

  char *a = "a b c";

  printf("%s\n", strstr(a + sizeof(D), " "));

}
