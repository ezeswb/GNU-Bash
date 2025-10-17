#!/bin/bash
#eze - @eze.swb
#if con ficheros, directorios y rwx. (-e existe, -f fichero, -d directorio, -r lectura, -w escritura, -x ejecucion)

echo -e "\nArchivos a elegir, PRESIONA <TAB>:
$(ls -lv | tr -s " " | cut -d " " -f 9)
"
read -e -p "Digita el directorio o fichero: " df
if [ -e "$df" ];then
	if [ -f "$df" ];then
		echo "Digitaste el fichero $df"
	elif [ -d "$df" ];then
		echo "Digitaste el directorio $df"
	else
		echo "fichero o directorio no reconocido."
	fi
else 
	echo "No ubicado o mal digitado"
fi
