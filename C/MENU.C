#include <stdio.h>
#include <graph.h>
#include <conio.h>
#include <stdlib.h> //para a fun‡Æo System()
#include "function.h"
#include <dos.h>

#define KEYBOARD 0x16 //Inerrup‡Æo do teclado
#define TRUE 1
#define FALSE !TRUE
#define VIDEO 0x10 //Interrup‡Æo do v¡deo
#define COLS 80 //Largura da tela
#define ROWS 25 //Linhas da tela

void screenSetup(void);
void doDos(char *command);
int getkey(void);
void cls(void);
void locate(int col, int row);

void main()
{
	int done=FALSE; //variavel do Loop While
	screenSetup(); //define a tela
	while(!done)
	{
		_settextcolor(3);
		switch(getkey()) //Le uma tecla
		{
			case F1:  //vai para DOS
				locate(0,24);
				puts("Digite EXIT para voltar  ao menu.");
				doDos("COMMAND.COM");
				break;
			case F2:  //formata disco
				doDos("FORMAT A:");
				break;
			case F3:  //em branco
				break;
			case F4:  //em branco
				break;
			case F5:  //em branco
				break;
			case F6:  //verifica disco
				doDos("CHKDSK");
				break;
			case F7:  //dir
				doDos("DIR /P");
				break;
			case F8:  //em branco
				break;
			case F9:  //em branco
				break;
			case F10:  //finalizar
				done=TRUE;
				break;
			}
	}
	locate(0,24);
	printf("Tchau!");
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

void screenSetup()
{
	cls();
	locate(20,3); //move cursor
	puts("Programa de Menu de Teclas de Fun‡Æo");
	locate(10,5); //move cursor
	puts("F1 - Ir para o MS-DOS");
	locate(10,7); //move cursor
	puts("F2 - Formatar Disco");
	locate(10,9); //move cursor
	puts("F3 - Em Branco");
	locate(10,11); //move cursor
	puts("F4 - Em Branco");
	locate(10,13); //move cursor
	puts("F5 - Em Branco");
	locate(40,5); //move cursor
	puts("F6 - Verificar Disco");
	locate(40,7); //move cursor
	puts("F7 - Comando Dir");
	locate(40,9); //move cursor
	puts("F8 - Em Branco");
	locate(40,11); //move cursor
	puts("F9 - Em Branco");
	locate(40,13); //move cursor
	puts("F10 - Finalizar");
	locate(20,16); //move cursor
	printf("Escolha sua ...");

}

void doDos(char *command)
{
	locate(0,24);
	system(command);
	locate(0,24);
	getchar();
	screenSetup();
}

int getkey(void)
{
	union REGS regs;
	regs.h.ah=0x00;
	int86(KEYBOARD,&regs,&regs);
	return(regs.x.ax);
}
