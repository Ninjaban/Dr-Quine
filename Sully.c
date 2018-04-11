#include <stdio.h>
#include <stdlib.h>

size_t ft_nb_digit(int i) {size_t n = 0;while (i / 10 > 0) {n++;i/=10;}return (n);}
size_t ft_strlen(char *str) {size_t n = 0;while (str[n]) n++;return (n);}

int main()
{
	int i = 5;

	if (i > 0)
	{
		char file[10 + ft_nb_digit(i - 1)];sprintf(file, "Sully_%d.c", i - 1);
		FILE *f = fopen(file, "w+");
		char *c="#include <stdio.h>%c#include <stdlib.h>%c%csize_t ft_nb_digit(int i) {size_t n = 0;while (i / 10 > 0) {n++;i/=10;}return (n);}%csize_t ft_strlen(char *str) {size_t n = 0;while (str[n]) n++;return (n);}%c%cint main()%c{%c%cint i = %d;%c%c%cif (i > 0)%c%c{%c%c%cchar file[10 + ft_nb_digit(i - 1)];sprintf(file, %cSully_%cd.c%c, i - 1);%c%c%cFILE *f = fopen(file, %cw+%c);%c%c%cchar *c=%c%s%c;%c%c%c%cfprintf(f,c,10,10,10,10,10,10,10,10,9,i-1,10,10,9,10,9,10,9,9,34,37,34,10,9,9,34,34,10,9,9,34,c,34,10,10,9,9,10,9,9,10,9,9,34,34,34,37,34,34,34,10,9,10,9,10,10);%c%c%cfclose(f);%c%c%cchar cmd[ft_strlen(%cgcc  -o Sully_%c) + ft_strlen(file) + 10];sprintf(cmd, %cgcc %cs -o Sully_%%d%c, file, i - 1);system(cmd);char l[20];sprintf(l, %c./Sully_%%d%c, i - 1);system(l);%c%c}%c%creturn (0);%c}%c";

		fprintf(f,c,10,10,10,10,10,10,10,10,9,i-1,10,10,9,10,9,10,9,9,34,37,34,10,9,9,34,34,10,9,9,34,c,34,10,10,9,9,10,9,9,10,9,9,34,34,34,37,34,34,34,10,9,10,9,10,10);
		fclose(f);
		char cmd[ft_strlen("gcc  -o Sully_") + ft_strlen(file) + 10];sprintf(cmd, "gcc %s -o Sully_%d", file, i - 1);system(cmd);char l[20];sprintf(l, "./Sully_%d", i - 1);system(l);
	}
	return (0);
}
