#!/bin/sh

ft_function() {}

main()
{
#Fonction sans interret
ft_function

b=\' c=\\ a='/bin/echo "#!/bin/sh" ; /bin/echo ; /bin/echo "ft_function() {}" ; /bin/echo ; /bin/echo "main()" ; /bin/echo "{" ; /bin/echo "#Fonction sans interret" ; /bin/echo "ft_function" ; /bin/echo ; /bin/echo b=$c$b c=$c$c a=$b$a$b; /bin/echo $a ; /bin/echo "}" ; /bin/echo ; /bin/echo "main"'
/bin/echo "#!/bin/sh" ; /bin/echo ; /bin/echo "ft_function() {}" ; /bin/echo ; /bin/echo "main()" ; /bin/echo "{" ; /bin/echo "#Fonction sans interret" ; /bin/echo "ft_function" ; /bin/echo ; /bin/echo b=$c$b c=$c$c a=$b$a$b; /bin/echo $a ; /bin/echo "}" ; /bin/echo ; /bin/echo "main"
}

main
