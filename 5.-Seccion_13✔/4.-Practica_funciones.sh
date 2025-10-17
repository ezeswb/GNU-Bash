#!/bin/bash
#eze - @eze.swb
#Practica resuelta

reboot(){ 
	if [ -e ".agenda.txt" ]; then
		rm -rf .agenda.txt
		read -n 1 -p $'AGENDA RESETEADA!!!\nPresione una tecla para continuar...'
	else
		read -n 1 -p $'SIN CONTACTOS, AGENDA VACIA!!!\nPresione una tecla para continuar...'
	fi
}

insert(){  
	read -p "Nombre: " nomi
	read -p "Numero: " numi
	if [ -n "$nomi" -a -n "$numi" ]; then
		echo "$nomi:$numi" >> .agenda.txt
		read -n 1 -p $'AGREGADO!!!\nPresione una tecla para continuar...'
	else
		read -n 1 -p $'Datos Imcompletos\nPresiona una tecla para continuar...'
	fi
}

search(){ 
	if [ -e ".agenda.txt" ]; then
		read -p "Nombre: " noms
		nomse=$( cut -d ':' -f 1 .agenda.txt | grep -iw "$noms" )
		if [ -n "$noms" -a "$noms" = "$nomse" ]; then
			read -n 1 -p "$( echo -e "$noms esta Agendada.\nPresione una tecla para continuar..." )"
		else
			read -n 1 -p $'SIN RESULTADOS!!!\nPresione una tecla para continuar...'
		fi
	else
		read -n 1 -p $'SIN CONTACTOS PARA BUSQUEDA!!!\nPresione una tecla para continuar...'
	fi
}

show(){  
	if [ -e ".agenda.txt"  ]; then
		cat -n .agenda.txt
		read -n 1 -p $'\nPresione una tecla para continuar...'
	else 
		read -n 1 -p $'SIN CONTACTOS PARA MOSTRAR!!!\nPresione una tecla para continuar...'
	fi
}

del(){
	if [ -e ".agenda.txt" ]; then
		read -p "Nombre: " nomd
		nomde=$( cut -d ':' -f 1 .agenda.txt | grep -iw "$nomd" )
		if [ -n "$nomd" -a "$nomd" = "$nomde" ]; then
			sed -i "/$nomd/Id" .agenda.txt
			cat -n .agenda.txt
			read -n 1 -p "$( echo -e "\nSe Elimino $nomd.\nPresione una tecla para continuar..." )"
		else
			read -n 1 -p $'No encontrado...\nPresione una tecla para continuar...' 
		fi
	else
		read -n 1 -p $'Sin contactos\nPresione una tecla para continuar...'
	fi
}

while true; do
	clear
	echo -e "\n---- AGENDA----\n\n1.-Reiniciar Agenda\n2.-Insertar Contacto\n3.-Buscar Contacto\n4.-Mostrar Agenda\n5.-Eliminando Contacto\n6.-Salir\n"
	read -n 1 -p $'Ingresa una OPCION: ' op; echo ""
	case $op in
		1) echo -e "\nReiniciando Agenda\n"
		reboot
		;;
		2) echo -e "\nInsertando Contacto\n"
		insert
		;;
		3) echo -e "\nBuscando Contacto\n"
		search
		;;
		4) echo -e "\nMostrando Agenda\n"
		show
		;;
		5) echo -e "\nEliminando Contacto\n"
		del
		;;
		6) echo -e "\nSaliendo\n"
		exit 0	
		;;
	esac
done
