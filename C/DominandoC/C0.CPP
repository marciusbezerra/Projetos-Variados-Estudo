#include <stdio.h>
#include <conio.h>
#include <C:\TC\BIN\C2.h> //jogo acerto (ajeitar o diretorio)
#include <cmath>
#include <stdlib.h>
#include <string.h>

void fuprintf() {
  printf("Este e o capitulo %d (dois)\n", 2);
}

void expcontrole() {
  printf("123456789012345678901234567890\n");
  printf("%10s%10c%10s\n","Ano",' ',"Valor");
  printf("%9d%11c%10d\n",1,' ', 1000);
  printf("%9d%11c%10d\n",2,' ', 2560);
  printf("%9d%11c%10d\n",3,' ', 6553);
  printf("123456789\n");
  printf("%4.2f\n",3456.78);
  printf("%3.2f\n",3456.78);
  printf("%3.1f\n",3456.78);
  printf("%10.3f\n",3456.78);
  printf("123456789012345678901234567890\n");
  printf("%-10s%10c%-10s\n","Ano",' ',"Valor");
  printf("%-9d%11c%-10d\n",1,' ',1000);
  printf("%-9d%11c%-10d\n",2,' ',2560);
  printf("%-9d%11c%-10d\n",3,' ',6553);
  printf("1234567890");
  printf("\n%04d",21);
  printf("\n%06d\n",21);
}

void puts_putchar() {
  puts("string");
  printf("string\n","string");
  putchar('c');
  printf("%c",'c');
}

void ponto_flutuante() {
  int a,b;
  float ratio;
  a = 10;
  b = 3;
  ratio = a/b;
  printf("\n\nO resultado da divisao e: %f",ratio);
}

void sem_sinal() {
  unsigned int j;
  int i;
  j = 65000;
  i = j;
  printf("\n%d\n%u\n",i,j);
}

void atri_composta() {
  int a=2;
  a*=2;
  printf("%d\n",a);
}

void soma_ab() {
  int a,b,soma;
  printf("Escreva num1,num2: ");
  scanf("%d,%d", &a,&b);
  soma = a+b;
  printf("Soma = %d\n",soma);
}

void lendo_strings() {
  char nome[30];
  printf("Digite seu nome: ");
  scanf("%s", nome);
  printf("Como vai %s?\n", nome);
}

void lendo_gets() {
  char nome[30];
  printf("Digite seu nome: ");
  gets(nome);
  printf("Como vai %s?\n",nome);
}

void char_getche() {
  char ch;
  printf("Digite algum caractere: ");
  ch = getche();
  printf("\nO caractere que você digitou foi %c\n", ch);
}

void char_getch() {
  char ch;
  printf("Digite algum caractere: ");
  if ((ch = getch()) >= 'a')   {
    puts("\nVoce digitou uma letra minuscula");
  } else puts("\nVoce nao digitou uma letra minuscula");
}

void uso_switch() {
  char ch;
  printf("Digite uma opcao (a,b,c): ");
  switch (ch = getch()) {
    case 'A':
    case 'a':
      puts("\nSelecionou a");
      break;
    case 'B':
    case 'b':
      puts("\nSelecionou b");
      break;
    case 'C':
    case 'c':
      puts("\nSelecionou c");    
      break;
    default:
      puts("\nOpcao invalida");
  }
}

void aguarda_enter() {
  printf("\nPressione esc para sair...");
  while (getch()!=27);
}

void laco_while() {
  int i=0;
  while (i++ < 10)
    printf("%d\n",i);
}

void laco_for1() {
  int i=1;
  for (;i<=10;i++) {
    printf("%d\n",i);
  }
}

void laco_for2() {
  int i,j;
  for (i=1,j=10;i<=10;i++,j+=10)
    printf("%03d %03d\n",i,j);
}

void laco_for3() {
  int i;
  for (puts("Comecou"),i=1;i<=10;printf("%02d\n",i),i++);
}

void laco_for4() {
  char ch;
  int i;
  for (i=0;i<10;i++) {
    printf("\nDigite um caractere (ESC sai): ");
    ch=getch();
    if (ch=='\x1b') /* caractere de escape */
      break;
    printf("\nVoce digitou %c", ch);
  }
  puts("\nAcabou");
}

void laco_for5() {
  char ch;
  int i;
  for (i=0;i<10;i++) {
    printf("\nDigite um caractere (ESC pula): ");
    ch=getch();
    if (ch=='\x1b')
      continue;
    printf("Digitou %c.", ch);
  }
  puts("\nAcabou");
}

float area(float base, float altura) {
  return(base*altura/2.0);
}

float calcula_area() {
  float s,b,h;
  b=20.0;
  h=20.0;
  s=area(b,h);
  printf("Se a base e: %.2f e a altura e: %.2f, entao, a area e: %.2f", b,h,s);
}

void soma() {
  static int i=0;
  printf("\ni (estatico) = %d", ++i);
}

void tipo_unsigned() {
  unsigned int i,j;
  for (i=1;i<=20;i++)
    for (j=1;j<=20;j++)
      printf("%10d %10d",i,j);
  printf("\n");
}

long fatorial(int n) {
  long res;
  if (n==0) {
    res = 1L;
    return(res);
  }
  res=n*fatorial(n-1);
  return(res);
}

void fatorial10() {
  printf("O fatorial de 10 eh: %d\n",fatorial(10));
}

float calcular_volume(float raio) {
  #define PI 3.14
  return(4.0/3.0*PI*raio*raio*raio);
}

void volume_raio_10() {
  printf("O volume do raio 10 eh: %f\n",calcular_volume(10)); 
}

void formula_define() {
  #define area(base,altura) ((base)*(altura)/2.0)
  float s;
  s=area(10,10);
  printf("Na formula area(base,altura), com 10, 10, o resultado e: %f\n", s);
}

float area_triangulo(float l1, float l2, float l3) {
  float x,area;
  x=(l1+l2+l3)/2.0;
  area=x*(x-l1)*(x-l2)*(x-l3);
  area=sqrt(area);
  return(area);
}

void area_tri_10_10_10() {
  printf("A area do triangulo 10, 10, 10 e: %.2f\n",area_triangulo(10,10,10));
}

void vetores() {
  #define DIM 5
  int i;
  float vetor1[DIM],vetor2[DIM];
  for (i=0;i<DIM;i++) {
    printf("vetor1[%d] = ",i);
    scanf("%f",&vetor1[i]);
  }
  printf("\n");
  for (i=0;i<DIM;i++) {
    printf("vetor2[%d] = ",i);
    scanf("%f",&vetor2[i]);
  }
  printf("\n------------\n");
  for (i=0;i<DIM;i++)
    printf("vetor1[%d] + vetor2[%d] = %.2f\n",i,i,vetor1[i]+vetor2[i]);
}

void ponteiros_vetores() {
  static int list1[] = {1,2,3,4,5};
  int ind;
  puts("Usando vetors:");
  for (ind=0;ind<5;ind++)
    printf("%d\n",list1[ind]);
    
  static int list2[] = {1,2,3,4,5};
  
  puts("Usando ponteiros:");
  
  for (ind=0;ind<5;ind++)
    printf("%d\n",*(list2+ind));
}

void ponteiros_calloc() {
  int *list,ind;
  list = (int *) calloc(5,sizeof(int));
  list[0]=1;
  list[1]=2;
  list[2]=3;
  list[3]=4;
  list[4]=5;
  puts("Usando ponteiros com alocacao dinamica:");
  for (ind=0;ind<5;ind++) 
    printf("%d\n", *(list+ind));
}

void ponteiros_matrizes() {
  static int matriz[3][3] = {
    {1,2,3},
    {4,5,6},
    {7,8,9}}, 
    *p[3] = {matriz[0], matriz[1], matriz[2]};
  int i,j;
  puts("Ponteiros x Matrizes:");
  for (i=0;i<3;i++)
    for (j=0;j<3;j++)
      p[i][j] += 10;
      
  for (i=0;i<3;i++)
    for (j=0;j<3;j++)
      printf("%d\n",p[i][j]);
}

void permuta_ponteiros() {
  static int matriz[3][3] = {
    {1,2,3},
    {4,5,6},
    {7,8,9}}, 
  *p[3] = {matriz[0], matriz[1], matriz[2]};
  int *aux,i;
  puts("Permutacao com ponteiros");
  puts("------------------------");
  puts("Antes:");
  for (i=0;i<3;i++)
    printf("{%d %d %d}\n", p[0][i],p[1][i],p[2][i]);
  aux=p[0];
  p[0]=p[1];
  p[1]=aux;
  puts("Depois:");
  for (i=0;i<3;i++)
    printf("{%d %d %d}\n", p[0][i],p[1][i],p[2][i]);
}

void permuta_matrizes() {
  static int matriz[3][3] = {
    {1,2,3},
    {4,5,6},
    {7,8,9}};
  int i,aux;
  puts("Permutacao com matrizes");
  puts("-----------------------");
  puts("Antes:");
  for (i=0;i<3;i++)
    printf("{%d %d %d}\n", matriz[0][i],matriz[1][i],matriz[2][i]);
  for (i=0;i<3;i++) {
    aux=matriz[1][i];
    matriz[1][i] = matriz[2][i];
    matriz[2][i] = aux;
  }
  puts("Depois:");
  for (i=0;i<3;i++)
    printf("{%d %d %d}\n", matriz[0][i],matriz[1][i],matriz[2][i]);
}

void perm_pont_aloc() {
  int *aux, *p[3], i;
  p[0]=(int *) calloc(3,sizeof(int));
  p[1]=(int *) calloc(3,sizeof(int));
  p[2]=(int *) calloc(3,sizeof(int));
  p[0][0]=1; p[0][1]=2; p[0][2]=3;
  p[1][0]=4; p[1][1]=5; p[1][2]=6;
  p[2][0]=7; p[2][1]=8; p[2][2]=9;

  puts("Permutacao com ponteiros (alocacao dinamica)");
  puts("--------------------------------------------");
  puts("Antes:");
  for (i=0;i<3;i++)
    printf("{%d %d %d}\n", p[0][i],p[1][i],p[2][i]);
  
  aux=p[0];
  p[0]=p[1];
  p[1]=aux;
  
  puts("Antes:");
  for (i=0;i<3;i++)
    printf("{%d %d %d}\n", p[0][i],p[1][i],p[2][i]);
}

void ponteiros_strings() {
  char nome[10] = "antigo";
  puts(nome);
  strcpy(nome,"novo");
  puts(nome);
}

void ponteiros_caracteres() {
  char *nome="antigo";
  puts(nome);
  nome="novo";
  puts(nome);
}

void vetores_strings() {
  char nomes1[][10] = { "Eduardo",
    "Andre",
    "Alexandre",
    "Debora",
    "Cecilia"
  };
  char *nomes2[] = {"Eduardo",
    "Andre",
    "Alexandre",
    "Debora",
    "Cecilia" };
    
}

main() {
 
  //declaracoes
	aguarda_enter(atri_composta())  ;
  //void fuprintf(); void expcontrole(); void puts_putchar();
  //void ponto_flutuante(); void sem_sinal(); void atri_composta();
  //void soma_ab(); void lendo_strings(); void lendo_gets(); void char_getche();
  //void char_getch(); void jogo_acerto();
  
  //praticas
  
  //printf("Alo mundo\n"); fuprintf(); expcontrole(); puts_putchar();
  //ponto_flutuante(); sem_sinal(); atri_composta(); soma_ab(); lendo_strings();
  //lendo_gets(); char_getche(); char_getch(); uso_switch(); laco_while();
  //laco_for1(); laco_for2(); laco_for3(); laco_for4(); laco_for5();
  //jogo_acerto(); calcula_area(); soma(); soma(); soma(); tipo_unsigned();
  //fatorial10(); volume_raio_10(); formula_define(); area_tri_10_10_10();
  //vetores(); ponteiros_vetores(); ponteiros_calloc(); ponteiros_matrizes();
  //permuta_matrizes(); permuta_ponteiros(); perm_pont_aloc(); ponteiros_strings();
  //ponteiros_caracteres(); pede_nome(); 
  
  aguarda_enter();
}
