#!/bin/bash
#eze - @eze.swb
#Practica final - Operaciones Bancarias

doc=".ATM.doc"
alo=".alogs.doc"
rlo=".rlogs.doc"

#formato tabla
bh=$( printf '%*s\n' 37 '' | tr ' ' '-' )
formato="| %-15s | %-15s |\n"
bhh=$( printf '%*s\n' 127 '' | tr ' ' '-' )
formatoo="| %-15s | %-15s | %-15s | %-15s | %-15s | %-15s | %-15s |\n"

isaldo(){

	cut -d ':' -f 1 $doc | cat -n

	read -p $'\nDigita Tu Usuario: ' isal
	isuser=$( grep -iw $isal $doc | cut -d ':' -f 2 )
	
	#Tabla Consulta
	echo "$bh"
	printf "$formato" "Usuario" "Saldo Actual"
	echo "$bh"
	printf "$formato" "$isal" "$isuser"
	echo -e "$bh\n"

	read -p "Monto a Agregar: " montoa
	nasal=$(( $isuser+$montoa ))
	sed -i "/^$isal:/s/:.*/:$nasal/" "$doc"
	
	#Tabla Saldo Agregado 
	echo -e "\n$bh"
	printf "$formato" "Usuario" "Saldo Nuevo"
	echo "$bh"
	printf "$formato" "$isal" "$nasal"
	echo -e "$bh\n"
			
	fecha=$( date +"%d-%m-%y" )
	hora=$( date +"%H:%M:%S" )
	r=0
	echo "$isal;$fecha;$hora;$isuser;$montoa;$r;$nasal" >> $alo
		
	read -n1 -p "Presiona una tecla para continuar..."
}

rsaldo(){
	
	cut -d ':' -f 1 $doc | cat -n

	read -p $'\nDigita Tu Usuario: ' rsal
	rsuser=$( grep -iw $rsal $doc | cut -d ':' -f 2 )

	#Tabla Cunsulta
	echo "$bh"
	printf "$formato" "Usuario" "Saldo Actual"
	echo "$bh"
	printf "$formato" "$rsal" "$rsuser"
	echo -e "$bh\n"

	read -p "Monto a Retirar: " montor
	nrsal=$(( $rsuser-$montor ))
	sed -i "/^$rsal:/s/:.*/:$nrsal/" "$doc"
	
	#Tabla Saldo Agregado
	echo -e "\n$bh"
	printf "$formato" "Usuario" "Saldo Nuevo"
	echo "$bh"
	printf "$formato" "$rsal" "$nrsal"
	echo -e "$bh\n"

	fecha=$( date +"%d-%m-%y" )
	hora=$( date +"%H:%M:%S" )
	a=0
	echo "$rsal;$fecha;$hora;$rsuser;$a;$montor;$nrsal" >> $rlo

	read -n1 -p "Presiona una tecla para continuar..."
}

registros(){

	read -n1 -p $'\n1.-Saldo Agregado\n2.-Saldo Retirado\n\nDigita Una Opcion: ' op
			
	case $op in

	1)	if [ -e "$alo" ]; then
			echo -e "\n"
			cut -d ':' -f 1 $doc | cat -n
			read -p $'\nDigita tu Usuario: ' useralo
			
			rega=$( grep -iw "$useralo" "$alo")
			#Tabla Registro - Saldo Agregado
			echo -e "\n$bhh"
			printf "$formatoo" "Usuario" "Fecha" "Hora" "Saldo" "Salgo Agregado" "Saldo Retirado" "Saldo Actual"
			echo "$bhh"
			while IFS=';' read -r aus fe ho sa ag re sac; do 
				printf "$formatoo" "$aus" "$fe" "$ho" "$sa" "$ag" "$re" "$sac"
			done <<< "$rega"
			echo -e "$bhh\n"

			read -n1 -p "Presiona una tecla para continuar..."
	
		else
			read -n1 -p $'\n\nSin registro de Saldo Agregado.\nPresiona una tecla para continuar...'
		fi
	;;
	2)	if [ -e "$rlo" ]; then
			echo -e "\n"
			cut -d ':' -f 1 $doc | cat -n

			read -p $'\nDigita tu Usuario: ' userrlo
			
			regr=$( grep -iw "$userrlo" "$rlo")
			#Tabla Registro - Salgo Retirado
			echo -e "\n$bhh"
			printf "$formatoo" "Usuario" "Fecha" "Hora" "Saldo" "Salgo Agregado" "Saldo Retirado" "Saldo Actual"
			echo "$bhh"
			while IFS=';' read -r rus fe ho sa ag re sac; do 
				printf "$formatoo" "$rus" "$fe" "$ho" "$sa" "$ag" "$re" "$sac"
			done <<< "$regr"
			echo -e "$bhh\n"
			
			read -n1 -p "Presiona una tecla para continuar..."
		else
			read -n1 -p $'\n\nSin registro de Saldo Retirado.\nPresiona una tecla para continuar...'
		fi
	;;
	*)	echo "Opcion Invalida"

	;;
	esac
}

menuBD(){
read -n 1 -p "$( echo -e "\t0.-Menu Princiopal\n\t1.-Agregar Cuenta\n\t2.-Eliminar Cuenta\n\t3.-Mostrar Datos\n\t4.-Salir\n\nIngresa una Opcion: \a" )" menu
	clear
	case $menu in
		0)	echo -e "\n======= Menu Principal =======\n"
			menuPR		
		;;
		1)	echo -e "\n======= Agregando Cuenta =======\n"
			read -p "Usuario: " user
			read -p "Saldo: " sal
			read -n 1 -p "$( echo "$user:$sal" >> $doc; echo -e "Usuario Creado.\nPresione una tecla para continuar..." )"
			clear
			menuPR			
		;;
		2)	echo -e "\n======= Eliminando Cuenta =======\n"
			cut -d ':' -f 1 $doc | cat -n
			read -p $'\nEscriba el Nombre de Usuario: ' udel
			read -n 1 -p "$( sed -i "/$udel/Id" $doc; echo -e "Usuario '$udel' Eliminado.\nPresione Una Tecla Para Continuar..." )"
		;;
		3)	echo -e "\n======= Mostrando Datos =======\n"
			cut -d ':' -f 1 $doc | cat -n
			read -n 1 -p $'\nPresione una tecla para continuar...'
		;;
		4)	echo -e "\n======= Saliendo =======\n"
			sleep 1; clear; exit 0
		;;
		*)	echo -e "\n======= Opcion Invalida =======\n"
		
		;;
	esac
}

menuPR(){
while true; do
	clear
	read -n 1 -p "$( echo -e "\n------- Cajero Script -------\n\n\t0.-Salir\n\t1.-Ingresar Saldo\n\t2.-Retirar Saldo\n\t3.-Registros Bancarios\n\t4.-Ir a Base de Datos\n\nIngresa una Opcion: " )" op
	clear
	case $op in
		0)	echo -e "\n======= Saliendo =======\n"

			sleep 1; clear; exit 0
		;;
		1)	echo -e "\n======= Ingresando Saldo =======\n"
			isaldo
		;;
		2)	echo -e "\n======= Retirando Saldo =======\n"
			rsaldo
		;;
		3)	echo -e "\n======= Registros Bancarios de Usuario =======\n"
			registros
		;;
		4)	echo -e "\n======= Base de Datos =======\n"
			menuBD
		;;
		*)	echo -e "\n======= Opcion Incorrecta =======\n"
			sleep 0.5
		;;
		esac
	done
}
clear
if [ -e "$doc" ] && [ -s "$doc" ]; then
	read -n 1 -p $'\n~~~ Prefecto, Base de Datos Completa!!! ~~~\n\nPresione una tecla para continuar...'
	menuPR

elif [ -e "$doc" ] && [ ! -s "$doc" ]; then
	read -n 1 -p "$( echo -e "\n~~~ La Base de Datos esta Vacia!!! ~~~\n\nDesea Agregar Datos? (Y/N): " )" bd
	if [ "$bd" = "y" -o "$bd" = "Y" ]; then
		clear
		echo -e "\n------- Agregando Datos a la Base de Datos -------\n"
		menuBD

	else
		read -n 1 -p $'\nOpcion Valida...\nPresione una tecla para finalizar...'
	fi

elif [ ! -e "$doc" ]; then
	read -n 1 -p "$( echo -e "\n~~~ La Base de Datos no existe!!! ~~~\n\nDesea Crearla y Agregar Datos? (Y/N): " )" bd
	if [ "$bd" = "y" -o "$bd" = "Y" ]; then
		clear
		echo -e "\n------- Creando Base de Datos Y Agregando Datos -------\n"
		menuBD

	else
		read -n 1 -p $'\nOpcion Valida...\nPresione una tecla para finalizar...'
	fi
fi

