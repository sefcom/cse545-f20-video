#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct s_book{
    int id;
    char name[50];
    char author[50];
    int nPages;
} Book;

// What's the type of book should I put here?
void initIII(Book *book){
  book -> id = 3;
  strcpy(book -> name, "Prisoner of Azkaban");
  strcpy(book -> author, "J.K. Rowling");
  book -> nPages = 317;
}

int main(){
  Book *harryPotterIII;
  harryPotterIII = (Book*) malloc(sizeof(Book));
  initIII(harryPotterIII);
  printf("Book III's name: Harry Potter and the %s\n", harryPotterIII -> name);
  free(harryPotterIII);
  return 0;
}
