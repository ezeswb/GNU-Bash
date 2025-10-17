#!/bin/bash
#eze - @eze.swb
#Leer fichero linea a linea

cont=0
while read leer; do
	mgol=$( echo $leer | cut -d '-' -f 2 )
	ngol=$( echo $leer | cut -d '-' -f 3 )
	ma=$( echo $leer | cut -d '-' -f 4 )
	mr=$( echo $leer | cut -d '-' -f 5 )
	contm=$(( $contm+$mgol ))
	contn=$(( $contn+$ngol ))
	conta=$(( $conta+$ma ))
	contr=$(( $contr+$mr ))
done<0.-ficheros/liga.txt
echo -e "Maximo goles del partido: $contm\nMinimo goles del partido: $contn\nAmarillas del partido son: $conta\nRojas del partido son: $contr"
