# Practica 9

## Ejercicio 1

**Compile los archivos main.cpp factorial.cpp hello.cpp y genere un ejecutable con el
nombre ejemplo1. Lance gdb con dicho ejemplo y ejecútelo dentro del depurador. Describa la información que
ofrece.**

```console
$ g++ -g main.cpp hello.cpp factorial.cpp -o ejemplo1
$ gdb ejemplo1
```

Dentro del intérprete

```console
(gdb) run

Starting program: /home/ricardo/Dropbox/dgiim/FS/Prácticas/practicas-fs/ArchivosModuloII/sesion09/ejemplo1 
Hello World!
The factorial of 7 is 5040
[Inferior 1 (process 11929) exited normally]
```

Lo cual nos indica que el programa ha terminado correctamente la ejecución.

## Ejercicio 2

**Usando la orden list muestre el código del programa principal y el de la función factorial
utilizados en el ejercicio 1 (para ello utilice la orden help list).**

```GDB
(gdb) list 1,12
1	#include <iostream>
2	#include "functions.h"
3	
4	using namespace std;
5	
6	int main(){
7	    print_hello();
8	    cout << endl;
9	    cout << "The factorial of 7 is " << factorial(7) << endl;
10	    return 0;
11	}

(gdb) list factorial(int) 
1	#include "functions.h"
2	
3	int factorial(int n){
4	    if(n!=1){
5		return(n * factorial(n-1));
6	    }
7	    else return 1;
8	}
(gdb) 
```

## Ejercicio 3

**Ponga un punto de ruptura asociado a cada línea del programa fuente mainsesion09.cpp donde
aparezca el comentario /* break */. Muestre información de todas las variables que se estén usando cada vez
que en la depuración se detenga la ejecución. Muestre la información del contador de programa mediante $pc y el
de la pila con $sp.**


## Ejercicio 4

**Indique las órdenes necesarias para ver el valor de las variables final1 y final2 del programa
generado en el ejercicio anterior en los puntos de ruptura correspondientes tras un par de iteraciones en el bucle
for. Indique la orden para obtener el código ensamblador de la zona depurada.**


## Ejercicio 5

**Considerando la depuración de los ejercicios anteriores, elimine todos los puntos de ruptura salvo el
primero.**


## Ejercicio 6

**Realice las acciones del ejercicio 3 y las del ejercicio 5 en un guion y ejecútelas de nuevo mediante
la opción -x de gdb. ¿Sabría decir qué hace este programa con la variable final2?**


## Ejercicio 7

**Realice la depuración del programa ejecutable obtenido a partir del archivo fuente
ejsesion09.cpp. Utilizando gdb, trate de averiguar qué sucede y por qué no funciona. Intente arreglar el
programa.**

## Ejercicio 8

**Compile el programa mainsesion10.cpp y genere un ejecutable con el nombre ejemplo10.1.
Ejecute gdb con dicho ejemplo y realice una ejecución depurada mediante la orden run. Añada un punto de
ruptura (breakpoint) en la línea donde se invoca a la función cuenta (se puede realizar tal y como se muestra en
el ejemplo anterior o mediante el número de línea donde aparezca la llamada a esa función). Realice 10 pasos de
ejecución con step y otros 10 con next. Comente las diferencias.
Con down o up podemos elegir subir o bajar en la pila de marcos, de tal forma que podemos ir a la función más
interna o subir a donde se hizo la última llamada a dicha función.**

## Ejercicio 9

**Depure el programa del ejercicio 1. Introduzca un punto de ruptura (breakpoint) dentro de la
función cuenta. Usando la orden info frame, muestre la información del marco actual y del marco superior;
vuelva al marco inicial y compruebe si ha cambiado algo.**


## Ejercicio 10

**Ponga un punto de ruptura en la línea 30 del programa (función multiplica) de tal forma que
el programa se detenga cuando la variable final tenga como valor 8. Compruebe si se detiene o no y explique
por qué.**

## Ejercicio 11

**Pruebe el ejemplo anterior, ejecute después un continue y muestre el valor de la variable tmp.
Todo haría indicar que el valor debiera ser 12 y sin embargo no es así, explique por qué.**

## Ejercicio 12

**Busque cualquier programa escrito en C++ que cumpla los requisitos para poderlo depurar
utilizando la orden attach. Compílelo usando el flag de depuración, ejecútelo en una Shell en segundo plano y, en
otra Shell, ejecute el depurador con el programa que se está ejecutando en estos momentos en la shell anterior.
Utilice las órdenes de gdb para hacer que el programa que se está ejecutando se detenga en algún lugar y
posteriormente se pueda continuar su ejecución. Escriba todos los pasos que haya realizado.**

## Ejercicio 13

**Utilizando las órdenes de depuración de gdb, corrija el error del programa
ecuacionSegundoGrado.cpp. Escriba todos los pasos que haya realizado. Pruebe a depurarlo usando attach.**
