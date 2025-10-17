#!/bin/bash
#@eze - eze
#4.-Operaciones Aritmeticas

echo "Operaciones Aritmeticas"

read -p "Digita el numero 1: " num1
read -p "Digita el numero 2: " num2

suma=$(( $num1 + $num2 ))
echo "La Suma es:" $suma

resta=$[ $num1 - $num2 ]
echo "La Resta es:" $resta

let mult=$num1*$num2
echo "La Multiplicacion es:" $mult

div=`expr $num1 / $num2`
echo "La Division es:" $div

