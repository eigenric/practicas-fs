Práctica 4: Variables, alias, órdenes de búsqueda y guiones

Ej 4.2)

    $ NOMBRE=FS $ echo $NOMBRE

    Es mostrado el contenido de la variable, es decir, FS

    $ bash $ echo $NOMBRE

    No es mostrado nada debido a que la variable era local. Cuando se ejecuta otra
    shell, desaparece el contenido de la variable.

    Esto puede solucionarse mediante la orden export.

    $ export NOMBRE=FS $ bash $ echo $NOMBRE

    En este caso sí se muestra el contenido, FS.

Ej 4.3)

    a) 
        Al ejecutar

        $ echo "Los archivos que hay en el directorio son $(ls -l)"

            Los archivos que hay en el directorio son: total 4
            -rw-r--r-- 1 ricardo ricardo 489 oct  4 13:14 practica4-ricardoruiz.txt

        Mientras que al ejecutar,

        $ echo "Los archivos que hay en el directorio son:" $(ls -l)

            Los archivos que hay en el directorio son: total 4 -rw-r--r-- 1 ricardo ricardo 489 oct 4 13:14 practica4-ricardoruiz.txt

        Es decir, en el segundo caso, no se produce salto de línea.

    b)

        Si sustituimos las comillas dobles por las simples:

            a) $ echo 'Los archivos que hay en el directorio son: $(ls -l)'

                Los archivos que hay en el directorio son: $(ls -l)

            Es decir, la orden ls -l no es ejecutada, sino que se muestra literalmente.

            b) $ echo 'Los archivos que hay en el direcotrio son:' $(ls -l)

                Los archivos que hay en el directorio son: total 4 -rw-r--r-- 1 ricardo ricardo 489 oct 4 13:14 practica4-ricardoruiz.txt

            La orden es ejecutada, y todo se muestra en una única línea.
    

Ej 4.4.)

    Ejecutando
    $ numero=$numero+1
    $ echo $numero
        +1

    Esto ha ocurrido porque no se ha utilizado la orden expr. Es decir, todo se ha convertido a un
carácter (+1)


Ej 4.5)

    Escribimos el guión helloworld.sh

        #!/bin/bash

        printf "Hola $1\n"

    Posteriormente, le otorgamos permiso de ejecución con

        $ chmod +x helloworld.sh

    Y lo ejecutamos con un argumento
        $ ./helloworld.sh Ricardo
            Hola Ricardo

Ej 4.6)

Simplemente sustituimos $1 por $*

    #!/bin/bash

    printf "Hola $*\n"



Ej 4.7)

    a) $ printf "%15q %15q %15d\n" $VAR1 $VAR2 $VAR3
                      hola           adios              14

    b) Son variables locales, las hemos creado mediante variables=valor
    c) unset VAR1
    d) No, porque son variables locales
    e) vector=($VAR1 $VAR2 $VAR3)
    f) echo ${vector[1]}

Ej 4.8)

    $ alias ne='ls -l | wc -l'

    Para realizar lo mismo pero en el directorio home del usuario que lo
ejecuta:

    $ alias ne='ls ~ -l | wc -l'

Ej 4.9)

    $ find ~ -size -1

Para imprimir el resultado en un archivo dentro del directorio actual

    $ find ~ -size -1 > archivosP


Ej 4.10)

    $ grep ejemplo ./*


Ej 4.11)

    $ man find

    Podemos destacar los siguientes argumentos para el parámetro type

       -type c
              File is of type c:

              b      block (buffered) special

              c      character (unbuffered) special

              d      directory

              p      named pipe (FIFO)

              f      regular file

              l      symbolic link; this is never true if the -L option or the -follow option is in effect, unless the symbolic  link  is  broken.
                     If you want to search for symbolic links when -L is in effect, use -xtype.

              s      socket

    $ man grep


        Podemos añadir la opción -h

           -h, --no-filename
                      Suppress the prefixing of file names on output.  This is the default when there is only one file (or only standard input) to search.



Ej 4.12)

    Usar who no es una opción, ya que solo devuelve los usuarios identificados
en el sistema. Para comprobar si un usuario dispone cuenta, es mejor buscar su
nombre de usuario en el archivo /etc/passwd


    $ cat /etc/passwd | grep usuario-a-buscar

Ej 4.13)

    $ find ~ ! -perm -o+r | wc -l
      34431

    Esto indica, a find que devuelva los archivos que no tengan permiso de
lectura para el resto de usuarios del directorio ~.
    Y luego, esta salida es redireccionada a wc mediante un cauce (|). Este,
cuenta el número de líneas (correspondiente al número de ficheros) mediante la
opción -l.


Ej 4.14)

    Escribimos el guión numE

    
    #!/bin/bash
    # Titulo:       numE
    # Fecha:        05/10/2017
    # Autor:        Ricardo Ruiz
    # Version:      1.0
    # Descripción:  Cuenta el número de archivos del directorio
    #               dado como primer argumento
    # Opciones: ninguna
    # Uso: numE directorio

    ls -1 $1 | wc -l
    

    Le otorgamos permisos de ejecución con:
    $ chmod +x numE
    
    Lo ejecutamos y comprobamos su funcionamiento

    Para el directorio actual . (contiene 4 archivos)
        $ ./numE .
          4
    Para el directorio home
        $ ./numE ~
          35

    Notar que esta orden muestra tanto archivos como directorios.

