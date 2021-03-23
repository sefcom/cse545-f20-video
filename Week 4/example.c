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
  Book harryPotterI;
  int answer = 0;
  initI(&harryPotterI);

  printf("Book I's name: Harry Potter and the %s\n", harryPotterI.name);
  // printf("Book II's name: Harry Potter and the %s\n", harryPotterII.name);
  //
  printf("How many pages in this book?\n");
  scanf("%d", &answer);
  if (answer == harryPotterI.nPages)
    printf("You are correct! Your key is CSE545{Good Job}\n");
  else
    printf("You are wrong! Keep going!\n");
  return 0;
}
