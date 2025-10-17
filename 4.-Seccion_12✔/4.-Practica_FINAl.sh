#!/bin/bash
#eze - @eze.swb
#Practica seccion 12
:<< "c"
				MaximoG-MinimoG-Amarillas-Rojas
Real Madrid		-50+	-15+	-14			-2
Boca Junior		-37		-22		-19+		-5+
Oporto			-41		-16		-16			-3
PSG				-44		-17		-17			-4
Bayer Minuch	-48		-16		-12			-1
c
clear
lg="ligas.txt"
if [ -e "$lg" -a -f "$lg" ]; then
	exg=0
	emg=0
	exa=0
	exr=0
	enmg=""
	enng=""
	enma=""
	enmr=""
	while read liga; do
	mg=$( echo $liga | cut -d "-" -f 2 )
	ng=$( echo $liga | cut -d "-" -f 3 )
	ma=$( echo $liga | cut -d "-" -f 4 )
	mr=$( echo $liga | cut -d "-" -f 5 )
	if [ "$mg" -gt "$exg" ]; then
		exg=$mg
		enmg=$( echo $liga | cut -d '-' -f 1 )
	fi
	if [ "$emg" -eq 0 -o "$ng" -lt "$emg" ]; then
		emg=$ng
		enng=$( echo $liga | cut -d '-' -f 1 )
	fi
	if [ "$ma" -gt "$exa" ]; then
		exa=$ma
		enma=$( echo $liga | cut -d '-' -f 1 )
	fi
	if [ "$mr" -gt "$exr" ]; then
		exr=$mr
		enmr=$( echo $liga | cut -d '-' -f 1 )
	fi
	done<$lg
	echo -e "Visualizando Resultados:\n\nMayor goleador: $enmg - $exg\nMenor Goleador: $enng - $emg\nEquipo Maximo Amarillas: $enma - $exa\nEquipo Maximo Rojas: $enmr - $exr\n"
	read -n 1 -p $'Presiona una tecla para continuar...'; clear
	exit 0
else
	read -n 1 -p "$( echo "Archivo $lg no existe.\nDesea crearlo 'y|n': " )" sn
	if [ "$sn" = "y" -o "$sn" = "Y" ]; then
		echo -e "Real Madrid-50-15-14-2\nBoca Junior-37-22-19-5\nOporto-41-16-16-3\nPSG-44-17-17-4\nBayer Minuch-48-16-12-1" > $lg
		echo -e "\nCreando Archivo"; sleep 1; echo -e "\nArchivo Creado"; sleep 1; clear
		./$0
	else
		echo -e "\nImposible Continuar, saliendo..."; sleep 3
		exit 0
	fi	
fi

if [ -e "$lg" -a -f "$lg" ]; then
	rm -f $lg
	echo "Ejecutando limpieza..."; sleep 1
	exit 0
else
	echo "Cerrando Programa..."; clear
fi

