#!/bin/bash
#eze - @eze.swb
#Leer las lineas de un fichero
cont=0
suma=0
while read linea; do
	nota=$( echo $linea | cut -d ":" -f 2 )
	sum=$(( $sum+$nota ))
	cont=$(( $cont+1 ))
done<0.-ficheros/alumnos.dat
echo -e "Los alumnos son: $cont\nLa suma total es: $sum"
