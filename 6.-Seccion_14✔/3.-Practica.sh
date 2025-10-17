#!/bin/bash
#eze - @eze.swb
#Eliminar Procesos, entrada por parametro

for pid in $*; do
	echo $pid
	kill -9 $pid 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "Sin errores, comando completo."
	else
		echo "ERROR, comando no ejecutado."
	fi
done

for pid in $*; do
	echo $pid
    kill -9 $pid 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Sin errores, comando completo."
    else
       echo "ERROR, comando no ejecutado."
    fi
done

