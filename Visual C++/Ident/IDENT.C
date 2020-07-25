#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#define MAX_COMPRIMENTO 30 // PONHA AQUI O COMPRIMENTO MAXIMO DE UM
							//	IDENTIFICADOR.

#define MAX_PALAVRAS 2000 // PONHA AQUI O NUMERO MAXIMO DE PALAVRAS
							//  A SEREM CONSULTADAS

#define INVALIDOS 1 /* PONHA AQUI O NUMERO DE CARACTERES INVALIDOS */


/* ALGORITIMO CRIADO EM C E COMPILADO NO MICROSOFT VISUAL C++.
   (TALVEZ O SEU COMPILADOR NAO USE O MESMO DIALETO)

	**********************************

   FUNCAO: CONTAR OS IDENTIFICADORES DE UM ARQUIVO DE TEXTO ASCII
   DATA..: 31/05/2001
   AUTOR.: MARCIUS CARNEIRO BEZERRA
   COPYRIGHT: A FONTE ESTA LIVRE PARA MELHORES ADAPTACOES

*/


FILE *fp;
int latual, patual;

struct palavras
{
	char palavra[30];
	int linha;
} palavra_informacao[MAX_PALAVRAS];

void super_quicksort(struct palavras item[], int inicio, int quantidade)
{
    register int i, j;
    char *x;
    struct palavras temp;
    j = quantidade; i = inicio;
    x = item[(inicio + quantidade) / 2].palavra;
    do
    {
	while (_stricmp(item[i].palavra, x) < 0 && i < quantidade) i++;
	while (_stricmp(item[j].palavra, x) > 0 && j > inicio) j--;
        if (i <= j)
        {
            temp = item[i];
            item[i] = item[j];
            item[j] = temp;
            i++; j--;
        }
    } while (i <= j);
    if (inicio < j) super_quicksort(item, inicio, j);
    if (i < quantidade) super_quicksort(item, i, quantidade);
}

unsigned int e_identificador(char palavra[MAX_COMPRIMENTO])
{
	int i, ret;
	char caracteres_invalidos[INVALIDOS];
	char caracteres_iniciais_invalidos[10];
	char *pal;
	strcpy(caracteres_iniciais_invalidos, "1234567890");
	strcpy(caracteres_invalidos,  "|"); /* PONHA AQUI SEUS OUTROS CARACTERES
										INVALIDOS PARA IDENTIFICADORES
										E AUMENTE TAMBEM DE ACORDO A
										CONSTANTE 'INVALIDOS' (NO TOPO).
										NAO PONHA . , ; : */
	for (i = 0; i < 10; i++)
	{
		pal = strchr(palavra, caracteres_iniciais_invalidos[i]);
		ret = pal - palavra + 1;
		if (ret == 1)
		{
  			return 0;
		}
	}
	for (i = 0; i < INVALIDOS; i++)
	{
		pal = strchr(palavra, caracteres_invalidos[i]); 
		ret = pal - palavra + 1;
		if (ret > 0)
		{
			return 0;
		}
	}
	return 1;
}

unsigned int abre_arquivo(char arquivo[])
{
	unsigned int ret;
	char ch;
	ret = 1;
	if ((fp=fopen(arquivo, "r"))==NULL) {
		printf("\nO arquivo %s\n1. Nao pode ser encontrado ou\n2. Nao pode ser aberto.\n", arquivo);
		ch=getchar();
		ret = 0;
		};
	return ret;
};

void fecha_arquivo()
{
	fclose(fp);
}

void ajuda()
{
	char ch;
	printf("\nDigite no prompt Indent NomeDoArquivo.pas.");
	ch=getchar();
}

void gera_lista()
{
	int mudando_palavra, i, contar;
	char ch;
	char temp[MAX_COMPRIMENTO] = " ";
	patual = 0;
	latual = 1;
	contar = 0;
	mudando_palavra = 1;
	while (ch != EOF)
	{
		ch = fgetc(fp);
		switch(ch)
		{
			case EOF:
				break;
			case '\n':
				latual++;
			case '.' :
			case ',' :
			case ';' :
			case ':' :
			case ' ' :
			case '(' :
			case ')' :
			case '{' :
			case '}' :
			case '[' :
			case ']' :
			case '+' :
			case '-' :
			case '/' :
			case '\\' :
			case '*' :
			case '^' :
			case '\'':
			case '\"':
			case '=':
				if (mudando_palavra == 1)
				{
					break;
				}
				else
				{       if (e_identificador(palavra_informacao[patual].palavra) == 1)
					{
					patual++;
					}
					else
					{
					i = 0;
					}
					mudando_palavra = 1;
					break;
				}
			default :
				if (mudando_palavra == 0)
				{
					i++;
				}
				else
				{
					i = 0;
				}
				palavra_informacao[patual].palavra[i] = ch; 
				palavra_informacao[patual].palavra[i + 1] = '\0';
				palavra_informacao[patual].linha = latual;
				mudando_palavra = 0;
				break;
		}
	}
	printf("CONTADOR DE IDENTIFICADORES\n");
	printf("***************************\n\n");
	printf("Autor: Marcius Carneiro Bezerra\n");
	printf("Linguagem: C\n\n");
	printf("AGUARDE CALCULANDO ...\n\n");

	super_quicksort(palavra_informacao, 0, patual);
	super_quicksort(palavra_informacao, 0, patual);

	for (i = 0; i < MAX_PALAVRAS; i++)
	{
		if (palavra_informacao[i].linha != 0)
		{
			if (_stricmp(temp, palavra_informacao[i].palavra) != 0)
			{
				if ((contar != 0) && (contar % 5 == 0))
				{

					printf("\n\nPressione <ENTER> para continuar ...");
					ch = getchar();
				}
				strcpy(temp, palavra_informacao[i].palavra);
				printf("\n\n");
				printf("%s -> %d ", temp, palavra_informacao[i].linha);
				contar++;
			}
			else
			{
				printf("%d ", palavra_informacao[i].linha);
			}
		}
	}
		
	if (contar > 0)
	{
		printf("\n\nForam localizado(s) %d identificado(res).", contar);
	}
	else
	{
		printf("Nenhum identificador localizado.");
	}

	printf("\nPressione <ENTER> para terminar");
	ch = getchar();
}


void main(int argc, char *argv[])
{
if (argc!=2) {
	ajuda();
	exit(1);
	};
if (abre_arquivo(argv[1]) == 0) {
	exit(1);
	};
gera_lista();
fecha_arquivo();
};
