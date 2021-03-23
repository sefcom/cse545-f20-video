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

void initI(Book *book){
  book -> id = 1;
  strcpy(book -> name, "Philosopher's Stone");
  strcpy(book -> author, "J.K. Rowling");
  book -> nPages = 223;
}

int main(){
  Book harryPotterI = {0};
  initI(&harryPotterI);
  printf("Book I's name: Harry Potter and the %s\n", harryPotterI.name);
  return 0;
}
