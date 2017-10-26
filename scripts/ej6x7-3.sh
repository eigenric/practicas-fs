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
while read linea; do
    usuario=`echo $linea | cut -d':' -f1`
    shell_path=`echo $linea | cut -d':' -f7`

    if `echo $shell_path | grep -q $1`; then
        echo $usuario >> temp.txt
    fi
done < /etc/passwd

cat temp.txt | sort
rm temp.txt
