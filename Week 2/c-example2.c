#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct s_book
{
    int id;
    char name[50];
    char author[50];
    int nPages;
} Book;

void initII(Book book){
  book.id = 2;
  strcpy(book.name, "Chamber of Secrets");
  strcpy(book.author, "J.K. Rowling");
  book.nPages = 251;
}

int main(){
  Book harryPotterII = {0};
  initII(harryPotterII);
  printf("Book II's name: Harry Potter and the %s\n", harryPotterII.name);
  return 0;
}
