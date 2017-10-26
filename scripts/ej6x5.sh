#!/bin/bash
# Titulo:       ej6x5
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./ej6x5.sh

num=0
while [ "$num" -lt 1 ] || [ "$num" -gt 10 ] ; 
do
    read -p "Introducde un número entre 1 y 10: " num
    echo $num
done
