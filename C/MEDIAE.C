#include <stdio.h>
#include <stdlib.h>
void main()
{
	char nota[8];
	char media[8];
	int fnota;
	int fmedia;
	printf("M‚dia da sua escola (inteiro): ");
	gets(media);
	printf("Nota que vocˆ tirou (inteiro): ");
	gets(nota);
	fnota=atoi(nota);
	fmedia=atoi(media);
	if (fnota<fmedia)
	{
		printf("Abaixo da m‚dia.\n");
	}
	else
	{
		printf("Acima da m‚dia.\n");
    }
}
