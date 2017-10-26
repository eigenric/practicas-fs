#!/bin/bash
# Titulo:       ej6x3
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               Detecta la zona del teclado
# Opciones: ninguna
# Uso: ./ej6x3.sh

echo -n "Introduzca un caracter: "
read caracter

case $caracter in
    [0-9]) fila=1;;
    [QWERTYUIOP]) fila=2;;
    [ASDFGHJKLÑ]) fila=3;;
    [ZXCVBNM]) fila=4;;
    *) fila=0
esac
echo "El caracter $caracter está en la fila $fila"
