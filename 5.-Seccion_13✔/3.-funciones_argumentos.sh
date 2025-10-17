#!/bin/bash
#eze - eze.swb
:<<"c"
Uso de parametros con funcione.
c
suma(){
	local re=$(( $1+$2 ))
	echo "La suma es: $re"
}
echo "Sumando"
	read -p "Numero 1 : " n1
	read -p "Numero 2 : " n2
suma $n1 $n2
