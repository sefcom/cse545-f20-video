#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

extern int errno;

int main(){
        int result;
        result = setuid(0);
        printf("Result: %d\n", result);
        printf("Error reason: %s\n", strerror(errno));
}
