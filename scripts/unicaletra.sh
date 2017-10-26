#!/bin/bash
# Titulo:       unicaletra
# Fecha:        19/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  Informa si el argumento dado es una única letra
#               en mayúsculas o en minúsculas o es algo distinto
#               de una única letra
# Opciones: ninguna
# Uso: unicaletra <algo>

if  echo $1 | grep '^[a-Z]\{1\}$' > /dev/null ; then
    echo "Es una única letra";
else
    echo "Es algo distinto de una única letra";
fi 2> /dev/null
