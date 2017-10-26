#!/bin/bash
# Titulo:       ej6x2
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               Muestra por pantalla si los archivos
#               del directorio pasado como argumento
#               son enlaces simbólicos, archivos regulares o directorios
# Opciones: ninguna
# Uso: ./ej6x1 <directorio>

if [ -d $1 ]; then
    for archivo in `find $1`;
    do
       tipo=`([ -L $archivo ] && echo "Enlace simbólico") || \
             ([ -f $archivo ] && echo "Archivo regular") || \
             ([ -d $archivo ] && echo "Directorio")`

       echo "$archivo: $tipo"
    done
else
    echo "El directorio $1 no existe"
    echo "Uso ./ej6x2 <directorio>"
fi
