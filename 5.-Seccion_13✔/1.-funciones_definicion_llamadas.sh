#!/bin/bash
#eze - eze.swb
#Definicion de funciones y llamadas

suma(){
	read -p "Numero 1 : " n1
	read -p "Numero 2 : " n2
	re=$(( $n1+$n2 ))
	echo "La suma es: $re"
}
echo "Sumando"
suma
