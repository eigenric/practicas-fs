# Práctica 6: Programación en Shell

## Ejercicio 1

**Escriba un guion que acepte dos argumentos. El primero será el nombre de un directorio y el
segundo será un valor entero. El funcionamiento del guion será el siguiente: deberán anotarse en un archivo
denominado archivosSizN.txt aquellos archivos del directorio dado como argumento y que cumplan la
condición de tener un tamaño menor al valor aportado en el segundo argumento. Se deben tener en cuenta las
comprobaciones sobre los argumentos, es decir, debe haber dos argumentos, el primero deberá ser un directorio
existente y el segundo un valor entero.**

Técnicas usadas

- Existe directorio 
    - `[ -d $1 ]`
- Tamaño de un archivo
    - Mediante `find . -size -$2
- Comprobación de un número
    - Mediante `echo $2 | grep -q '[0-9]\+'`
- Número de argumentos
    - Mediante `$#`

```bash
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
```

## Ejercicio 2

**Escriba un guion que acepte el nombre de un directorio como argumento y
muestre como resultado el nombre de todos y cada uno de los archivos del mismo
y una leyenda que diga "Directorio", "Enlace" o "Archivo regular", según
corresponda. Incluya la comprobación necesaria sobre el argumento, es decir,
determine si el nombre aportado se trata de un directorio existente.**


- Comprobación:
    - Directorio `[ -d ]`
    - Enlace  `[ -L ]`
    - Archivo regular `[ -f ]`

```bash
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
```

## Ejercicio 3

**Escriba un guion en el que, a partir de la pulsación de una
tecla, detecte la zona del teclado donde se encuentre. Las zonas vendrán
determinadas por las filas. La fila de los números 1, 2, 3, 4, ... será la fila
1, las teclas donde se encuentra la Q, W, E, R, T, Y,... serán de la fila 2,
las teclas de la A, S, D, F, ... serán de la fila 3 y las teclas de la Z, X, C,
V, ... serán de la fila 4. La captura de la tecla se realizará mediante la
orden `read`.**

```bash
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
```

## Ejercicio 4

**Escriba un guion que acepte como argumento un parámetro en el que el usuario indica el mes que
quiere ver, ya sea en formato numérico o usando las tres primeras letras del nombre del mes, y muestre el nombre
completo del mes introducido. Si el número no está comprendido entre 1 y 12 o las letras no son significativas del
nombre de un mes, el guion deberá mostrar el correspondiente mensaje de
error.**


```bash
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
```

## Ejercicio 5

**Escriba un guion que solicite un número hasta que su valor esté comprendido entre 1 y 10. Deberá
usar la orden `while` y, para la captura del número, la orden `read`.**


Tiendo en cuenta que:
`read -p "Prompt: " VARIABLE`
Y, con la opción `-n1`, no añade un `\n`

```bash
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
```

## Ejercicio 6.5.5

**Copie [este ejercicio](scripts/rotor.sh) y pruébelo en su sistema para ver su funcionamiento. ¿Qué podemos modificar
para que el giro se vea más rápido o más lento? ¿Qué hace la opción -e de las órdenes echo del guion?**

**Consulte la ayuda de bash, observe que aquí hay información muy interesante sobre las órdenes empotradas (shell
builting commands) como por ejemplo echo, y sobre sus secuencias de escape.**


La variable `$INTERVAL` contiene el tiempo en segundos
de giro. Esto funciona porque el programa duerme durante `$INTERVAL`
segundos mediante la orden sleep en cada iteración del bucle
infinito.

Para conocer lo que raliza la opción `-e` de las órdenes echo del guión,
podemos ejecutar:

```console
$ man echo | grep -- -e

 -e     enable interpretation of backslash escapes

If -e is in effect, the following sequences are recognized:

\\     backslash

\a     alert (BEL)

\b     backspace

\c     produce no further output

Lo que nos indica, que gracias a -e, echo puede interpretar
cararacter como \b o \c

Donde \b permite retroceder una posición en el cursor y
\c hace que no se produzca salto de línea.
```

## Ejercicio 7

**Escriba un guion que admita como argumento el nombre de un tipo de shell (por ejemplo, csh, sh,
bash, tcsh, etc.) y nos dé un listado ordenado alfabéticamente de los usuarios que tienen dicho tipo de shell por
defecto cuando abren un terminal. Dicha información del tipo de shell asignado a un usuario se puede encontrar en
el archivo /etc/passwd, cuyo contenido está delimitado por ':'. Cada información situada entre esos
delimitadores representa un campo y precisamente el campo que nos interesa se encuentra situado en primer lugar.
En definitiva, para quedarnos con lo que aparece justo antes del primer delimitador será útil la orden siguiente:
cut -d':' -f1 /etc/passwd
donde la opción – d indica cuál es el delimitador utilizado y la opción – f1 representa a la secuencia de caracteres
del primer campo. Realice, utilizando el mecanismo de cauces, el ejercicio pero usando la orden cat para mostrar
el contenido de un archivo y encauzado con la orden cut para filtrar la información que aparece justo antes del
delimitador ':'^3.**

Utilice la orden man para conocer otras posibilidades en el uso de la orden cut, en particular, cortar un intervalo de caracteres.


1) Solución sin bucles

```bash
#!/bin/bash

# Titulo:       ej6x7
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./ej6x7.sh

function _usage() {
    echo "Sólo permito un parámetro"
    echo "Uso ./ej6x7.sh <shell>"
}

[ ! $# -eq 1 ] && _usage && exit

shell=$1

if `cat /etc/passwd | cut -d ':' --fields=1,7 | grep -q $shell`; then
    echo "Los usuarios que utilizan $shell son: "
    cat /etc/passwd | cut -d ':' --fields=1,7 | grep $shell | cut -d ':' -f1 | sort
else
    echo "Ningún usuario utiliza $shell";
fi
```

2) Solución con bucle while

```bash
#!/bin/bash
# Titulo:       ej6x7
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./ej6x7.sh

function _usage() {
    echo "Sólo permito un parámetro"
    echo "Uso ./ej6x7.sh <shell>"
}

[ ! $# -eq 1 ] && _usage && exit

shell=$1
while read linea; do
    usuario=`echo $linea | cut -d':' -f1`
    shell_path=`echo $linea | cut -d':' -f7`

    if `echo $shell_path | grep -q $1`; then
        echo $usuario >> temp.txt
    fi
done < /etc/passwd

cat temp.txt | sort
rm temp.txt
```


## Ejercicio 8

**Dos órdenes frecuentes de Unix son tar y gzip. La orden tar permite almacenar/extraer varios
archivos de otro archivo. Por ejemplo, podemos almacenar el contenido de un directorio en un archivo con**

```
tar -cvf archivo.tar directorio
```
(la opción -x extrae los archivos de un archivo .tar).

La orden gzip permite comprimir el contenido de un archivo para que ocupe menos espacio. Por ejemplo, gzip
archivo comprime archivo y lo sustituye por otro con el mismo nombre y con la extensión .gz. La orden para
descomprimir un archivo .gz o .zip es gunzip.

Dadas estas órdenes **construya un guion, denominado cpback, que dado un directorio o lista de archivos como
argumento(s) los archive y comprima en un archivo con nombre copiaYYMMDD, donde YY corresponde al año, la
MM al mes y la DD al día, dentro de un directorio denominado CopiasSeguridad. El guion debe realizar las
comprobaciones oportunas: los argumentos existen, el directorio de destino existe y si no, lo crea.**

Para formatear la fecha a YYMMDD: `date +%y%m%d`

```bash
#!/bin/bash
# Titulo:       cpback
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./cpback

carpeta_destino="CopiasSeguridad"
archivo_destino="$carpeta_destino/copia`date +%y%m%d`"

function _uso() {
    echo "Introduce al menos un parámetro"; 
    echo "Uso $0 <shell>"
}

function _existen() {
    for arg in $*
    do
        [ -e $arg ] || return 1
    done
    return 0
}

if [ $# -lt 1 ] || [ "$1" = "--help" ]; then
    _uso && exit
fi

if _existen $* ; then
    if [ ! -d $carpeta_destino ] ; then
        mkdir $carpeta_destino
    fi
    echo "Los siguientes archivos van a ser almacenados y comprimidos en $archivo_destino.tar.gz: "
    tar -cvf $archivo_destino $*
    gzip $archivo_destino
else
    echo "Algunos de los archivos proporcionados no existen"
fi)
```

## Ejercicio 9

**Hacer un script en Bash denominado newdirfiles con los siguientes tres argumentos:
- <dirname> Nombre del directorio que, en caso de no existir, se debe crear para alojar en él los archivos
que se han de crear.
- <num_files> Número de archivos que se han de crear.
- <basefilename> Será una cadena de caracteres que represente el nombre base de los archivos.

Ese guion debe realizar lo siguiente:
- Comprobar que el número de argumentos es el correcto y que el segundo argumento tenga un valor
comprendido entre 1 y 99.
- Crear, en caso de no existir, el directorio dado en el primer argumento a partir del directorio donde se esté
situado y que posea permisos de lectura y escritura para el usuario $USER.
- Dentro del directorio dado en el primer argumento, crear archivos cuyos contenidos estarán vacíos y cuyos
nombres lo formarán el nombre dado como tercer argumento y un número que irá desde 01 hasta el
número dado en el segundo argumento.**


```bash
#!/bin/bash
# Titulo:       newdirfiles
# Fecha:        26/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  
#               
# Opciones: ninguna
# Uso: ./newdirfiles

dirname=$1
num_files=$2
basefilename=$3

function _uso() {
    echo "Tiene que introducir tres parámetros"; 
    echo "Uso $0 <dirname> <num_files> <basefilename>"
}

if [ ! $# -eq 3 ]; then
    _uso && exit 1
fi

function _crear_archivos() {
    # $1: num archivos
    # $2: directorio
    # $3: nombre base 

    for ((i=1; i<=$1; i++)); do
        if [ $i -lt 10 ]; then
            touch "$2/$30$i"
        else
            touch "$2/$3$i"
        fi
    done
}


if [ $num_files -lt 1 ] || [ $num_files -gt 99 ] ; then
    echo "El número de archivos debe estar comprendido entre 1 y 99"
    exit 1
fi

if [ ! -d $dirname ] ; then
    mkdir $dirname
fi

chmod u+rw $dirname
_crear_archivos $num_files $dirname $basefilename
echo "Creados $num_files archivos en $dirname"
```
