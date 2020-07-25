#include <stdio.h>
#include <graph.h>
void main()
{
	char kitty[20];
	int x;
	_setbkcolor(3);
	printf("Nome para seu gato: ");
	gets(kitty);
	printf("%s ‚ um nome bonito, outra sujestÆo: ",kitty);
	gets(kitty);
	printf("%s tamb‚m ‚ um bonito nome.",kitty);
}
