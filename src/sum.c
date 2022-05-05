#include "ascii.h"
#include "sum.h"
#include<stdio.h>
#include<string.h>

int sum(char *a)
{ 
	int len=0,n,sum=0;
	len = strlen(a);
    for (n = 0; n < len; n++)
    {
        sum = sum + *a;
    }
    printf("\nSum of all characters : %X ",sum);
}

 
