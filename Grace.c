#include <stdio.h>

#define TRUE 1
#define FALSE 0

/*
	Ceci est un commentaire hors des fonctions.
*/
#define FT(x)int main(){FILE *f=fopen("Grace_kid.c", "w+");char *c="#include <stdio.h>%c%c#define TRUE 1%c#define FALSE 0%c%c/*%c%cCeci est un commentaire hors des fonctions.%c*/%c#define FT(x)int main(){FILE *f=fopen(%cGrace_kid.c%c, %cw+%c);char *c=%c%s%c;fprintf(f,c,10,10,10,10,10,10,9,10,10,34,34,34,34,34,c,34,10,10,10);return (0);}%c%cFT(xxxxxxx)%c";fprintf(f,c,10,10,10,10,10,10,9,10,10,34,34,34,34,34,c,34,10,10,10);return (0);}

FT(xxxxxxx)
