#!/bin/bash
#eze - @eze.swb
#Estructura while
:	"
read -p "Numero 1: " num1
while [ $num1 -gt 0 ]; do 
	echo "HOLA...!!!..."
	num1=$[$num1-1]
done
	"
read -p "Si para continuar: " text
	while [ -n "$text" -a "$text" != "SI" ]; do
		echo "La cadena es: $text" 
		read -p "Si para continuar: " text
	done
echo "FIN del programa"

