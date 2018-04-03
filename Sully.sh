#!/bin/sh

main()
{
i=5

if [ $i -gt 0 ]
then
i=$(echo "$i-1" |bc)
b=\' c=\\ d=\$ di=\$i e=\" a='/bin/echo "#!/bin/sh" > "Sully_$i.sh" ; /bin/echo >> "Sully_$i.sh" ; /bin/echo "main()" >> "Sully_$i.sh" ; /bin/echo "{" >> "Sully_$i.sh" ; /bin/echo "i=$i" >> "Sully_$i.sh" ; /bin/echo >> "Sully_$i.sh" ; /bin/echo "if [ $di -gt 0 ]" >> "Sully_$i.sh" ; /bin/echo "then" >> "Sully_$i.sh" ; /bin/echo "i=$d(echo $e$di-1$e |bc)" >> "Sully_$i.sh" ; /bin/echo b=$c$b c=$c$c d=$c$d di=$c$di e=$c$e a=$b$a$b >> "Sully_$i.sh" ; /bin/echo $a >> "Sully_$i.sh" ; /bin/echo "sh Sully_$di.sh" >> "Sully_$i.sh" ; /bin/echo "fi" >> "Sully_$i.sh" ; /bin/echo "}" >> "Sully_$i.sh" ; /bin/echo >> "Sully_$i.sh" ; /bin/echo "main" >> "Sully_$i.sh"'
/bin/echo "#!/bin/sh" > "Sully_$i.sh" ; /bin/echo >> "Sully_$i.sh" ; /bin/echo "main()" >> "Sully_$i.sh" ; /bin/echo "{" >> "Sully_$i.sh" ; /bin/echo "i=$i" >> "Sully_$i.sh" ; /bin/echo >> "Sully_$i.sh" ; /bin/echo "if [ $di -gt 0 ]" >> "Sully_$i.sh" ; /bin/echo "then" >> "Sully_$i.sh" ; /bin/echo "i=$d(echo $e$di-1$e |bc)" >> "Sully_$i.sh" ; /bin/echo b=$c$b c=$c$c d=$c$d di=$c$di e=$c$e a=$b$a$b >> "Sully_$i.sh" ; /bin/echo $a >> "Sully_$i.sh" ; /bin/echo "sh Sully_$di.sh" >> "Sully_$i.sh" ; /bin/echo "fi" >> "Sully_$i.sh" ; /bin/echo "}" >> "Sully_$i.sh" ; /bin/echo >> "Sully_$i.sh" ; /bin/echo "main" >> "Sully_$i.sh"
sh Sully_$i.sh
fi
}

main
