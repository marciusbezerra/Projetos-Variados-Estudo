#include <stdio.h>
#include <stdlib.h>
void main()
{
	float altura_em_cm;
	char altura_em_polegadas[8];
	printf("Digite a altura em polegadas: ");
	gets(altura_em_polegadas);
	altura_em_cm=atoi(altura_em_polegadas) * 2.54;
	printf("Em cent¡metro fica %.2f.\n",altura_em_cm);
}

