#!/bin/bash
#eze - @eze.swb
#Estructura for
:	'
read -p "Introduce un Numero para la Tabla Artimetica: " tabla

for x in `seq 1 10`; do
	echo "$x - $tabla = $[$x-$tabla]"
done
echo " "
for x in `seq 1 10`; do
	echo "$tabla + $x = $[$x+$tabla]"
done
echo " "
for x in `seq 1 10`; do
	echo "$tabla * $x = $[$x*$tabla]"
done
echo " "
for x in `seq 1 10`; do
	echo "$tabla / $x = $[$x/$tabla]"
done
echo " "
	'
read -e -p "Digita una carpeta o fichero: " cf
read -p "NUMERO: " num

for x in $(ls $cf); do
	echo $x
done
echo -e "\nContando: "
for y in $(seq -w 1 $num); do
	echo $y
done
