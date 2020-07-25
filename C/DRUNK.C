#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <dos.h>

#define FACE 0x01 //N£mero de caracteres da face
#define BACKSPACE 0x08 //caractere de retrocesso
#define BLANK 0x20 //N£mero de caracteres em branco
#define LOOP 100000 // N£mero de faces a exibir
#define PAUSE 150000 //Tempo de pausa (0-16.000.000)
#define VIDEO 0x10 //Interrup‡Æo do v¡deo
#define COLS 80 //Largura da tela
#define ROWS 25 //Linhas da tela

void cls(void);
void locate(int col, int row);
int rnd(int range);
void seedrnd(void);

void main()
{
	int t,x,y;
	unsigned long p; //loop de pausa
	cls();      //limpa a tela
	seedrnd();  //define o gerador de n£meros aleat¢rios

	// inicia no centro da tela

	x=COLS/2; //metade da altura
	y=ROWS/2; //metade da largura

	for (t=0;t<LOOP;t++)
	{
		locate(x,y);    // mover o cursor
		putchar(FACE);  // seja feliz
		for (p=0;p<PAUSE;p++);
		x+=rnd(3)-1;    // coluna aleatoria
		y+=rnd(3)-1;    // linha aleatoria

		if (x<=1) x=80; //quebra para a esquerda
		if (x>=80) x=1; //quebra para a direita
		if (y<=1) y=25; //quebra para a esquerda
		if (y>=25) y=1; //quebra para a direita

		putchar(BACKSPACE);
		putchar(BLANK);

	}
}

void cls(void)
{
	union REGS regs;
	regs.h.ah=0x06; //func 6 desloca janela
	regs.h.al=0x00; //limpa tela
	regs.h.bh=0x07; //cria tela vazia
	regs.h.ch=0x00; //Linha superior esquerda
	regs.h.cl=0x00; //Coluna superior esquerda
	regs.h.dh=ROWS-1; //linha inferior direita
	regs.h.dl=COLS-1; //coluna inferior direita
	int86(VIDEO,&regs,&regs);
}

void locate(int col, int row)
{
	union REGS regs;
	regs.h.ah=0x02; //fun‡Æo de v¡deo 2, move o cursor
	regs.h.bh=0x00; //tela de v¡deo (sempre 0)
	regs.h.dh=row; //posi‡Æo da coluna do cursor
	regs.h.dl=col;  //posi‡Æo da linha do cursor
	int86(VIDEO,&regs,&regs);
}

int rnd(int range)
{
	int r;
	r=rand()%range; //N£mero aleatorio
	return(r);
}

void seedrnd(void)
{
	srand((unsigned) time (NULL));
}
