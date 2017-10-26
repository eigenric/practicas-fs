#!/bin/bash
# Titulo:       ej6x3
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               Detecta la zona del teclado
# Opciones: ninguna
# Uso: ./ej6x3.sh

shopt -s nocasematch # También valen las mayúsculas

echo -n "Introduzca un caracter: "
read caracter

case $caracter in
    [º0-9\'!]) fila=1;;
    [qwertyuiop\`+]) fila=2;;
    [asdfghjklñ´ç]) fila=3;;
    [\<zxcvbnm,.-]) fila=4;;
    *) fila=0
esac
echo "El caracter $caracter está en la fila $fila"
