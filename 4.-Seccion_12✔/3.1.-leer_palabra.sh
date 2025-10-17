#!/bin/bash
#eze - @eze.swb
#Leer fichero palabra x palabra
read -p "Palabra a buscar: " pal
for palabra in $( cat liga.txt ); do
:<< "c"
	if [ "$palabra" = "$pal" ]; then
		echo "Palabra encontrada: $palabra"
	fi	
c
	if grep -i "$pal" "stdin"; then
		echo "palabra encontrada"
	fi
done

