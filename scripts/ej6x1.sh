#!/bin/bash
# Titulo:       ej6x1
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  Se anotan en archivosSinZ.txt 
#               los archivos del directorio dado como argumento
#               y que cumplan la condición de tener un tamaño menor
#               al segundo argumento. Deben ser comprobados los argumentos
# Opciones: ninguna
# Uso: ./ej6x1 <directorio> <tamaño>

if [ $# == 2 ] ; then
    if [ -d $1 ] && $es_entero; then
        if `echo $2 | grep -q '[0-9]\+'`; then
            find $1 -size -$2 > archivosSizN.txt
            echo "`cat archivosSizN.txt | wc -l` archivos guardados en archivosSizN.txt"
        else
            echo "Introduzca como segundo parametro un número entero"
        fi
    else
       echo "El directorio $1 no existe"
    fi
else
    echo "Necesarios dos parámetros"
    echo "Uso: ./ej6x1 <directorio> <tamaño>"
fi
