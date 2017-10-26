Práctica 6: Programación en Shell


Ej 1)

    Técnicas usadas

    - Existe directorio 
        - [ -d $1 ]
    - Tamaño de un archivo
        - Mediante find . -size -$2
    - Comprobación de un número
        - Mediante echo $2 | grep -q '[0-9]\+'
    - Número de argumentos
        - Mediante $#


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


2)

    - Comprobación:
        - Directorio [ -d ]
        - Enlace  [ -L ]
        - Archivo regular [ -f ]



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

Ej 3)


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


Ej 4)


    #!/bin/bash
    # Titulo:       ej6x4
    # Fecha:        26/10/2017
    # Autor:        Ricardo Ruiz
    # Version:      1.0
    # Descripción:  
    #               
    # Opciones: ninguna
    # Uso: ./ej6x4.sh

    if [ $# == 1 ] ; then

        case $1 in
            ene|1) echo "Enero";;
            feb|2) echo "Febrero";;
            mar|3) echo "Marzo";;
            abr|4) echo "Abril";;
            may|5) echo "Mayo";;
            jun|6) echo "Junio";;
            jul|7) echo "Julio";;
            ago|8) echo "Agosto";;
            sep|9) echo "Septiembre";;
            oct|10) echo "Octubre";;
            nov|11) echo "Noviembre";;
            dic|12) echo "Diciembre";;
            *) echo "Introduzca un mes entre 1 y 12 (o las primeras 3 letras)";
        esac

    else 
        echo "Se admite únicamente un parámetro"
        echo "Uso ./ej6x4 <ene/1>"
    fi

Ej 5)

    (read -p "Propmpt: " VARIABLE)
    (Y, con la opción -n1, no añade un \n)


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
