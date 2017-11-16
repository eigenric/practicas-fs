# Práctica 8: Compilación de programas


# Ejercicio 8.1

**Pruebe a comentar en el archivo fuente main.cpp la directiva de procesamiento
“#include ”functions.h”. La línea quedaría así: //#include ”functions.h”. Pruebe a generar ahora el
módulo objeto con la orden de compilación mostrada anteriormente. ¿Qué ha ocurrido?**

Una vez comentada la línea "#include functions.h", al ejecutar la orden:

```console
$ g++ -c main.cpp

main.cpp: In function ‘int main()’:
main.cpp:7:17: error: ‘print_hello’ was not declared in this scope
     print_hello();
                 ^
main.cpp:9:52: error: ‘factorial’ was not declared in this scope
     cout << "The factorial of 7 is " << factorial(7) << endl;
```

Lo cual es natural, ya que las funciones `print_hello()` `factorial()`,
están en la biblioteca comentada.


# Ejercicio 8.2.

**Explique por qué el enlazador no ha podido generar el programa archivo ejecutable programa2 del
ejemplo anterior y, sin embargo, ¿por qué sí hemos podido generar el módulo main2.o?**

En main2.cpp se utilizan las funciones `print_sin()` `print_cos()` y `print_tan()`, las cuales
están definidas en `libmates.a`. Por ello, es necesario especificar explícitamente la
biblioteca utilizada. 


$ g++ -L./ -o programa2 main2.o factorial.o hello.o -lmates
La opción -L permite especificar directorios en donde g++ puede buscar las bibliotecas necesarias. Por omisión
g++ las busca en los directorios /lib y /usr/lib. Además, en el caso de –lmates, esa opción –l busca la
biblioteca cuya raíz es mates, con prefijo lib y sufijo .a, es decir, busca la biblioteca libmates.a.
Pruebe lo siguiente.
$ mkdir includes
$ mv *.h includes

# Ejercicio 8.3. Explique por qué la orden g++ previa ha fallado. Explique los tipos de errores que ha encontrado.
De forma análoga a la opción -L, la opción -I permite especificar directorios en donde g++ puede buscar los
archivos de cabecera (por omisión, se buscan en /usr/include). Esta opción no tiene sentido si todos los
archivos de cabecera se encuentran en el directorio donde estamos ejecutando todas estas órdenes. En ese tipo de
circunstancias, NO es necesario definir tal opción e indicar directorios concretos.
$ g++ -I./includes -L./ -o programa2 main2.cpp factorial.cpp hello.cpp -lmates
Como puede comprobar, cuando se trabaja con varios módulos de código fuente se van generando una serie de
dependencias entre ellos. En nuestro caso, el módulo main.cpp depende de los módulos factorial.cpp y
Módulo II. Compilación y Depuración de programas

7
--
Ejercicio 8.4. Copie el contenido del makefile previo a un archivo llamado makefileE ubicado en el mismo
directorio en el que están los archivos de código fuente .cpp. Pruebe a modificar distintos archivos .cpp (puede
hacerlo usando la orden touch sobre uno o varios de esos archivos) y compruebe la secuencia de instrucciones
que se muestra en el terminal al ejecutarse la orden make. ¿Se genera siempre la misma secuencia de órdenes
cuando los archivos han sido modificados que cuando no? ¿A qué cree puede deberse tal comportamiento?

Ejercicio 8.5. Obtener un nuevo makefileF a partir del makefile del ejercicio anterior que incluya además las
dependencias sobre los archivos de cabecera. Pruebe a modificar cualquier archivo de cabecera (usando la orden
touch) y compruebe la secuencia de instrucciones que se muestra en el terminal al ejecutarse la orden make.

4.3 Uso de variables
La utilidad make permite la definición de variables de igual forma que podíamos hacerlo en los guiones de bash.
Fíjese en el siguiente ejemplo:
# Nombre archivo: makefileG
# Uso: make –f makefileG
# Descripción: Mantiene todas las dependencias entre los módulos y la biblioteca
#
--
Ejercicio 8.6. Usando como base el archivo makefileG, sustituya la línea de orden de la regla cuyo objetivo es
programa2 por otra en la que se use alguna de las variables especiales y cuya ejecución sea equivalente.

Ejercicio 8.7. Utilizando como base el archivo makefileG y los archivos fuente asociados, realice los cambios
que considere oportunos para que, en la construcción de la biblioteca estática libmates.a, este archivo pase a
estar en un subdirectorio denominado libs y se pueda enlazar correctamente con el resto de archivos objeto.

Ejercicio 8.8. Busque la variable predefinida de make que almacena la utilidad del sistema que permite construir
bibliotecas. Recuerde que la orden para construir una biblioteca estática a partir de una serie de archivos objeto es
ar (puede usar la orden grep para filtrar el contenido; no vaya a leer línea a línea toda la salida). Usando el
archivo makefileG, sustituya la orden ar por su variable correspondiente.

Ejercicio 8.9. Dado el siguiente archivo makefile, explique las dependencias que existen y para qué sirve cada
una de las líneas del mismo. Enumere las órdenes que se van a ejecutar a consecuencia de invocar la utilidad
make sobre este archivo.
#
#
#
#

Nombre archivo: makefileH
Uso: make -f makefileH
Descripción: Mantiene todas las dependencias entre los módulos que utiliza el
--
Ejercicio 8.10. Con la siguiente especificación de módulos escriba un archivo denominado makefilePolaca que
automatice el proceso de compilación del programa final de acuerdo a la siguiente descripción:
Compilador: gcc o g++
Archivos cabecera: calc.h (ubicado en un subdirectorio denominado cabeceras)
Archivos fuente: main.c stack.c getop.c getch.c
Nombre del programa ejecutable: calculadoraPolaca
Además, debe incluir una regla denominada borrar, sin dependencias, cuya funcionalidad sea la de eliminar los
archivos objeto y el programa ejecutable.

16

--
Ejercicio 9.1. Compile los archivos main.cpp factorial.cpp hello.cpp y genere un ejecutable con el
nombre ejemplo1. Lance gdb con dicho ejemplo y ejecútelo dentro del depurador. Describa la información que
ofrece.

9.3 Comprobación de ayuda y listar código
La orden help de gdb permite obtener ayuda genérica del programa. También se puede buscar ayuda de una
orden, por ejemplo, help run.
La orden apropos busca en todo el manual por si hubiera ayuda asociada a un término, por ejemplo, apropos
run.
Todas las órdenes de gdb tienen dos formas de invocarse: la normal (indicando la palabra completa) y la resumida
(abreviatura de la orden). La resumida se utiliza para ir más rápido en la depuración, como es el caso de la orden
--
Ejercicio 9.2. Usando la orden list muestre el código del programa principal y el de la función factorial
utilizados en el ejercicio 1 (para ello utilice la orden help list).

9.4 Comprobación de variables y estados
Una de las ventajas de los depuradores es que podemos visualizar la información de las variables y su estado, así
como información del contexto del programa. Para ello pueden ser interesantes las siguientes órdenes:
orden de gdb

Descripción

display variable
--
Ejercicio 9.3. Ponga un punto de ruptura asociado a cada línea del programa fuente mainsesion09.cpp donde
aparezca el comentario /* break */. Muestre información de todas las variables que se estén usando cada vez
que en la depuración se detenga la ejecución. Muestre la información del contador de programa mediante $pc y el
de la pila con $sp.
Una vez detenidos a causa a un punto de ruptura, podremos avanzar a la siguiente instrucción del programa con la
orden next o con step. Ambas órdenes se verán en la siguiente sesión.
Los puntos de ruptura activos pueden verse con info breakpoints. Podemos eliminar un punto de ruptura con
la orden delete (para mayor detalle, vea la ayuda mediante la orden help delete).
Ejercicio 9.4. Indique las órdenes necesarias para ver el valor de las variables final1 y final2 del programa
generado en el ejercicio anterior en los puntos de ruptura correspondientes tras un par de iteraciones en el bucle
for. Indique la orden para obtener el código ensamblador de la zona depurada.

Ejercicio 9.5. Considerando la depuración de los ejercicios anteriores, elimine todos los puntos de ruptura salvo el
primero.

9.6 Ejecución de guiones
Para no tener que escribir las acciones en la propia interfaz de gdb, podemos hacer uso de los guiones de gdb.
Un guion de este tipo es un archivo de texto con diversas líneas de órdenes. Por ejemplo, el siguiente cuadro
indica un guion denominado guion.gdb con órdenes para la depuración de un programa denominado ejemplo1
y, justo debajo, cómo invocar a dicho guion cuando se desee aplicar la depuración establecida en el guion al
programa en cuestión:
break multiplica
run
--
Ejercicio 9.6. Realice las acciones del ejercicio 3 y las del ejercicio 5 en un guion y ejecútelas de nuevo mediante
la opción -x de gdb. ¿Sabría decir qué hace este programa con la variable final2?

Ejercicio 9.7. Realice la depuración del programa ejecutable obtenido a partir del archivo fuente
ejsesion09.cpp. Utilizando gdb, trate de averiguar qué sucede y por qué no funciona. Intente arreglar el
programa.
Módulo II. Compilación y Depuración de programas

19

Lenguajes y Sistemas Informáticos

Práctica 9. Depuración de programas

--
Ejercicio 9.8. Compile el programa mainsesion10.cpp y genere un ejecutable con el nombre ejemplo10.1.
Ejecute gdb con dicho ejemplo y realice una ejecución depurada mediante la orden run. Añada un punto de
ruptura (breakpoint) en la línea donde se invoca a la función cuenta (se puede realizar tal y como se muestra en
el ejemplo anterior o mediante el número de línea donde aparezca la llamada a esa función). Realice 10 pasos de
ejecución con step y otros 10 con next. Comente las diferencias.
Con down o up podemos elegir subir o bajar en la pila de marcos, de tal forma que podemos ir a la función más
interna o subir a donde se hizo la última llamada a dicha función.
Ejercicio 9.9. Depure el programa del ejercicio 1. Introduzca un punto de ruptura (breakpoint) dentro de la
función cuenta. Usando la orden info frame, muestre la información del marco actual y del marco superior;
vuelva al marco inicial y compruebe si ha cambiado algo.

9.8 Puntos de Ruptura Condicionales
La utilidad gdb permite añadir comprobaciones en los puntos de ruptura, de tal forma que sólo habilita el punto de
ruptura si se cumple la condición. Para ello utiliza la sintaxis del lenguaje depurado, así, si el programa estaba
compilado para C++, la sintaxis utilizada será la de C++.
Un ejemplo sería el siguiente:
(gdb) break 13 if tmp > 10
Punto de interrupción 1 at 0x804866a: file mainsesion10.cpp, line 13.
--
Ejercicio 9.10. Ponga un punto de ruptura en la línea 30 del programa (función multiplica) de tal forma que
el programa se detenga cuando la variable final tenga como valor 8. Compruebe si se detiene o no y explique
por qué.

22

Módulo II. Compilación y Depuración de programas

Lenguajes y Sistemas Informáticos

Práctica 9. Depuración de programas
--
Ejercicio 9.11. Pruebe el ejemplo anterior, ejecute después un continue y muestre el valor de la variable tmp.
Todo haría indicar que el valor debiera ser 12 y sin embargo no es así, explique por qué.

9.10 Depurar programas que se están ejecutando
La utilidad gdb permite depurar programas que ya se encuentran ejecutándose en el sistema operativo ( daemons).
Para ello, nada más ejecutar gdb podemos realizar la depuración de un proceso que ya se encuentre en ejecución.
Para ello, dicho proceso debe tratarse de algún programa con un tiempo de ejecución bastante largo o que
disponga de alguna instrucción que permita su detención como puede ser la de una sentencia para introducir datos
por teclado. Una vez dentro de la utilidad gdb, la orden sería la siguiente:
attach PID
donde PID es el identificador del proceso que se encuentra en ejecución y se desea depurar.
--
Ejercicio 9.12. Busque cualquier programa escrito en C++ que cumpla los requisitos para poderlo depurar
utilizando la orden attach. Compílelo usando el flag de depuración, ejecútelo en una Shell en segundo plano y, en
otra Shell, ejecute el depurador con el programa que se está ejecutando en estos momentos en la shell anterior.
Utilice las órdenes de gdb para hacer que el programa que se está ejecutando se detenga en algún lugar y
posteriormente se pueda continuar su ejecución. Escriba todos los pasos que haya realizado.

Ejercicio 9.13. Utilizando las órdenes de depuración de gdb, corrija el error del programa
ecuacionSegundoGrado.cpp. Escriba todos los pasos que haya realizado. Pruebe a depurarlo usando attach.

9.11 Funcionalidad adicional del gdb
La utilidad gdb permite integrarse con los editores del sistema, de tal forma que podemos lanzar el editor en
cualquier momento desde éste. Para ello hay que cambiar la variable EDITOR del sistema:
$ EDITOR=/usr/bin/gedit
$ export EDITOR
A partir de aquí, una vez estamos depurando podemos escribir:
edit número_línea
edit nombre_función
