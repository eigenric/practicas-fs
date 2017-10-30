# Práctica 4: Variables, alias, órdenes de búsqueda y guiones

## Ejercicio 1

**Escriba, al menos, cinco variables de entorno junto con el valor que tienen.**

```console
SESSION=xfce
SHELL=/usr/bin/fish
USER=ricardo
```


a) Imprima los valores de las tres variables en tres columnas con 15 caracteres de ancho.
b) ¿Son variables locales o globales?
c) Borre la variable VAR2.
d) Abra otra ventana de tipo terminal, ¿puede visualizar las dos variables restantes?
e) Cree una variable de tipo vector con los valores iniciales de las tres variables.
f) Muestre el segundo elemento del vector creado en el apartado e.


## Ejercicio 2 

**Ejecute las órdenes del cuadro e indique qué ocurre y cómo puede resolver la situación para que la variable NOMBRE se reconozca en el shell hijo.**

```console
$ NOMBRE=FS $ echo $NOMBRE
```

Es mostrado el contenido de la variable, es decir, FS

```console
$ bash $ echo $NOMBRE
```

No es mostrado nada debido a que la variable era local. Cuando se ejecuta otra
shell, desaparece el contenido de la variable.

Esto puede solucionarse mediante la orden export.

```console
$ export NOMBRE=FS 
$ bash
$ echo $NOMBRE
```

En este caso sí se muestra el contenido, FS.

## Ejercicio 3

**Compruebe qué ocurre en las expresiones del ejemplo anterior si se quitan las comillas dobles del
final y se ponen después de los dos puntos. ¿Qué sucede si se sustituyen las comillas dobles por comillas simples?**

a) 

Al ejecutar

```console
$ echo "Los archivos que hay en el directorio son $(ls -l)"

    Los archivos que hay en el directorio son: total 4
    -rw-r--r-- 1 ricardo ricardo 489 oct  4 13:14 practica4-ricardoruiz.txt
```

Mientras que al ejecutar,

```console
$ echo "Los archivos que hay en el directorio son:" $(ls -l)

    Los archivos que hay en el directorio son: total 4 -rw-r--r-- 1 ricardo ricardo 489 oct 4 13:14 practica4-ricardoruiz.txt
```

Es decir, en el segundo caso, no se produce salto de línea.

b)

Si sustituimos las comillas dobles por las simples:

a) 

```console
$ echo 'Los archivos que hay en el directorio son: $(ls -l)'

    Los archivos que hay en el directorio son: $(ls -l)

```

Es decir, la orden ls -l no es ejecutada, sino que se muestra literalmente.

b)

```console
 $ echo 'Los archivos que hay en el direcotrio son:' $(ls -l)

    Los archivos que hay en el directorio son: total 4 -rw-r--r-- 1 ricardo ricardo 489 oct 4 13:14 practica4-ricardoruiz.txt
```

La orden es ejecutada, y todo se muestra en una única línea.
    

## Ejercicio 4

**Pruebe la siguiente asignación:**

```console
$ numero=$numero+1
$ echo $numero
    +1
```

Esto ha ocurrido porque no se ha utilizado la orden expr. Es decir, todo se ha convertido a un
carácter (+1)


```
$ numero=1
$ echo $numero
1
$ numero=`expr $numero + 1`
```


## Ejercicio 5

**Construya un guion que acepte como argumento una cadena de texto (por ejemplo, su nombre) y
que visualice en pantalla la frase Hola y el nombre dado como argumento.**

Escribimos el guión `helloworld.sh`

```bash
    #!/bin/bash

    printf "Hola $1\n"
```

Posteriormente, le otorgamos permiso de ejecución con
console

```console
    $ chmod +x helloworld.sh
```

Y lo ejecutamos con un argumento

```console
$ ./helloworld.sh Ricardo
        Hola Ricardo
```

## Ejercicio 6

**Varíe el guion anterior para que admita una lista de nombres.**

Simplemente sustituimos $1 por $*

```bash
#!/bin/bash

printf "Hola $*\n"
```

## Ejercicio 7

**Cree tres variables llamadas VAR1, VAR2 y VAR3 con los siguientes valores respectivamente `hola`,`adios` y `14`.**

a) 
```console 
  $ printf "%15q %15q %15d\n" $VAR1 $VAR2 $VAR3
                  hola           adios              14
```

b) Son variables locales, las hemos creado mediante `variable=valor`

c) `unset VAR1`

d) No, porque son variables locales

e) `vector=($VAR1 $VAR2 $VAR3)`

f) `echo ${vector[1]}`

## Ejercicio 8


**Cree un alias que se llame `ne` (nombrado así para indicar el número de elementos) y que devuelva
el número de archivos que existen en el directorio actual. ¿Qué cambiaría si queremos que haga lo mismo pero en
el directorio home correspondiente al usuario que lo ejecuta?**


```console
$ alias ne='ls -l | wc -l'
```

Para realizar lo mismo pero en el directorio home del usuario que lo ejecuta:

```console
$ alias ne='ls ~ -l | wc -l'
```

## Ejercicio 9


**Indique la línea de orden necesaria para buscar todos los archivos a partir del directorio home que
tengan un tamaño menor de un bloque. ¿Cómo la modificaría para que además imprima el resultado en un archivo
que se cree dentro del directorio donde nos encontremos y que se llame archivos?**


```console
    $ find ~ -size -1
```

Para imprimir el resultado en un archivo dentro del directorio actual

```console
    $ find ~ -size -1 > archivosP
```

## Ejercicio 10

**Indique cómo buscaría todos aquellos archivos del directorio actual que contengan la palabra
“ejemplo”.**
 
```console
$ grep ejemplo ./*
```


## Ejercicio 11

**Complete la información de find y grep utilizando para ello la orden man.**


```console
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
```

## Ejercicio 12

**Indique cómo buscaría si un usuario dispone de una cuenta en el sistema.**



    Usar `who` no es una opción, ya que solo devuelve los usuarios identificados
en el sistema. Para comprobar si un usuario dispone cuenta, es mejor buscar su
nombre de usuario en el archivo `/etc/passwd`

```console
    $ cat /etc/passwd | grep usuario-a-buscar
```

## Ejercicio 13

**Indique cómo contabilizar el número de ficheros de la propia cuenta de usuario que no tengan
permiso de lectura para el resto de usuarios.**


```console
    $ find ~ ! -perm -o+r | wc -l
      34431
```

    Esto indica, a find que devuelva los archivos que no tengan permiso de
lectura para el resto de usuarios del directorio `~`.
    Y luego, esta salida es redireccionada a wc mediante un cauce (|). Este,
cuenta el número de líneas (correspondiente al número de ficheros) mediante la
opción `-l`.

## Ejercicio 14

**Modifique el ejercicio 8 de forma que, en vez de un alias, sea un guion llamado `numE` el que
devuelva el número de archivos que existen en el directorio que se le pase como argumento.**

```bash
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
```
    

Le otorgamos permisos de ejecución con:

```console
$ chmod +x numE
```

Lo ejecutamos y comprobamos su funcionamiento

Para el directorio actual `.` (contiene 4 archivos)

```console
$ ./numE .
   4
```

Para el directorio home

```console
$ ./numE ~
    35
```

Notar que esta orden muestra tanto archivos como directorios.
