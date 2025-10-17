#!/bin/bash
#eze - eze.swb
#Leer palabras de ficheros
read -e -p "Digita el fichero: " fich
read -p "Palabra a buscar: " pal
cont=0
for leer in $( cat $fich ); do
	if [[ "$leer" = "$pal" ]]; then
		cont=$(( cont+1 ))
	fi
done
echo "La palabra '$pal' se repite '$cont'"

