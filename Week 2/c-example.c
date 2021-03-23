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

void initII(Book book){
  book.id = 2;
  strcpy(book.name, "Chamber of Secrets");
  strcpy(book.author, "J.K. Rowling");
  book.nPages = 251;
}

// What's the type of book should I put here?
void initIII(Book *book){
  book -> id = 3;
  strcpy(book -> name, "Prisoner of Azkaban");
  strcpy(book -> author, "J.K. Rowling");
  book -> nPages = 317;
}

int main(){
  Book harryPotterI, harryPotterII;
  initI(&harryPotterI);
  initII(harryPotterII);

  printf("Book I's name: Harry Potter and the %s\n", harryPotterI.name);
  printf("Book II's name: Harry Potter and the %s\n", harryPotterII.name);
  
  Book *harryPotterIII;
  harryPotterIII = (Book*) malloc(sizeof(Book)); // what if we comment this out?
  initIII(harryPotterIII);  // what's the type of harryPotterIII?
  printf("Book III's name: Harry Potter and the %s\n", harryPotterIII -> name);

  free(harryPotterIII);
  return 0;
}
