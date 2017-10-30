Examen

Ejercicio 1)

a)

Ejecutamos lo siguiente desde $HOME (/home/ricardoruiz)

$ mkdir -p Examen/D3/D32/D311/D3111 Examen/D3/D32/D31 Examen/D3/D32/D321

Podemos comprobar el buen funcionamiento ejecutando tree

$ tree
.
└── Examen
    └── D3
        └── D32
            ├── D31
            ├── D311
            │   └── D3111
            └── D321

7 directories, 0 files


b)

Para situarnos en el directorio examen

$ cd Examen

Y para crear los archivos

$ touch D3/ej0.cc D3/D32/ej1.txt D3/D32/D31/ej{6,7}.txt D3/D32/D31/ej{5,8,10}.cc D3/D32/D31/ej9 D3/D32/D321/ej2.txt D3/D32/D311/ej3.cc D3/D32/D311/ej4.txt D3/D32/D311/D3111/ej11.txt

Y comprobamos el buen funcionamiento ejecutando tree

$ tree
.
└── Examen
    └── D3
        └── D32
            ├── D31
            ├── D311
            │   └── D3111
            └── D321

7 directories, 0 files

Ejercicio 2)


a)

$ mv D3/D32/D311 D3/D32/D31

Y lo comprobamos mediante tree

$ tree
.
└── D3
    ├── D32
    │   ├── D31
    │   │   ├── D311
    │   │   │   ├── D3111
    │   │   │   │   └── ej11.txt
    │   │   │   ├── ej3.cc
    │   │   │   └── ej4.txt
    │   │   ├── ej10.cc
    │   │   ├── ej5.cc
    │   │   ├── ej6.txt
    │   │   ├── ej7.txt
    │   │   ├── ej8.cc
    │   │   └── ej9
    │   ├── D321
    │   │   └── ej2.txt
    │   └── ej1.txt
    └── ej0.cc


b)

$ mv D32/D31/ D3

Y ejecutamos tree para comprobar


.
├── D32
│   ├── D31
│   │   ├── D311
│   │   │   ├── D3111
│   │   │   │   └── ej11.txt
│   │   │   ├── ej3.cc
│   │   │   └── ej4.txt
│   │   ├── ej10.cc
│   │   ├── ej5.cc
│   │   ├── ej6.txt
│   │   ├── ej7.txt
│   │   ├── ej8.cc
│   │   └── ej9
│   ├── D321
│   │   └── ej2.txt
│   └── ej1.txt
└── ej0.cc

5 directories, 12 files

Ejercicio 3)

Desde D3111 ejecutamos

$ ls ../../D32/D31/ | sort
ej10.cc
ej5.cc
ej6.txt
ej7.txt
ej8.cc
ej9


Ejercicio 4)


#!/bin/bash
# Titulo:       ejercicio4
# Fecha:        28/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  Comprueba si un archivo pertenece al usuario y 
#               si tiene permisos de escritura
#               y si tiene permisos de ejecución
# Opciones: ninguna
# Uso: ./ejercicio4 <archivo>


if [ $# == 1 ]; then
    if [ -f $1 ]; then 

        if [ -O $1 ]; then
            echo "Eres el propietario del archivo $1";
        else
            echo "No eres el propietario del archivo $1";
        fi

        if [ -w $1 ]; then
            echo "Tienes permisos de escritura sobre el archivo $1";
        else
            echo "No tienes permisos de escritura sobre el archivo $1";
        fi

        if [ -x $1 ]; then
            echo "Tienes permisos de ejecución sobre el archivo $1";
        else
            echo "No tienes permisos de ejecución sobre el archivo $1";
        fi

    else
        echo "$1 no es un archivo existente";
        if [ -d $1 ]; then
            echo "De hecho $1 es un directorio";
        fi
        exit 1
    fi
else
    echo "Se admite únicamente un parámetro";
    echo "Uso ./ejercicio4 <archivo>";
fi

Ejercicio 5)


#!/bin/bash
# Titulo:       myfindcount
# Fecha:        28/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#              
#             
# Opciones: ninguna
# Uso: ./myfindcount <archivo>

function _usage() {
    echo "Uso $0 [directorio] <expresion-regular>"
    echo "Nótese que en caso de omision <directorio> sera el actual"
}

function _count_files() {
    if [ ! "$1" = "." ] && [ ! -d $1 ] ; then
        echo "$1 debe ser un directorio"
        _usage && exit 1;
    fi
    find $1 -name "$2" | wc -l;
}

function _argument_error() {
    echo "Debe aportar 1 o 2 argumentos, no $1";
    _usage;
}

case $# in
    1) _count_files . $1;;
    2) _count_files $1 $2;;
    *)  _argument_error $#;
esac
