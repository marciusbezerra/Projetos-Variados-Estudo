#include <stdio.h>
void main()
{
	char menuitem[] = "Suco de laranja \"QSuk\"";
	int copo=1;
	float preco=1.45;

	printf("Promo��o especial - %s.\n",menuitem);
	printf("Voc� deseja %i copo(s).\n",copo);
	printf("O preco � de R$% .2f, por favor.\n", preco);
}
