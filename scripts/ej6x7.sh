#!/bin/bash
# Titulo:       ej6x7
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./ej6x7.sh

function _usage() {
    echo "Sólo permito un parámetro"
    echo "Uso ./ej6x7.sh <shell>"
}

[ ! $# -eq 1 ] && _usage && exit

shell=$1

if `cat /etc/passwd | cut -d ':' --fields=1,7 | grep -q $shell`; then
    echo "Los usuarios que utilizan $shell son: "
    cat /etc/passwd | cut -d ':' --fields=1,7 | grep $shell | cut -d ':' -f1 | sort
else
    echo "Ningún usuario utiliza $shell";
fi
