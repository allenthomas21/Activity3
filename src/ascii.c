#include "ascii.h"
#include "sum.h"
#include<stdio.h>
#include<string.h>
int ascii(char *a)
{	int i=0;
	printf("ASCII values of each characters of given name: ");
    	while(a[i])
    	{
         	printf("%x ",a[i++]);
    	}
}
