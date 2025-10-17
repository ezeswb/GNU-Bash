#!/bin/bash
#eze - eze.swb
#Escribir en ficheros
read -p "El numero de la tabla aritmetica a generar: " num
for x in $( seq 1 10 ); do
	echo "$num x $x = $(( $num*$x ))" >> tabla.txt
done
echo -e "\r" >> tabla.txt
