#!/bin/bash
# Titulo:       newdirfiles
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./newdirfiles

dirname=$1
num_files=$2
basefilename=$3

function _uso() {
    echo "Tiene que introducir tres parámetros"; 
    echo "Uso $0 <dirname> <num_files> <basefilename>"
}

if [ ! $# -eq 3 ]; then
    _uso && exit 1
fi

function _crear_archivos() {
    # $1: num archivos
    # $2: directorio
    # $3: nombre base 

    for ((i=1; i<=$1; i++)); do
        if [ $i -lt 10 ]; then
            touch "$2/$30$i"
        else
            touch "$2/$3$i"
        fi
    done
}


if [ $num_files -lt 1 ] || [ $num_files -gt 99 ] ; then
    echo "El número de archivos debe estar comprendido entre 1 y 99"
    exit 1
fi

if [ ! -d $dirname ] ; then
    mkdir $dirname
fi

chmod u+rw $dirname
_crear_archivos $num_files $dirname $basefilename
echo "Creados $num_files archivos en $dirname"
