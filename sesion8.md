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

```
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

```
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

En primer lugar compilamos el programa añadiendo la opción `-g`, y ejecutamos el depurador

```console
$ g++ -g mainsesion09a.cpp -o mainsesion09
$ gdb mainsesion09
```
Listamos el código,

```
(gdb) list 1,55
1	#include <iostream>
2	/*
3	 Este programa trata mantener dos variables, la primera 
4	 realiza la multiplicación de valores.
5	 La segunda ...
6	*/
7	
8	/* Incrementa en 2 una variable */
9	int cuenta (int y)
10	{
11	   int tmp;
12	
13	   tmp = y + 2; 
14	
15	   /* break */
16	
17	   return tmp;
18	}
19	
20	/* Calcula la multiplicación de dos números */
21	int multiplica (int x, int y)
22	{
23	   int final;
24	   int i;
25	
26	   final = 0;
27	   for (i = 0; i < x; i ++)
28	   {
29	      /* break */
30	      final = final + y;
31	   }
32	
33	   return final;
34	}
35	
36	int main (void)
37	{
38	   int final1;
39	   int final2;
```

y encontramos que hay cuatro comentarios break, en las líneas 15,29,42,47

Por tanto, ejecutamos la orden `break` junto con los números de línea correspondientes:

```
(gdb) break 15
Punto de interrupción 1 at 0x4007c6: file mainsesion09a.cpp, line 15.
(gdb) break 29
Punto de interrupción 2 at 0x4007eb: file mainsesion09a.cpp, line 29.
(gdb) break 42
Punto de interrupción 3 at 0x400804: file mainsesion09a.cpp, line 42.
(gdb) break 47
Punto de interrupción 4 at 0x400823: file mainsesion09a.cpp, line 47.
```

Ejecutamos el programa

```
(gdb) run

Starting program: /home/ricardo/Dropbox/dgiim/FS/Prácticas/practicas-fs/ArchivosModuloII/sesion09/mainsesion09a 

Breakpoint 3, main () at mainsesion09a.cpp:43
43	   final1 = multiplica(3, 2);

(gdb) info locals
final1 = 0
final2 = 0
i = 32767
```

Mostramos el contador de programa usando su dirección
lógica, y la siguiente instrucción que se ejecutará

```
(gdb) p/x $pc
$1 = 0x400804
(gdb) x/i $pc
=> 0x400804 <main()+8>:	mov    $0x2,%esi
```
Mostramos el contador de programa usando su dirección
lógica, y la siguiente instrucción que se ejecutará

Mostramos la pila de programa usando su dirección
lógica

```
(gdb) p/x $sp
$2 = 0x7fffffffdc10
```

Ejecutamos la orden `next` para ejecutar hasta el siguiente breakpoint,
y repetimos el proceso:

```
(gdb) next
(gdb) info locals
final = 0
i = 0
(gdb) p/x $pc
$3 = 0x4007eb
(gdb) x/i $pc
=> 0x4007eb <multiplica(int, int)+32>:	mov    -0x18(%rbp),%eax
(gdb) p/x $sp
$4 = 0x7fffffffdc00
(gdb) x/i $sp
   0x7fffffffdc00:	and    %bl,%ah

(gdb) next
27	   for (i = 0; i < x; i ++)
(gdb) info locals
final = 2
i = 0
(gdb) p/x $pc
$5 = 0x4007f1
(gdb) x/i $pc
=> 0x4007f1 <multiplica(int, int)+38>:	addl   $0x1,-0x4(%rbp)
(gdb) p/x $sp
$6 = 0x7fffffffdc00
(gdb) x/i $sp
   0x7fffffffdc00:	and    %bl,%ah
(gdb) p/x $sp
$7 = 0x7fffffffdc00

(gdb) next
Breakpoint 2, multiplica (x=3, y=2) at mainsesion09a.cpp:30
30	      final = final + y;
(gdb) info locals
final = 2
i = 1
```

## Ejercicio 4

**Indique las órdenes necesarias para ver el valor de las variables final1 y final2 del programa
generado en el ejercicio anterior en los puntos de ruptura correspondientes tras un par de iteraciones en el bucle
for. Indique la orden para obtener el código ensamblador de la zona depurada.**

```
(gdb) break 47
Punto de interrupción 1 at 0x400823: file mainsesion09a.cpp, line 47.
(gdb) run
Starting program: /home/ricardo/Dropbox/dgiim/FS/Prácticas/practicas-fs/ArchivosModuloII/sesion09/mainsesion09a 

Breakpoint 1, main () at mainsesion09a.cpp:48
48	      final2 = cuenta(i);
(gdb) continue
Continuando.

Breakpoint 1, main () at mainsesion09a.cpp:48
48	      final2 = cuenta(i);
(gdb) continue
Continuando.

Breakpoint 1, main () at mainsesion09a.cpp:48
48	      final2 = cuenta(i);
(gdb) info locals
final1 = 6
final2 = 3
i = 2
(gdb) dis
disable      disassemble  disconnect   display      
(gdb) disassemble
Dump of assembler code for function main():
   0x00000000004007fc <+0>:	push   %rbp
   0x00000000004007fd <+1>:	mov    %rsp,%rbp
   0x0000000000400800 <+4>:	sub    $0x10,%rsp
   0x0000000000400804 <+8>:	mov    $0x2,%esi
   0x0000000000400809 <+13>:	mov    $0x3,%edi
   0x000000000040080e <+18>:	callq  0x4007cb <multiplica(int, int)>
   0x0000000000400813 <+23>:	mov    %eax,-0x8(%rbp)
   0x0000000000400816 <+26>:	movl   $0x0,-0xc(%rbp)
   0x000000000040081d <+33>:	cmpl   $0x63,-0xc(%rbp)
   0x0000000000400821 <+37>:	jg     0x400836 <main()+58>
=> 0x0000000000400823 <+39>:	mov    -0xc(%rbp),%eax
   0x0000000000400826 <+42>:	mov    %eax,%edi
   0x0000000000400828 <+44>:	callq  0x4007b6 <cuenta(int)>
   0x000000000040082d <+49>:	mov    %eax,-0x4(%rbp)
   0x0000000000400830 <+52>:	addl   $0x1,-0xc(%rbp)
   0x0000000000400834 <+56>:	jmp    0x40081d <main()+33>
   0x0000000000400836 <+58>:	mov    -0x8(%rbp),%eax
   0x0000000000400839 <+61>:	mov    %eax,%esi
   0x000000000040083b <+63>:	mov    $0x601060,%edi
   0x0000000000400840 <+68>:	callq  0x400650 <_ZNSolsEi@plt>
   0x0000000000400845 <+73>:	mov    $0x400934,%esi
   0x000000000040084a <+78>:	mov    %rax,%rdi
   0x000000000040084d <+81>:	callq  0x4006a0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
   0x0000000000400852 <+86>:	mov    $0x0,%eax
   0x0000000000400857 <+91>:	leaveq 
   0x0000000000400858 <+92>:	retq   
End of assembler dump.
(gdb) 
```

## Ejercicio 5

**Considerando la depuración de los ejercicios anteriores, elimine todos los puntos de ruptura salvo el
primero.**


```
(gdb) break 15
Punto de interrupción 1 at 0x4007c6: file mainsesion09a.cpp, line 15.
(gdb) break 29
Punto de interrupción 2 at 0x4007eb: file mainsesion09a.cpp, line 29.
(gdb) break 42
Punto de interrupción 3 at 0x400804: file mainsesion09a.cpp, line 42.
(gdb) break 47
Punto de interrupción 4 at 0x400823: file mainsesion09a.cpp, line 47.
(gdb) info breakpoints
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x00000000004007c6 in cuenta(int) at mainsesion09a.cpp:15
2       breakpoint     keep y   0x00000000004007eb in multiplica(int, int) at mainsesion09a.cpp:29
3       breakpoint     keep y   0x0000000000400804 in main() at mainsesion09a.cpp:42
4       breakpoint     keep y   0x0000000000400823 in main() at mainsesion09a.cpp:47
(gdb) help delete breakpoints
Borra algunos puntos de interrupción o muestra automáticamente expresiones.
Los argumentos son números de puntos de interrupción separados por espacios.
Para borrar todos los puntos de interrupción, no proporciones argumentos.
Esta orden puede abreviarse como «delete».
(gdb) delete breakpoints 2 3 4
(gdb) info breakpoints
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x00000000004007c6 in cuenta(int) at mainsesion09a.cpp:15
(gdb) 
```

## Ejercicio 6

**Realice las acciones del ejercicio 3 y las del ejercicio 5 en un guion y ejecútelas de nuevo mediante
la opción -x de gdb. ¿Sabría decir qué hace este programa con la variable final2?**

```
/* guion.gdb */

break 15
run
info locals
p/x $pc
x/i $pc
p/x $ps
x/i $ps
break 29
n
info locals
p/x $pc
x/i $pc
p/x $ps
x/i $ps
break 42
n
info locals
p/x $pc
x/i $pc
p/x $ps
x/i $ps
break 47
delete breakpoint 2 3 4
```

## Ejercicio 7

**Realice la depuración del programa ejecutable obtenido a partir del archivo fuente
ejsesion09.cpp. Utilizando gdb, trate de averiguar qué sucede y por qué no funciona. Intente arreglar el
programa.**

````
(gdb) list
21	{
22	   int i;
23	   int tmp;
24	
25	   tmp = 0;
26	   for (i = 0; i < n; i ++)
27	      suma(tmp, vector[i]);
28	
29	   printf ("Suma = %d\n", tmp);
30	
(gdb) break 27
Punto de interrupción 1 at 0x4005d5: file ejsesion09a.cpp, line 27.
(gdb) run
Starting program: /home/ricardo/Dropbox/dgiim/FS/Prácticas/practicas-fs/ArchivosModuloII/sesion09/ejsesion09 

Breakpoint 1, sumatoria (vector=0x7fffffffdbe0, n=17) at ejsesion09a.cpp:27
27	      suma(tmp, vector[i]);
(gdb) info locals
i = 0
tmp = 0
(gdb) continue
Continuando.

Breakpoint 1, sumatoria (vector=0x7fffffffdbe0, n=17) at ejsesion09a.cpp:27
27	      suma(tmp, vector[i]);
(gdb) info locals
i = 1
tmp = 0
(gdb) continue
Continuando.

Breakpoint 1, sumatoria (vector=0x7fffffffdbe0, n=17) at ejsesion09a.cpp:27
27	      suma(tmp, vector[i]);
(gdb) info locals
i = 2
tmp = 0
```

Como podemos observar, la variable tmp permanece constante
pues no se le asigna el valor devuelto por la función suma().

```
#include <stdlib.h>
#include <stdio.h>
/*
 Este programa trata de sumar una lista de números.
 La lista de números aparece en la variable "vector" y el resultado
 se almacena en la variable "final".
*/

/* Suma dos números entre sí */
int suma (int x, int y)
{
   int tmp;

   tmp = x + y; 

   return tmp;
}

/* Realiza la sumatoria de un vector */
int sumatoria (float vector[], int n)
{
   int i;
   int tmp;

   tmp = 0;
   for (i = 0; i < n; i ++)
      tmp = suma(tmp, vector[i]); // Almacenamos en tmp

   printf ("Suma = %d\n", tmp);

   return tmp;
}

int main (void)
{
   float final;
   float vector[] = {0, 1, 2.3, 3.7, 4.10, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4};

   final = sumatoria(vector, 15); // El parámetro debe ser el tamaño del vector

   return 0;
}
```

## Ejercicio 8

**Compile el programa mainsesion10.cpp y genere un ejecutable con el nombre ejemplo10.1.
Ejecute gdb con dicho ejemplo y realice una ejecución depurada mediante la orden run. Añada un punto de
ruptura (breakpoint) en la línea donde se invoca a la función cuenta (se puede realizar tal y como se muestra en
el ejemplo anterior o mediante el número de línea donde aparezca la llamada a esa función). Realice 10 pasos de
ejecución con step y otros 10 con next. Comente las diferencias.
Con down o up podemos elegir subir o bajar en la pila de marcos, de tal forma que podemos ir a la función más
interna o subir a donde se hizo la última llamada a dicha función.**

Interpretando que el archivo `mainsesion10.cpp` se corresponde con `mainsesion09b.cpp`,

```
(gdb) break 47
Punto de interrupción 1 at 0x400823: file mainsesion09b.cpp, line 47.
(gdb) run
Starting program: /home/ricardo/Dropbox/dgiim/FS/Prácticas/practicas-fs/ArchivosModuloII/sesion09/mainsesion09b 

Breakpoint 1, main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) s
cuenta (y=0) at mainsesion09b.cpp:13
13	   tmp = y + 2; 
(gdb) s
17	   return tmp;
(gdb) s
18	}
(gdb) s
main () at mainsesion09b.cpp:46
46	   for (i = 0; i < 100; i ++)
(gdb) s

Breakpoint 1, main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) s
cuenta (y=1) at mainsesion09b.cpp:13
13	   tmp = y + 2; 
(gdb) s
17	   return tmp;
(gdb) s
18	}
(gdb) s
main () at mainsesion09b.cpp:46
46	   for (i = 0; i < 100; i ++)
(gdb) s

Breakpoint 1, main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) n
46	   for (i = 0; i < 100; i ++)
(gdb) n

Breakpoint 1, main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) n
46	   for (i = 0; i < 100; i ++)
(gdb) n

Breakpoint 1, main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) n
46	   for (i = 0; i < 100; i ++)
(gdb) n

Breakpoint 1, main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) n
46	   for (i = 0; i < 100; i ++)
(gdb) n

Breakpoint 1, main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) n
46	   for (i = 0; i < 100; i ++)
(gdb) n

Breakpoint 1, main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) 
```
Como se puede observar, la orden `next` ejecuta la siguiente linea del programa sin
entrar en cada una de las líneas de una función mientras que `step` ejecuta
una a una las instrucciones de la función.

## Ejercicio 9

**Depure el programa del ejercicio 1. Introduzca un punto de ruptura (breakpoint) dentro de la
función cuenta. Usando la orden info frame, muestre la información del marco actual y del marco superior;
vuelva al marco inicial y compruebe si ha cambiado algo.**

```
(gdb) break cuenta
Punto de interrupción 1 at 0x4007bd: file mainsesion09b.cpp, line 13.
(gdb) run
Starting program: /home/ricardo/Dropbox/dgiim/FS/Prácticas/practicas-fs/ArchivosModuloII/sesion09/mainsesion09b 

Breakpoint 1, cuenta (y=0) at mainsesion09b.cpp:13
13	   tmp = y + 2; 
(gdb) info frame
Stack level 0, frame at 0x7fffffffdc10:
 rip = 0x4007bd in cuenta (mainsesion09b.cpp:13); saved rip = 0x40082d
 called by frame at 0x7fffffffdc30
 source language c++.
 Arglist at 0x7fffffffdc00, args: y=0
 Locals at 0x7fffffffdc00, Previous frame's sp is 0x7fffffffdc10
 Saved registers:
  rbp at 0x7fffffffdc00, rip at 0x7fffffffdc08
(gdb) up
#1  0x000000000040082d in main () at mainsesion09b.cpp:48
48	      final2 = cuenta(i);
(gdb) info frame
Stack level 1, frame at 0x7fffffffdc30:
 rip = 0x40082d in main (mainsesion09b.cpp:48); saved rip = 0x7ffff76ab830
 caller of frame at 0x7fffffffdc10
 source language c++.
 Arglist at 0x7fffffffdc20, args: 
 Locals at 0x7fffffffdc20, Previous frame's sp is 0x7fffffffdc30
 Saved registers:
  rbp at 0x7fffffffdc20, rip at 0x7fffffffdc28
(gdb) down
#0  cuenta (y=0) at mainsesion09b.cpp:13
13	   tmp = y + 2; 
(gdb) info frame
Stack level 0, frame at 0x7fffffffdc10:
 rip = 0x4007bd in cuenta (mainsesion09b.cpp:13); saved rip = 0x40082d
 called by frame at 0x7fffffffdc30
 source language c++.
 Arglist at 0x7fffffffdc00, args: y=0
 Locals at 0x7fffffffdc00, Previous frame's sp is 0x7fffffffdc10
 Saved registers:
  rbp at 0x7fffffffdc00, rip at 0x7fffffffdc08
(gdb) 
```
No, no ha cambiado nada de información.

## Ejercicio 10

**Ponga un punto de ruptura en la línea 30 del programa (función multiplica) de tal forma que
el programa se detenga cuando la variable final tenga como valor 8. Compruebe si se detiene o no y explique
por qué.**

```
(gdb) break if final == 8
```

No se detiene debido a que la función multiplica es llamada con argumentos `x=3` e `y=2`, y este
es el que fija el número de repeticiones del bucle, y por tanto el valor máximo que alcanza
`final` es 6.

## Ejercicio 11

**Pruebe el ejemplo anterior, ejecute después un continue y muestre el valor de la variable tmp.
Todo haría indicar que el valor debiera ser 12 y sin embargo no es así, explique por qué.**


```
(gdb) break 10
Punto de interrupción 1 at 0x4007bd: file mainsesion09b.cpp, line 10.
(gdb) run
Starting program: /home/ricardo/Dropbox/dgiim/FS/Prácticas/practicas-fs/ArchivosModuloII/sesion09/mainsesion09b 
 
Breakpoint 1, cuenta (y=0) at mainsesion09b.cpp:13
13	   tmp = y + 2; 
(gdb) print tmp
$1 = 3
(gdb) set variable tmp=10
(gdb) print tmp
$2 = 10
(gdb) continue
Continuando.

Breakpoint 1, cuenta (y=1) at mainsesion09b.cpp:13
13	   tmp = y + 2; 
(gdb) print tmp
$3 = 2
(gdb) 
```

`tmp` es una variable local de la función cuenta. Por tanto,
cada vez que se llama a la función se reinicializa a `y+2` donde
`y` es un parámetro de la función. Por tanto, aunque cambiemos el
valor de la variable a 10, una nueva llamada a la función lo fija
a `y+2`.


## Ejercicio 12

**Busque cualquier programa escrito en C++ que cumpla los requisitos para poderlo depurar
utilizando la orden attach. Compílelo usando el flag de depuración, ejecútelo en una Shell en segundo plano y, en
otra Shell, ejecute el depurador con el programa que se está ejecutando en estos momentos en la shell anterior.
Utilice las órdenes de gdb para hacer que el programa que se está ejecutando se detenga en algún lugar y
posteriormente se pueda continuar su ejecución. Escriba todos los pasos que haya realizado.**

Los pasos son los siguientes

```console
$ g++ -g ejsesion10.cpp -o ej1
$ ./ej1 &
$ gdb
(gdb) attach 3619
$ kill
```

## Ejercicio 13

**Utilizando las órdenes de depuración de gdb, corrija el error del programa
ecuacionSegundoGrado.cpp. Escriba todos los pasos que haya realizado. Pruebe a depurarlo usando attach.**

Los pasos son los siguientes:

```console
$ g++ -g ecuacionSegundoGrado.cpp -o ecuacionSegundoGrado
$ gdb ecuacionSegundoGrado
(gdb) run

Starting program: /home/ricardo/Dropbox/dgiim/FS/Prácticas/practicas-fs/ArchivosModuloII/sesion09/ecuacionSegundoGrado 

Vamos a resolver una ecuacion del tipo ax2+bx+c=0

Introduce el valor de a: 10

Introduce el valor de b: 1

Introduce el valor de c: 10

La primera solucion es: -nan
La segunda solucion es: -nan
[Inferior 1 (process 14680) exited normally]
$

Lo cual nos muestra que calcula ecuaciones de segundo
grado que no tienen soluciones reales.

Por tanto, modificamos la línea

```c++
if (ecuacionator(a, b, c) == 0) // Ya que si el discriminante es negativo, devuelve 0
```

```console
$ ./ecuacionSegundoGrado 
Vamos a resolver una ecuacion del tipo ax2+bx+c=0

Introduce el valor de a: 32

Introduce el valor de b: 24

Introduce el valor de c: 11

La ecuacion no tiene solucion
```
