#include <stdio.h>

/*
	Ceci est un commentaire hors des fonctions.
*/
void ft_function() {}

int main()
{
	/*
		Ceci est un commentaire dans une fonction.
	*/
	char *c="#include <stdio.h>%c%c/*%c%cCeci est un commentaire hors des fonctions.%c*/%cvoid ft_function() {}%c%cint main()%c{%c%c/*%c%c%cCeci est un commentaire dans une fonction.%c%c*/%c%cchar *c=%c%s%c;%c%c%cft_function();%c%cprintf(c,10,10,10,9,10,10,10,10,10,10,9,10,9,9,10,9,10,9,34,c,34,10,10,9,10,9,10,9,10,10);%c%creturn (0);%c}%c";

	ft_function();
	printf(c,10,10,10,9,10,10,10,10,10,10,9,10,9,9,10,9,10,9,34,c,34,10,10,9,10,9,10,9,10,10);
	return (0);
}
