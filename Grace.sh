#!/bin/sh

main()
{
b=\' c=\\ a='/bin/echo "#!/bin/sh" > "Grace_kid.sh" ; /bin/echo >> "Grace_kid.sh" ; /bin/echo "main()" >> "Grace_kid.sh" ; /bin/echo "{" >> "Grace_kid.sh" ; /bin/echo b=$c$b c=$c$c a=$b$a$b >> "Grace_kid.sh" ; /bin/echo $a >> "Grace_kid.sh" ; /bin/echo "}" >> "Grace_kid.sh" ; /bin/echo >> "Grace_kid.sh" ; /bin/echo "main" >> "Grace_kid.sh"'
/bin/echo "#!/bin/sh" > "Grace_kid.sh" ; /bin/echo >> "Grace_kid.sh" ; /bin/echo "main()" >> "Grace_kid.sh" ; /bin/echo "{" >> "Grace_kid.sh" ; /bin/echo b=$c$b c=$c$c a=$b$a$b >> "Grace_kid.sh" ; /bin/echo $a >> "Grace_kid.sh" ; /bin/echo "}" >> "Grace_kid.sh" ; /bin/echo >> "Grace_kid.sh" ; /bin/echo "main" >> "Grace_kid.sh"
}

main
