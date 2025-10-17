#!/bin/bash
#eze - @eze.swb
#Contadores

read -e -p "Directorio: " dir
cont=0
for x in $( ls $dir ); do
	echo $x
	if [ -r $x ]; then
		cont=$(( $cont+1 ))
	fi
done
echo "Existen '$cont' archivos con permisos de lectura en: $dir"
