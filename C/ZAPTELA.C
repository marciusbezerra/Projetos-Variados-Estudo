#include <stdio.h>
#include <dos.h>

#define VIDEO 0x10 //Interrup‡Æo de v¡deo
#define COLS 80 //Largura da tela
#define ROWS 25 //Linhas da tela

void cls(void);

void main()
{
	printf("Pressione ENTER para limpar a tela.");
	getchar();
	cls();
	printf("Ah, agora estou renovando ...");
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
