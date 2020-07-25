#include <stdio.h>
void main()
{
	char nome[20];
	char cor[20];
	printf("Qual ‚ o seu nome ?  ");
	scanf("%s",nome);
	printf("Qual sua cor favorita ? ");
	scanf("%s",cor);
	printf("A cor favorita de %s ‚ %s.\n", nome, cor);
}
