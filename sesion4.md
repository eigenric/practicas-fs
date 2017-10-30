# Práctica 5: expresiones con variable y expresiones regulares

## Ejercicio 1

**Utilizando una variable que contenga el valor entero 365 y otra que guarde el número del día actual
del año en curso, realice la misma operación del ejemplo anterior usando cada una de las diversas formas de
cálculo comentadas hasta el momento, es decir, utilizando `expr`, `$(( ... ))` y `$[ ... ]`.**



Primero declaramos las dos variables mediante el comando
declare.

```console
$ declare -i dias_anio=365
$ declare -i dia_actual=$(date +%j)
```

Ahora realizamos la operacion de dos formas:

```console
$ echo "Faltan $(( (dias_anio-dia_actual) / 7)) semanas hasta el fin de año"
$ echo "Faltan $[(dias_anio-dia_actual)/7] semanas hasta el fin de año"
```

Nótese que son necesarios los dobles paréntesis en la expresión $(()),
y que ninguno de los casos es necesario preceder el nombre de las
variables con $.


## Ejercicio 2


**Realice las siguientes operaciones para conocer el funcionamiento del operador de incremento
como sufijo y como prefijo. Razone el resultado obtenido en cada una de ellas:**

```console
$ v=1
$ echo $v
$ echo $((v++))
$ echo $v
$ echo $((++v))
$ echo $v
```

```console
$ v=1
```

La variable es declarada e inicializada a 1.

```console
$ echo $v
1
```

Se muestra el valor de la variable, que es
claramente 1.

```console
$ echo $((v++))
1
```

Como v++ es incremento en una unidad sufijo, primero
se muestra el valor de la variable y luego se incrementa
ésta en 1.

```console
$ echo $v
2
```

Como ante se ha incrementado en 1, ahora el valor de la
variable es 2.

```console
$ echo $((++v))
3
```

Como `v--` es incremento en una unidad prefijo, primero
se incrementa v en una unidad y luego se muestra el valor
de la variable. Como el valor de la variable anteriormente
era 2, aumenta a 3 que es lo que se muestra


```console
$ echo $v
3
```

El valor mostrado es 3, pues no se ha realizado ningún
cambio desde el último incremento.


## Ejercicio 3

**Utilizando el operador de división, ponga un caso concreto donde se aprecie que la asignación
abreviada es equivalente a la asignación completa, es decir, que x/=y equivale a x=x/y.
En el resultado del cálculo de expresiones aritméticas, bash solamente trabaja con números enteros, por lo que si
se necesitase calcular un resultado con decimales, habría que utilizar una forma alternativa, como puede ser la
ofrecida por la orden `bc` , cuya opción `- l` , letra “ele”, permite hacer algunos cálculos matemáticos (admite otras
posibilidades que pueden verse mediante `man`).**


Utilizando la asignación completa

```console
$ x=10
$ y=2
$ echo $[x=x/y]
  5
$ echo $x
  5
```

Utilizando la asignación abreviada

```console
$ x=10
$ y=2
$ echo $[x/=y]
5
$ echo $x
5
```

Lo que muestra que son equivalentes.

# Ejercicio 4

**Compruebe qué ocurre si en el ejemplo anterior utiliza comillas dobles o simples para acotar todo lo
que sigue a la orden `echo`. ¿Qué sucede si se acota entre comillas dobles solamente la expresión aritmética que se
quiere calcular?, ¿y si se usan comillas simples?**


```console
$ echo "6/5 | bc -l"
6/5 | bc -l

$ echo "6/5" | bc -l
1.20000000000000000000

$ echo '6/5 | bc -l'
6/5 | bc -l

$ echo '6/5' | bc -l
1.20000000000000000000
```

No hay diferencia entre usar comillas simples y dobles
en este caso. Cuando se acota todo lo que sigue a echo,
se muestra literalmente eso. Sin embargo, si sólo se acota
la expresión aritmetica, el resultado 6/5 es pasado mediante
el cauce a la orden `bc -l`.

# Ejercicio 5


**Calcule con decimales el resultado de la expresión aritmética (3-2)/5. Escriba todas las
expresiones que haya probado hasta dar con una respuesta válida. Utilizando una solución válida, compruebe qué
sucede cuando la expresión aritmética se acota entre comillas dobles; ¿qué ocurre si se usan comillas simples?, ¿y
si se ponen apóstrofos inversos?**


Probando como en el ejercicio anterior:


```
$ echo (3-2)/5 | bc -l
bash: error sintáctico cerca del elemento inesperado `3-2'
```

Como vemos la expresión (3-2)/5 no se ha evaluado ya que no
iba acotada por $(()) o por $[].

```
$ echo $[(3-2)/5] | bc -l
0
```

En este caso la expresión sí se ha ejecutado, pero la divisón
entre 1 y 5 se realiza de forma entera, es decir resultado 0.
Por tanto, la orden bc -l no devuelve otra expresión decimal
que el propio 0.

```
$ echo "(3-2)/5" | bc -l
.20000000000000000000
```

En este caso, la solución sí es la correcta.

Probemos ahora qué sucede con comillas simples:

```
$ echo '(3-2)/5' | bc -l
.20000000000000000000
```

Es decir, las expresiones son equivalentes.

En el caso de apóstrofos inversos.

```
$ echo `(3-2)/5` \ bc -l
bash: command substitution: línea 1: error sintáctico cerca del elemento inesperado `/5'
bash: command substitution: línea 1: `(3-2)/5'
```

Resulta error, ya que los apóstrofos inversos intentan
ejecutar la orden `(3-2)/5`, la cual hemos visto que era posible
evaluar debido a la falta de `$(())` o `$[]`.


## Ejercicio 6

**Consulte la sintaxis completa de la orden `let` utilizando la orden de ayuda para las órdenes
empotradas ( `help let`) y tome nota de su sintaxis general.**

`let arg [arg ...]`

Evalúa cada ARG como una expresión aritmética.  La evaluación se hace
con enteros de longitud fija, sin revisar desbordamientos, aunque la
la división por 0 se captura y se marca como un error.  La siguiente
lista de operadores está agrupada en niveles de operadores de la misma
prioridad.  Se muestran los niveles en orden de prioridad decreciente.

## Ejercicio 7

**Al realizar el ejercicio anterior habrá observado que la orden `let` admite asignaciones múltiples y
operadores que nosotros no hemos mencionado anteriormente. Ponga un ejemplo de asignación múltiple y, por
otra parte, copie en un archivo el orden en el que se evalúan los operadores que admite.**



```console
$ let a=1,b=2
$ echo "a es igual a $a y b es igual a $b".
a es igual a 1 y b es igual a 2
```

El orden en el se que se evalúan los operadores:

```console
    id++, id--	post-incremento, post-decremento de variable
    ++id, --id	pre-incremento, pre-decremento de variable
    -, +		menos, más unario
    !, ~		negación lógica y basada en bits
    **		exponenciación
    *, /, %		multiplicación, división, residuo
    +, -		adición, sustracción
    <<, >>		desplazamientos de bits izquierdo y derecho
    <=, >=, <, >	comparación
    ==, !=		equivalencia, inequivalencia
    &		AND de bits
    ^		XOR de bits
    |		OR de bits
    &&		AND lógico
    ||		OR lógico
    expr ? expr : expr
    		operador condicional
    =, *=, /=, %=,
    +=, -=, <<=, >>=,
    &=, ^=, |=	asignación
```

## Ejercicio 8


**Haciendo uso de las órdenes conocidas hasta el momento, construya un guion que admita dos
parámetros, que compare por separado si el primer parámetro que se le pasa es igual al segundo, o es menor, o es
mayor, y que informe tanto del valor de cada uno de los parámetros como del resultado de cada una de las
evaluaciones mostrando un 0 o un 1 según corresponda.**


Script compara

```bash
#!/bin/bash
# Titulo:       compara
# Fecha:        19/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  Compara los dos argumentos dados
# Opciones: ninguna
# Uso: compara <num1> <num2>

echo "El valor del primer parámetro es $1 y del segundo $2"

let mayor="$1 > $2"
let menor="$1 < $2"
let iguales="$1 == $2"

echo "¿$1 es mayor que $2?: $mayor"
echo "¿$1 es menor que $2?: $menor"
echo "¿$1 es igual que $2?: $iguales"
```

Procedamos a ejecutarlo

```console
$ chmod +x compara
$ ./compara 1 2

El valor del primer parámetro es 2 y del segundo 1
¿2 es mayor que 1?: 1
¿2 es menor que 1?: 0
¿2 es igual que 1?: 0
```

```console
$ ./compara 2 1

El valor del primer parámetro es 1 y del segundo 2
¿1 es mayor que 2?: 0
¿1 es menor que 2?: 1
¿1 es igual que 2?: 0

$ ./compara 1 1

El valor del primer parámetro es 1 y del segundo 1
¿1 es mayor que 1?: 0
¿1 es menor que 1?: 0
¿1 es igual que 1?: 1
```

# Ejercicio 9


**Usando `test` , construya un guion que admita como parámetro un nombre de archivo y realice las
siguientes acciones: asignar a una variable el resultado de comprobar si el archivo dado como parámetro es plano
y tiene permiso de ejecución sobre él; asignar a otra variable el resultado de comprobar si el archivo es un enlace
simbólico; mostrar el valor de las dos variables anteriores con un mensaje que aclare su significado. Pruebe el
guion ejecutándolo con /bin/cat y también con /bin/rnano.**


```bash
#!/bin/bash
# Titulo:       comprueba
# Fecha:        19/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  Comprueba si el archivo es plano y tienes
#               permiso de ejecución sobre él o si es un enlace
#               simbólico
# Opciones: ninguna
# Uso: comprueba <archivo>

planoejecucion=`([ -x $1 ] && [ -f $1 ]) && echo "es" || echo "no es"`
enlacesimbolico=`[ -h $1 ] && echo "es" || echo "no es"`

echo "El archivo $1 $planoejecucion un archivo plano ejecutable"
echo "El archivo $1 $enlacesimbolico un enlace simbólico"
```

Nota: hemos usado la sintaxis [ ] en lugar del comando test.

```console
$ chmod +x comprueba
```

Funcionamiento:

```console
$ ./comprueba /bin/cat
El archivo /bin/cat es un archivo plano ejecutable
El archivo /bin/cat no es un enlace simbólico

$ ./comprueba /bin/rnano
El archivo /bin/rnano es un archivo plano ejecutable
El archivo /bin/rnano es un enlace simbólico
```

Ejercicio 5.10)


**Ejecute `help test` y anote qué otros operadores se pueden utilizar con la orden `test` y para
qué sirven. Ponga un ejemplo de uso de la orden `test` comparando dos expresiones aritméticas y otro
comparando dos cadenas de caracteres.**

`test` puede operar con strings:

```console
    String operators:
    
      -z STRING      True if string is empty.
    
      -n STRING
         STRING      True if string is not empty.
    
      STRING1 = STRING2
                     True if the strings are equal.
      STRING1 != STRING2
                     True if the strings are not equal.
      STRING1 < STRING2
                     True if STRING1 sorts before STRING2 lexicographically.
      STRING1 > STRING2
                     True if STRING1 sorts after STRING2 lexicographically.

    arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne,
                         -lt, -le, -gt, or -ge.
```

Compración de cadenas:

```console
$ echo `[ "hola" = "hola" ] && echo "hola y hola son cadenas idénticas"`
 hola y hola son cadenas idénticas
```

Comparaciones aritméticas

```console
$ echo `[ 3 -ge 2 ] && echo "3 es mayor que 2"`
3 es mayor que 2
```

## Ejercicio 11


**Responda a los siguientes apartados:**

**a) Razone qué hace la siguiente orden:**

```console
$ if [ -f ./sesion5.pdf ]; then printf "El archivo ./sesion5.pdf existe"; fi
```


Esta orden imprime por pantalla que el archivo sesion5.pdf del directorio 
donde es ejecutada la orden existe, si este, además de existir, es un archivo
plano `(-f)`


**b) Añada los cambios necesarios en la orden anterior para que también muestre un mensaje de aviso en caso
de no existir el archivo. (Recuerde que, para escribir de forma legible una orden que ocupe más de una
línea, puede utilizar el carácter “ \ ” como final de cada línea que no sea la última.)**


Para mostrar un mensaje en caso de que el archivo no exista:

```console
$ if [ -f ./sesion5.pdf ]; then printf "El archivo ./sesion5.pdf existe\n"; \
  else printf "\n\nEl archivo ./sesion5.pdf no existe"; fi
```

**c) Sobre la solución anterior, añada un bloque elif para que, cuando no exista el archivo ./sesion5.pdf,
compruebe si el archivo /bin es un directorio. Ponga los mensajes adecuados para conocer el resultado
en cada caso posible.**



```console
$ if [ -f ./sesion5.pdf ]; then printf "El archivo ./sesion5.pdf existe\n"; \
  elif [ -d /bin ]; then printf "/bin es un directorio\n"; \
  else printf "\n\nEl archivo ./sesion5.pdf no existe y /bin no es un \
directorio"; fi

/bin es un directorio
```

**d) Usando como base la solución del apartado anterior, construya un guion que sea capaz de hacer lo mismo
pero admitiendo como parámetros la ruta relativa del primer archivo a buscar y la ruta absoluta del
segundo. Pruébelo con los dos archivos del apartado anterior.**


```bash
#!/bin/bash
# Titulo:       existe
# Fecha:        19/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  Comprueba si el primer argumento en un archivo plano
#               y existe o si el segundo es un directorio
# Opciones: ninguna
# Uso: existe <ruta_relativa_posible_archivo> <ruta_absoluta_posible_directorio>

if [ -f $1 ]; then
    printf "El archivo $1 existe\n";
elif [ -d $2 ]; then
    printf "El archivo $1 no existe pero $2 es un directorio\n";
else
    printf "El archivo $1 no existe ni $2 es un directorio\n";
fi
```

Probemos teniendo en cuenta que el archivo `./ca` existe

```console
$ chmod +x existe

$ ./existe ./ca /bin
El archivo ./ca existe

$ ./existe ./co /bin
El archivo ./co no existe pero /bin es un directorio

$ ./existe ./co /bon
El archivo ./co no existe ni /bon es un directorio
```


## Ejercicio 12

**Construya un guion que admita como argumento el nombre de un archivo o directorio y que
permita saber si somos el propietario del archivo y si tenemos permiso de lectura sobre él.**


La opción `-O` de `test`nos permite conocer si el archivo pertenece al usuario.
Y la opción `-r` de `test` permite conocer si podemos leer el archivo.

```bash
#!/bin/bash
# Titulo:       lecturaypropio
# Fecha:        19/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  Comprueba si un archivo pertenece al usuario y 
#               si este tiene permisos de lectura sobre él.
# Opciones: ninguna
# Uso: lecturaypropio <archivo>

if [ -O $1 ]; then
    echo "Eres el propietario del archivo $1";
else
    echo "No eres el propietario del archivo $1";
fi

if [ -r $1 ]; then
    echo "Tienes permisos de lectura sobre el archivo $1";
else
    echo "No tienes permisos de lectura sobre el archivo $1";
fi
```

```console
$ chmod +x lecturaypropio

$ ./lecturaypropio ca 
```

Eres el propietario del archivo ca
Tienes permisos de lectura sobre el archivo ca

## Ejercicio 13

**Escriba un guion que calcule si el número de días que faltan hasta fin de año es múltiplo de cinco
o no, y que comunique el resultado de la evaluación. Modifique el guion anterior para que admita la opción -h de
manera que, al ejecutarlo con esa opción, muestre información de para qué sirve el guion y cómo debe ejecutarse.**


```bash
#!/bin/bash
# Titulo:       diasmultiplo
# Fecha:        19/10/2017
# Autor:        Ricardo Ruiz
# Version:      1.0
# Descripción:  Comprueba si el número de días restantes para fin de año
#               el múltiplo de 5
# Opciones: ninguna
# Uso: diasmultiplo [-h]

if [ "$1" == "-h" ]; then
    echo "Este programa comprueba si el número de días restantes para \
fin de año es múltiplo de 5."
    echo "Para ejecutarlo simplemente ejecute ./diasmultiplo";
else
    dias_restantes=$[365 -$(date +%j)]
    echo "Quedan $dias_restantes días para el fin de año."

    if [ $[dias_restantes % 5] == 0 ]; then
        echo "Y $dias_restantes es múltiplo de 5!";
    else
        echo "Pero $dias_restantes no es múltiplo de 5";
    fi

fi
```

Funcionamiento

```console
$ ./diasmultiplo -h
Este programa comprueba si el número de días restantes para fin de año es múltiplo de 5.
Para ejecutarlo simplemente ejecute ./diasmultiplo

$ ./diasmultiplo 
Quedan 73 días para el fin de año.
Pero 73 no es múltiplo de 5
```


## Ejercicio 14


**¿Qué pasa en el ejemplo anterior si eliminamos la redirección de la orden `if`?**


Lo que ocurre al eliminar la redirección del if es que, en caso de error,
se mostrará tanto nuestro mensaje propio como el error de la propia orden rm.


## Ejercicio 15


**Haciendo uso del mecanismo de cauces y de la orden **echo** , construya un guion que admita un
argumento y que informe si el argumento dado es una única letra, en mayúsculas o en minúsculas, o es algo
distinto de una única letra.**



```bash
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

if  echo $1 | grep '^[a-Z]\{1\}$' 2> /dev/null ; then
    echo "Es una única letra";
else
    echo "Es algo distinto de una única letra";
fi 2> /dev/null
```

## Ejercicio 16

**Haciendo uso de expresiones regulares, escriba una orden que permita buscar en el árbol de
directorios los nombres de los archivos que contengan al menos un dígito y la letra e. ¿Cómo sería la orden si
quisiéramos obtener los nombres de los archivos que tengan la letra e y no contengan ni el 0 ni el 1?**

## Ejercicio 17

**Utilizando la orden `grep` , exprese una forma alternativa de realizar lo mismo que con `wc -l`.**
