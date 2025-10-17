#!/bin/bash
#eze - @eze.swb
#Redireccionando Errores

read -p "Introduce ruta de la carpeta que quieres crear: " ruta

#mkdir $ruta 2>/dev/null
ls $ruta 2>/dev/null

if [ $? -eq 0 ];then
	echo "Sin errores"
else
	echo "Error"
fi
