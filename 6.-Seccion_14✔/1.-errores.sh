#!/bin/bash
#eze - @eze.swb
#Errores

read -p "Introduce ruta de la carpeta que quieres crear: " ruta

mkdir $ruta

if [ $? -eq 0 ];then
	echo "Sin errores"
else
	echo "Error"
fi
