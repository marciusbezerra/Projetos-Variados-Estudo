#include <stdio.h>
#include <conio.h>

int inf,sup;

void iniciar() {
  puts("PROGRAMA ADIVINHA\n");
  puts("Pense em um numero denttro de um intervalo");
  printf("Entre com o valor inferior do intervalo: ");
  scanf("%d", &inf);
  printf("Entre com o valor superior do intervalo: ");
  scanf("%d", &sup);
}

int calcular_valor(int inf,int sup) {
  return((inf+sup) >> 1); /*divisao por 2*/
}

int conferir_valor(int num) {
  /*
  -1 - Invalido
  0  - Errou
  1  - Acertou
  2  - Saiu
  */
  char ch;
  printf("\nMeu chute eh: %d\n",num);
  puts("Este valor eh maior (>), menor (<) ou igual (=) ao seu?");
  ch=getche();
  switch (ch) {
    case '>': sup = num-1; return(0);
    case '<': inf = num+1; return(0);
    case '=': return(1);
    case '\x1b': return(2);
    default: return(-1);
  }
}

extern void jogo_acerto() {
  int acertou;
  iniciar();
  do {
    switch(acertou=acertou=conferir_valor(calcular_valor(inf,sup))) {
      case -1: puts(" -> invalido. ESC sai."); break;
      case 0: puts(" Errei!"); break;
      case 1: puts(" Acertei!"); break;
      case 2: puts(" Terminado"); break;
    }
  } while (acertou <= 0);
}
