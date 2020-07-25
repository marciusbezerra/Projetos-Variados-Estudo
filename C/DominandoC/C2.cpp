
#include <stdio.h>
#include <conio.h>

void aguarda_esc() {
  printf("\nPressione esc para sair...");
  while (getch()!=27);
}

int dobro(int num) {
  return(2*num);
}

int triplo(int num) {
  return(3*num);
}

int quadruplo(int num) {
  return(4*num);
}

void calc_mult() {
  char op;
  int result, num;
  printf("Digite um numero: ");
  scanf("%d", &num);
  printf("\n0 - Multiplicar por 2\n1 - Multiplicar por 3");
  printf("\n2 - Multiplicar por 4\n");
  printf("Operacao desejada: ");
  op = getche();
  switch (op) {
    case '0': 
      result = dobro(num);
      break;
    case '1':
      result = triplo(num);
      break;
    case '3':
      result = quadruplo(num);
  }
  printf("\n\nResultado: %d\n", result);
}

/*
NÃO DEU CERTO!
void ponteiros_funcoes() {
  char op;
  int num, result;
  int (*ptr[3])() = {dobro(int),triplo(int),quadruplo(int)};
  printf("Digite um numero: ");
  scanf("%d", &num);
  printf("\n0 - Multiplicar por 2");
  printf("\n1 - Multiplicar por 3");
  printf("\n2 - Multiplicar por 4\n");
  printf("Opcao desejada: ");
  op = getche();
  printf("Resultado = %d\n", (*ptr[op-'0'])(num));
} */

struct rec_func {
  char nome[20];
  int codigo;
  float salario;
}

void listar(rec_func func) {
  printf("Nome...: %s\n", func.nome);
  printf("Codigo.: %d\n", func.codigo);
  printf("Salario: %.2f\n", func.salario);
}

struct rec_func novo_funcionario() {
  struct rec_func func;
  printf("Nome...:");
  gets(func.nome);
  printf("Codigo.:");
  scanf("&d", &func.codigo);
  printf("Salario:");
  scanf("%f", &func.salario);
}

void estruturas_funcoes() {
  rec_func funcionario;
  funcionario = novo_funcionario();
  listar(funcionario);
}

int main(int argc, char *argv[]) {
  //calc_mult();
  estruturas_funcoes();
  aguarda_esc();
}
