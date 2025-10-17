#!/bin/bash
#@eze - eze
#6.-Operaciones Aritmeticas

echo "Operaciones Decimales"

read -p "Digita el numero 1: " num1
read -p "Digita el numero 2: " num2

suma=$(echo "scale=2;$num1+$num2" | bc -l)
echo "La Suma es:" $suma

resta=$(echo "scale=2;$num1-$num2" | bc -l)
echo "La Resta es:" $resta

mult=$(echo "scale=2;$num1*$num2" | bc -l)
echo "La Multiplicacion es:" $mult

div=$(echo "scale=2;$num1/$num2" | bc -l)
echo "La Division es:" $div

