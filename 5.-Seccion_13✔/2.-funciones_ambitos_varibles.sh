#!/bin/bash
#eze - eze.swb
:<<"c"
Ambitos de variables en funciones, existen dos ambitos local y global,
Local es exlusiva de la funcion, se lee y llama solo en esa funcion,
Global puede ser leida o llamada desde culaquier parte del codigo.
c

suma(){
	read -p "Numero 1 : " n1
	read -p "Numero 2 : " n2
	local re=$(( $n1+$n2 ))
	echo "La suma es: $re"
}
echo "Sumando"
suma
