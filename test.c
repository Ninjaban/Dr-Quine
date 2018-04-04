#include <stdio.h>

int main()
{
	char *c="ls %c%c%c%c%c%c%c";

	printf(c,10,10,10,10,10,9,10);
	return (0);
}
