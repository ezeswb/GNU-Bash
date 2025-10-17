#!/bin/bash
#@eze - eze.swb
#9.-Condicional if condiciones cadenas

read -p "Digita 1ra palabra: " pal1
read -p "Digita 2da palabra: " pal2

#"Con $ {#} , [[]] y operadores aritmeticos, palabra superior a 10 caracteres da error, compara caracteres"

if [[ "$pal1" > "$pal2" ]]; then
	echo "1ra palabra es Mayor"
elif [[ "$pal1" = "$pal2" ]]; then
	echo "Las palabras son iguales"
else
	echo "2da palabra es mayor"
fi

#"Con $ {#} (()), comparar el tamanio de las palabras."

if (( "${#pal1}" > "${#pal2}" )); then
	echo "1ra palabra es mayor"
elif (( "${#pal1}" == "${#pal2}" )); then
	echo "Son iguales"
else
	echo "2da es mayor"
fi
