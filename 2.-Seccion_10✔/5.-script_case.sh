#!/bin/bash
#eze - @eze.swb
# estructura case

echo "Introduce una cadena"
echo "1.-Decir 'Hola'"
echo "2.-Decir 'Adios'"
echo "3.-Decir 'Linux'"

read -p "> " opcion
case $opcion in
	1) echo "HOLA" ;;
	2) echo "ADIOS" ;;
	3) echo "LINUX" ;;
	*) echo "OPCION INEXISTENTE" ;;
esac
