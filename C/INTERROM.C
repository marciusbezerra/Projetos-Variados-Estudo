#include <stdio.h>
void main()
{
	char ch;
	for(;;)
	{
		printf("Pressione '~' para interromper.\n");
		ch=getche();
		if (ch=='~')
		{
			break;
		}
	}
}
