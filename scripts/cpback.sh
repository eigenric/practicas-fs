#!/bin/bash
# Titulo:       cpback
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./cpback

carpeta_destino="CopiasSeguridad"
archivo_destino="$carpeta_destino/copia`date +%y%m%d`"

function _uso() {
    echo "Introduce al menos un parámetro"; 
    echo "Uso $0 <shell>"
}

function _existen() {
    for arg in $*
    do
        [ -e $arg ] || return 1
    done
    return 0
}

if [ $# -lt 1 ] || [ "$1" = "--help" ]; then
    _uso && exit
fi

if _existen $* ; then
    if [ ! -d $carpeta_destino ] ; then
        mkdir $carpeta_destino
    fi
    echo "Los siguientes archivos van a ser almacenados y comprimidos en $archivo_destino.tar.gz: "
    tar -cvf $archivo_destino $*
    gzip $archivo_destino
else
    echo "Algunos de los archivos proporcionados no existen"
fi
