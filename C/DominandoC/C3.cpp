#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <string.h>

void gravar_arquivo_char_char() {
  FILE *fptr;
  char ch;
  puts("Escrevendo em saida.txt (ENTER = parar)");
  fptr = fopen("saida.txt","w");
  while ((ch=getche())!='\r')
    putc(ch,fptr);
  fclose(fptr);
}

void ler_arquivo_char_char(char *arquivo) {
  FILE *fptr;
  int ch;
  fptr = fopen(arquivo, "r");
  while ((ch=getc(fptr))!=EOF) 
    putchar(ch);
  fclose(fptr);
}

void aguarda_esc() {
  printf("\nPressione esc para sair...");
  while (getch()!=27);
}

void erro_arquivos(char *arquivo) {
  FILE *fptr;
  char ch;
  if ((fptr=fopen(arquivo, "r"))==NULL) {
    printf("Nao foi possivel abrir o arquivo '%s'", arquivo);
    aguarda_esc();  
    exit(0);
  }
  while ((ch=getc(fptr))!=EOF)
    putchar(ch);
}

void ler_arquivo_strings(char *arquivo) {
  FILE *fptr;
  char linha[80];
  printf("Lendo do arquivo %s:\n", arquivo);
  fptr=fopen(arquivo,"r");
  while (fgets(linha,80,fptr)!=NULL)
    printf("%s", linha);
  fclose(fptr);
}

void gravar_arquivo_strings(char *arquivo) {
  FILE *fptr;
  char linha[80];
  printf("Escrevendo no arquivo %s (Linha = Parar)\n", arquivo);
  fptr = fopen(arquivo,"w");
  while (strlen(gets(linha))>0) {
    fputs(linha,fptr);
    fputs("\n",fptr);
  }
  fclose(fptr);
}

int main(int argc, char *argv[]) {
  //gravar_arquivo_char_char(); ler_arquivo_char_char("saida.txt" /*argv[1]*/);
  //erro_arquivos("saida.txt"); gravar_arquivo_strings("saida.txt");
  //ler_arquivo_strings("saida.txt");
  aguarda_esc();  
}
