#include <stdio.h>
#include <stdlib.h>
void main()
{
	int idade;
	char anos[8];
	printf("Sua idade: ");
	gets(anos);
	idade=atoi(anos);
	printf("Sua idade ‚ %i\n.",idade);
}
