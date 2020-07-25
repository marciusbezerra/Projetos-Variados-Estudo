#include <stdio.h>
#include <stdlib.h>
void main()
{
	int matusa;
	int voce;
	int diff;
	char anos[8];
	printf("Sua indade: ");
	gets(anos);
	voce=atoi(anos);
	matusa=900;
	diff=matusa-voce;
	printf("Vocˆ tem %i a menos que Matusalem.\n",diff);
}
