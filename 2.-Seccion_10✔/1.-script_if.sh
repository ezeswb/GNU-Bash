#!/bin/bash
#@eze - eze
#8.-Condicional if

read -p "Digita 1Er numero: " num 
read -p "Digita 2Do numero: " num2 

if (( $num > 0 )); then
	echo "El 1er numero es Mayor que cero"
else
	echo "El 1er numero es Menor que cero"
fi

if [ $num2 -gt 0 ]; then
	echo "el 2do numero es mayor que cero"
else
	echo "el 2do numero es Menor que cero"
fi

