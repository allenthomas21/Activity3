#include "ascii.h"
#include "sum.h"
#include<stdio.h>
#include<string.h>

int ascii();
int sum();

int main(){
    char str[100];
    printf("Enter the word: ");
    scanf("%s",str);
    ascii(str);
    sum(str);
    return 0;
}
