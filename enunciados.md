# Práctica 2







**a) En Ejer1 cree los archivos arch100.txt, filetags.txt, practFS.ext y robet201.me.**
**b) En Ejer21 cree los archivos robet202.me, ejer11sol.txt y blue.me.**


**Ejercicio 2 Situados en el directorio ejercicio1 creado anteriormente, realice las siguientes acciones:**


**a) Mueva el directorio Ejer21 al directorio Ejer2.**
**b) Copie los archivos de Ejer1 cuya extensión tenga una x al directorio Ejer3.**
**c) Si estamos situado en el directorio Ejer2 y ejecutamos la orden ls -la ../Ejer3/*arch*, ¿qué archivo/s, en su caso, debería mostrar?**

**Ejercicio 3. Si estamos situados en el directorio Ejer2, indique la orden necesaria para listar sólo los nombres
de todos los archivos del directorio padre**

Ejer1 Ejer2 Ejer3
Ejer21


**Ejercicio 2. 4. Liste los archivos que estén en su directorio actual y fíjese en alguno que no disponga de la fecha y
hora actualizada, es decir, la hora actual y el día de hoy. Ejecute la orden touch sobre dicho archivo y observe qué
sucede sobre la fecha del citado archivo cuando se vuelva a listar.**

**Ejercicio 2. 5. La organización del espacio en directorios es fundamental para poder localizar fácilmente aquello
que estemos buscando. En ese sentido, realice las siguientes acciones dentro de su directorio home (es el
directorio por defecto sobre el que trabajamos al entrar en el sistema):**


**a) Obtenga en nombre de camino absoluto (pathname absoluto) de su directorio home. ¿Es el mismo que el
de su compañero/a?**
**b) Cree un directorio para cada asignatura en la que se van a realizar prácticas de laboratorio y, dentro de
cada directorio, nuevos directorios para cada una de las prácticas realizadas hasta el momento.**
**c) Dentro del directorio de la asignatura fundamentos del software (llamado FS ) y dentro del directorio
creado para esta práctica, copie los archivos hosts y passwd que se encuentran dentro del directorio
/etc.**
**d) Muestre el contenido de cada uno de los archivos.**

**Ejercicio 7 Situados en algún lugar de su directorio principal de usuario (directorio HOME), cree los directorios
siguientes: Sesion.1, Sesion.10, Sesion.2, Sesion.3, Sesion.4, Sesion.27, Prueba.1 y
Sintaxis.2 y realice las siguientes tareas:**

**a) Borre el directorio Sesion.4**
**b) Liste todos aquellos directorios que empiecen por Sesion. y a continuación tenga un único carácter**
**c) Liste aquellos directorios cuyos nombres terminen en .1**
**d) Liste aquellos directorios cuyos nombres terminen en .1 o .2**
**e) Liste aquellos directorios cuyos nombres contengan los caracteres si**
**f) Liste aquellos directorios cuyos nombres contengan los caracteres si y terminen en .2**

**Ejercicio 7. Desplacémonos hasta el directorio **/bin** , genere los siguientes listados de archivos (siempre de la
forma más compacta y utilizando los metacaracteres apropiados):**

**a) Todos los archivos que contengan sólo cuatro caracteres en su nombre.**
**b) Todos los archivos que comiencen por los caracteres d , f.**
**c) Todos los archivos que comiencen por las parejas de caracteres sa , se , ad.**
**d) Todos los archivos que comiencen por t y acaben en r.**

**Ejercicio 2. 8. Liste todos los archivos que comiencen por `tem` y terminen por `.gz` o `.zip`**

**a) De tu directorio HOME.**
**b) Del directorio actual.**
**c) ¿Hay alguna diferencia en el resultado de su ejecución? Razone la respuesta.**

**Ejercicio 2. 9. Muestre del contenido de un archivo regular que contenga texto:**

**a) Las 10 primeras líneas.**
**b) Las 5 últimas líneas.**

**Ejercicio 2. 10. Ordene el contenido de un archivo de texto según diversos criterios de ordenación.**

**Ejercicio 2. 11. ¿Cómo podría ver el contenido de todos los archivos del directorio actual que terminen en `.txt` o `.c`?**


# Práctica 3


**Ejercicio 3. 1. Se debe utilizar solamente una vez la orden **chmod** en cada apartado. Los cambios se harán en un
archivo concreto del directorio de trabajo (salvo que se indique otra cosa). Cambiaremos uno o varios permisos en
cada apartado (independientemente de que el archivo ya tenga o no dichos permisos) y comprobaremos que
funciona correctamente:**

**a) Dar permiso de ejecución al “resto de usuarios”.**
**b) Dar permiso de escritura y ejecución al “grupo”.**
**c) Quitar el permiso de lectura al “grupo” y al “resto de usuarios”.**
**d) Dar permiso de ejecución al “propietario” y permiso de escritura el “resto de usuarios”.**
**e) Dar permiso de ejecución al “grupo” de todos los archivos cuyo nombre comience con la letra “e”. Nota: Si
no hay más de dos archivos que cumplan esa condición, se deberán crear archivos que empiecen con “e”
y/o modificar el nombre de archivos ya existentes para que cumplan esa condición.**


**Ejercicio 2. Utilizando solamente las órdenes de la práctica anterior y los metacaracteres de redirección de
salida:**

**a) Cree un archivo llamado ej31 , que contendrá el nombre de los archivos del directorio padre del directorio
de trabajo.**
**b) Cree un archivo llamado ej32 , que contendrá las dos últimas líneas del archivo creado en el ejercicio
anterior.**
**c) Añada al final del archivo ej32 , el contenido del archivo ej31.**


**Ejercicio 3** Utilizando el metacarácter de creación de cauces y sin utilizar la orden **cd:**

**a) Muestre por pantalla el listado (en formato largo) de los últimos 6 archivos del directorio padre
correspondiente a su directorio de trabajo (HOME).**
**b) La orden wc muestra por pantalla el número de líneas, palabras y bytes de un archivo (consulta la orden
man para conocer más sobre ella). Utilizando dicha orden, muestre por pantalla el número de caracteres
(sólo ese número) de los archivos del directorio de trabajo que comiencen por los caracteres “e” o “f”.**


**Ejercicio 4 Resuelva cada uno de los siguientes apartados.**

**a) Cree un archivo llamado ejercicio1, que contenga las 17 últimas líneas del texto que proporciona la
orden man para la orden chmod (se debe hacer en una única línea de órdenes y sin utilizar el metacarácter
“;” ).**
**b) Al final del archivo ejercicio1, añada la ruta completa del directorio de trabajo actual.**
**c) Usando la combinación de órdenes mediante paréntesis, cree un archivo llamado ejercicio3 que
contendrá el listado de usuarios conectados al sistema (orden who ) y la lista de archivos del directorio
actual.**
**d) Añada, al final del archivo ejercicio 3 , el número de líneas, palabras y caracteres del archivo
ejercicio1. Asegúrese de que, por ejemplo, si no existiera ejercicio1, los mensajes de error también
se añadieran al final de ejercicio3.**


# Práctica 4

**Ejercicio 1: Escriba, al menos, cinco variables de entorno junto con el valor que tienen.**

**Ejercicio 2. Ejecute las órdenes del cuadro e indique qué ocurre y cómo puede resolver la situación para que la
variable NOMBRE se reconozca en el shell hijo.**

**Ejercicio 3 : Compruebe qué ocurre en las expresiones del ejemplo anterior si se quitan las comillas dobles del
final y se ponen después de los dos puntos. ¿Qué sucede si se sustituyen las comillas dobles por comillas simples?**

**Ejercicio 4 : Pruebe la siguiente asignación:**

```
$ numero=$numero+ 1
$ echo $numero
```
**¿Qué ha ocurrido?**

```
$ numero=1
$ echo $numero
1
$ numero=`expr $numero + 1`
```

**Ejercicio 5. Construya un guion que acepte como argumento una cadena de texto (por ejemplo, su nombre) y
que visualice en pantalla la frase Hola y el nombre dado como argumento.**

**Ejercicio 6. Varíe el guion anterior para que admita una lista de nombres.**

**Ejercicio 7. Cree tres variables llamadas VAR1, VAR2 y VAR3 con los siguientes valores respectivamente “hola”,
“adios” y “14”.**

a) Imprima los valores de las tres variables en tres columnas con 15 caracteres de ancho.
b) ¿Son variables locales o globales?
c) Borre la variable VAR2.
d) Abra otra ventana de tipo terminal, ¿puede visualizar las dos variables restantes?
e) Cree una variable de tipo vector con los valores iniciales de las tres variables.
f) Muestre el segundo elemento del vector creado en el apartado e.

**Ejercicio 8. Cree un alias que se llame **ne** (nombrado así para indicar el número de elementos) y que devuelva
el número de archivos que existen en el directorio actual. ¿Qué cambiaría si queremos que haga lo mismo pero en
el directorio home correspondiente al usuario que lo ejecuta?**

**Ejercicio 9. Indique la línea de orden necesaria para buscar todos los archivos a partir del directorio home que
tengan un tamaño menor de un bloque. ¿Cómo la modificaría para que además imprima el resultado en un archivo
que se cree dentro del directorio donde nos encontremos y que se llame archivos?**

**Ejercicio 10. Indique cómo buscaría todos aquellos archivos del directorio actual que contengan la palabra
“ejemplo”.**

**Ejercicio 11. Complete la información de find y grep utilizando para ello la orden man.**

**Ejercicio 12. Indique cómo buscaría si un usuario dispone de una cuenta en el sistema.**

**Ejercicio 13. Indique cómo contabilizar el número de ficheros de la propia cuenta de usuario que no tengan
permiso de lectura para el resto de usuarios.**

**Ejercicio 14. Modifique el ejercicio 8 de forma que, en vez de un alias, sea un guion llamado `numE` el que
devuelva el número de archivos que existen en el directorio que se le pase como argumento.**


# Práctica 5

**Ejercicio 1 : Utilizando una variable que contenga el valor entero 365 y otra que guarde el número del día actual
del año en curso, realice la misma operación del ejemplo anterior usando cada una de las diversas formas de
cálculo comentadas hasta el momento, es decir, utilizando `expr`, `$(( ... ))` y `$[ ... ]`.**

**Ejercicio 2 : Realice las siguientes operaciones para conocer el funcionamiento del operador de incremento
como sufijo y como prefijo. Razone el resultado obtenido en cada una de ellas:**

```console
$ v=1
$ echo $v
$ echo $((v++))
$ echo $v
$ echo $((++v))
$ echo $v
```

**Ejercicio 3: Utilizando el operador de división, ponga un caso concreto donde se aprecie que la asignación
abreviada es equivalente a la asignación completa, es decir, que x/=y equivale a x=x/y.
En el resultado del cálculo de expresiones aritméticas, bash solamente trabaja con números enteros, por lo que si
se necesitase calcular un resultado con decimales, habría que utilizar una forma alternativa, como puede ser la
ofrecida por la orden `bc` , cuya opción `- l` , letra “ele”, permite hacer algunos cálculos matemáticos (admite otras
posibilidades que pueden verse mediante `man`).**

**Ejercicio 4: Compruebe qué ocurre si en el ejemplo anterior utiliza comillas dobles o simples para acotar todo lo
que sigue a la orden `echo`. ¿Qué sucede si se acota entre comillas dobles solamente la expresión aritmética que se
quiere calcular?, ¿y si se usan comillas simples?**

**Ejercicio 5: Calcule con decimales el resultado de la expresión aritmética (3-2)/5. Escriba todas las
expresiones que haya probado hasta dar con una respuesta válida. Utilizando una solución válida, compruebe qué
sucede cuando la expresión aritmética se acota entre comillas dobles; ¿qué ocurre si se usan comillas simples?, ¿y
si se ponen apóstrofos inversos?**

**Ejercicio 6 : Consulte la sintaxis completa de la orden `let` utilizando la orden de ayuda para las órdenes
empotradas ( `help let`) y tome nota de su sintaxis general.**

**Ejercicio 7: Al realizar el ejercicio anterior habrá observado que la orden `let` admite asignaciones múltiples y
operadores que nosotros no hemos mencionado anteriormente. Ponga un ejemplo de asignación múltiple y, por
otra parte, copie en un archivo el orden en el que se evalúan los operadores que admite.**


**Ejercicio 8: Haciendo uso de las órdenes conocidas hasta el momento, construya un guion que admita dos
parámetros, que compare por separado si el primer parámetro que se le pasa es igual al segundo, o es menor, o es
mayor, y que informe tanto del valor de cada uno de los parámetros como del resultado de cada una de las
evaluaciones mostrando un 0 o un 1 según corresponda.**

**Ejercicio 9: Usando `test` , construya un guion que admita como parámetro un nombre de archivo y realice las
siguientes acciones: asignar a una variable el resultado de comprobar si el archivo dado como parámetro es plano
y tiene permiso de ejecución sobre él; asignar a otra variable el resultado de comprobar si el archivo es un enlace
simbólico; mostrar el valor de las dos variables anteriores con un mensaje que aclare su significado. Pruebe el
guion ejecutándolo con /bin/cat y también con /bin/rnano.**

**Ejercicio 10: Ejecute `help test` y anote qué otros operadores se pueden utilizar con la orden `test` y para
qué sirven. Ponga un ejemplo de uso de la orden `test` comparando dos expresiones aritméticas y otro
comparando dos cadenas de caracteres.**

**Ejercicio 11 : Responda a los siguientes apartados:**

**a) Razone qué hace la siguiente orden:**
```console
if test -f ./sesion5.pdf ; then printf “El archivo ./sesion5.pdf existe\n”; fi
```
**b) Añada los cambios necesarios en la orden anterior para que también muestre un mensaje de aviso en caso
de no existir el archivo. (Recuerde que, para escribir de forma legible una orden que ocupe más de una
línea, puede utilizar el carácter “ \ ” como final de cada línea que no sea la última.)**
**c) Sobre la solución anterior, añada un bloque elif para que, cuando no exista el archivo ./sesion5.pdf,
compruebe si el archivo /bin es un directorio. Ponga los mensajes adecuados para conocer el resultado
en cada caso posible.**
**d) Usando como base la solución del apartado anterior, construya un guion que sea capaz de hacer lo mismo
pero admitiendo como parámetros la ruta relativa del primer archivo a buscar y la ruta absoluta del
segundo. Pruébelo con los dos archivos del apartado anterior.**

**Ejercicio 12: Construya un guion que admita como argumento el nombre de un archivo o directorio y que
permita saber si somos el propietario del archivo y si tenemos permiso de lectura sobre él.**

**Ejercicio 13: Escriba un guion que calcule si el número de días que faltan hasta fin de año es múltiplo de cinco
o no, y que comunique el resultado de la evaluación. Modifique el guion anterior para que admita la opción -h de
manera que, al ejecutarlo con esa opción, muestre información de para qué sirve el guion y cómo debe ejecutarse.**

**Ejercicio 14: ¿Qué pasa en el ejemplo anterior si eliminamos la redirección de la orden `if`?**

**Ejercicio 15 : Haciendo uso del mecanismo de cauces y de la orden **echo** , construya un guion que admita un
argumento y que informe si el argumento dado es una única letra, en mayúsculas o en minúsculas, o es algo
distinto de una única letra.**

**Ejercicio 5. 16 : Haciendo uso de expresiones regulares, escriba una orden que permita buscar en el árbol de
directorios los nombres de los archivos que contengan al menos un dígito y la letra e. ¿Cómo sería la orden si
quisiéramos obtener los nombres de los archivos que tengan la letra e y no contengan ni el 0 ni el 1?**

**Ejercicio 5. 17 : Utilizando la orden `grep` , exprese una forma alternativa de realizar lo mismo que con `wc -l`.**


# Práctica 6

**Ejercicio 6.1.** Escriba un guion que acepte dos argumentos. El primero será el nombre de un directorio y el
segundo será un valor entero. El funcionamiento del guion será el siguiente: deberán anotarse en un archivo
denominado archivosSizN.txt aquellos archivos del directorio dado como argumento y que cumplan la
condición de tener un tamaño menor al valor aportado en el segundo argumento. Se deben tener en cuenta las
comprobaciones sobre los argumentos, es decir, debe haber dos argumentos, el primero deberá ser un directorio
existente y el segundo un valor entero.

**Ejercicio 6.2.** Escriba un guion que acepte el nombre de un directorio como argumento y muestre como resultado
el nombre de todos y cada uno de los archivos del mismo y una leyenda que diga "Directorio", "Enlace" o "Archivo
regular", según corresponda. Incluya la comprobación necesaria sobre el argumento, es decir, determine si el
nombre aportado se trata de un directorio existente.

**Ejercicio 6.3.** Escriba un guion en el que, a partir de la pulsación de una tecla, detecte la zona del teclado donde
se encuentre. Las zonas vendrán determinadas por las filas. La fila de los números 1, 2, 3, 4, ... será la fila
1, las teclas donde se encuentra la Q, W, E, R, T, Y,... serán de la fila 2, las teclas de la A, S, D,
F, ... serán de la fila 3 y las teclas de la Z, X, C, V, ... serán de la fila 4. La captura de la tecla se
realizará mediante la orden **read**.

**Ejercicio 6.4.** Escriba un guion que acepte como argumento un parámetro en el que el usuario indica el mes que
quiere ver, ya sea en formato numérico o usando las tres primeras letras del nombre del mes, y muestre el nombre
completo del mes introducido. Si el número no está comprendido entre 1 y 12 o las letras no son significativas del
nombre de un mes, el guion deberá mostrar el correspondiente mensaje de error.

**Ejercicio 6.5.** Escriba un guion que solicite un número hasta que su valor esté comprendido entre 1 y 10. Deberá
usar la orden **while** y, para la captura del número, la orden **read**.

**Ejercicio 6.5.5** Copie este ejercicio y pruébelo en su sistema para ver su funcionamiento. ¿Qué podemos modificar
para que el giro se vea más rápido o más lento? ¿Qué hace la opción -e de las órdenes echo del guion?

Consulte la ayuda de bash, observe que aquí hay información muy interesante sobre las órdenes empotradas (shell
builting commands) como por ejemplo echo, y sobre sus secuencias de escape.

**Ejercicio 6.7.** Escriba un guion que admita como argumento el nombre de un tipo de shell (por ejemplo, csh, sh,
bash, tcsh, etc.) y nos dé un listado ordenado alfabéticamente de los usuarios que tienen dicho tipo de shell por
defecto cuando abren un terminal. Dicha información del tipo de shell asignado a un usuario se puede encontrar en
el archivo /etc/passwd, cuyo contenido está delimitado por ':'. Cada información situada entre esos
delimitadores representa un campo y precisamente el campo que nos interesa se encuentra situado en primer lugar.
En definitiva, para quedarnos con lo que aparece justo antes del primer delimitador será útil la orden siguiente:
cut -d':' -f1 /etc/passwd
donde la opción – d indica cuál es el delimitador utilizado y la opción – f1 representa a la secuencia de caracteres
del primer campo. Realice, utilizando el mecanismo de cauces, el ejercicio pero usando la orden cat para mostrar
el contenido de un archivo y encauzado con la orden cut para filtrar la información que aparece justo antes del
delimitador ':'^3.

(^3) Utilice la orden man para conocer otras posibilidades en el uso de la orden cut, en particular, cortar un intervalo de caracteres.

**Ejercicio 6.8.** Dos órdenes frecuentes de Unix son tar y gzip. La orden tar permite almacenar/extraer varios
archivos de otro archivo. Por ejemplo, podemos almacenar el contenido de un directorio en un archivo con

```
tar -cvf archivo.tar directorio
```
(la opción -x extrae los archivos de un archivo .tar).

La orden gzip permite comprimir el contenido de un archivo para que ocupe menos espacio. Por ejemplo, gzip
archivo comprime archivo y lo sustituye por otro con el mismo nombre y con la extensión .gz. La orden para
descomprimir un archivo .gz o .zip es gunzip.

Dadas estas órdenes construya un guion, denominado cpback, que dado un directorio o lista de archivos como
argumento(s) los archive y comprima en un archivo con nombre copiaYYMMDD, donde YY corresponde al año, la
MM al mes y la DD al día, dentro de un directorio denominado CopiasSeguridad. El guion debe realizar las
comprobaciones oportunas: los argumentos existen, el directorio de destino existe y si no, lo crea.

**Ejercicio 6.9.** Hacer un script en Bash denominado newdirfiles con los siguientes tres argumentos:
 <dirname> Nombre del directorio que, en caso de no existir, se debe crear para alojar en él los archivos
que se han de crear.
 <num_files> Número de archivos que se han de crear.
 <basefilename> Será una cadena de caracteres que represente el nombre base de los archivos.

Ese guion debe realizar lo siguiente:
 Comprobar que el número de argumentos es el correcto y que el segundo argumento tenga un valor
comprendido entre 1 y 99.
 Crear, en caso de no existir, el directorio dado en el primer argumento a partir del directorio donde se esté
situado y que posea permisos de lectura y escritura para el usuario $USER.
 Dentro del directorio dado en el primer argumento, crear archivos cuyos contenidos estarán vacíos y cuyos
nombres lo formarán el nombre dado como tercer argumento y un número que irá desde 01 hasta el
número dado en el segundo argumento.

# Práctica 7

**Ejercicio 7.1.** Indique cuál ha sido el error introducido en el guion anterior y cómo se corregiría.

Un guion puede ser erróneo por errores sintácticos, porque no funciona como se desea que lo haga, o porque
funcionando correctamente posee efectos secundarios indeseados (bomba lógica). Para depurar un guion
defectuoso, se pueden usar las herramientas que se plantean a continuación:

```
 Usar la orden echo en puntos críticos del guion para seguir el rastro de las variables más importantes.
 Usar las opciones - n , - v y - x de bash.
 Usar la orden trap para depuración.
 Usar funciones de “aserción”.
```
#### 7.2.1 Opciones de depuración en bash

El intérprete bash ofrece una serie de opciones que pueden ayudar a detectar el origen de un error. Estas opciones
se muestran en la siguiente tabla, donde también se indican las órdenes bash que, insertadas en un guion, activan
ese tipo de funcionamiento:

```
Opción Efecto Órdenes equivalentes
```
--
**Ejercicio 7.2.** Aplicar las herramientas de depuración vistas en la sección 2 para la detección de errores durante el
desarrollo de los guiones propuestos como ejercicios en la práctica 6.

### 7.3 Control de trabajos en bash

Las órdenes que se mandan ejecutar al shell reciben el nombre de trabajos o jobs. Un trabajo puede estar en
primer plano ( **foreground** ), en segundo plano ( **background** ) o suspendido (detenido). Durante una sesión, la
shell almacena una lista de los trabajos no finalizados. Estos trabajos no finalizados pueden ser aquellos trabajos
que se ejecutan en segundo plano o/y los trabajos que han sido suspendidos. Una orden (o trabajo) se ejecuta en
segundo plano cuando incluimos un **&** (ampersand) al final de la orden.

El siguiente ejemplo muestra los mensajes que devuelve la shell al ejecutar una orden en segundo plano. La orden
que se lanza en segundo plano incluye una llamada a la orden **sleep** para producir una pausa de cinco segundos.

```
$ (sleep 5; echo "Fin de la siesta de 5 segs.") &
[1] 10217
$ Fin de la siesta
```
```
[1]+ Hecho ( sleep 5; echo "Fin de la siesta" )
--
**Ejercicio 7.3.** Escribir un guion que nos dé el nombre del proceso del sistema que consume más memoria.

**Ejercicio 7.4.** Escribir un guion que escriba números desde el 1 en adelante en intervalos de un segundo ¿Cómo
se podría, desde otro terminal, detener la ejecución de dicho proceso, reanudarlo y terminar definitivamente su
ejecución?

**Ejercicio 7.5.** ¿Se puede matar un proceso que se encuentra suspendido? En su caso, ¿cómo?

**Ejercicio 7.6.** ¿Qué debemos hacer a la orden top para que nos muestre sólo los procesos nuestros?
