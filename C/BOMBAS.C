#include <stdio.h>
#include <conio.h>
#include <dos.h>

void caiBomba(void); // Prototipo

void main()
{
	printf("Pressione qualquer tecla para soltar a bomba:");
	getch();
	caiBomba();
	printf("\nOba!\n");
}

void caiBomba()
{
	int x;
	for (x=880;x>=440;x-=10)
	{
		_sound(x);
		_delay(100);
	}
	nosound();
}
