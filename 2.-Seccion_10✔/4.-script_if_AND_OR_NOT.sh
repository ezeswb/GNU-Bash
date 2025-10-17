#!/bin/bash
#eze - @eze.swb
# Operadores logicos, -a AND, -o OR, ! NOT

read -e -p "DIGITA UNA RUTA o FICHERO: " df
if [ ! -d $df ];then
	echo "Es un fichero"
else 
	echo "Es un directorio"
fi

read -n 1 -s -p $'\nPresiona un tecla para continuar...\n\n'

read -s -p "1.Numero: " num1; echo " " 
read -p "2.Numero: " num2
read -p "3.Numero: " num3

if [ $num1 -eq $num2 -a $num2 -eq $num3 ];then
	echo "Son iguales"
else 
	echo "son diferentes"
fi

echo "backslshes ( \ \ )"
read -d $'\n' ruta
echo "IGRESO $ruta"
