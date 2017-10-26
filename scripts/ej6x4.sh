#!/bin/bash
# Titulo:       ej6x4
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./ej6x4.sh

if [ $# == 1 ] ; then

    case $1 in
        ene|1) echo "Enero";;
        feb|2) echo "Febrero";;
        mar|3) echo "Marzo";;
        abr|4) echo "Abril";;
        may|5) echo "Mayo";;
        jun|6) echo "Junio";;
        jul|7) echo "Julio";;
        ago|8) echo "Agosto";;
        sep|9) echo "Septiembre";;
        oct|10) echo "Octubre";;
        nov|11) echo "Noviembre";;
        dic|12) echo "Diciembre";;
        *) echo "Introduzca un mes entre 1 y 12 (o las primeras 3 letras)";
    esac

else 
    echo "Se admite únicamente un parámetro"
    echo "Uso ./ej6x4 <ene/1>"
fi

