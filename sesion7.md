# Práctica 8: Compilación de programas

## Ejercicio 8.1

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

## Ejercicio 8.2.

**Explique por qué el enlazador no ha podido generar el programa archivo ejecutable programa2 del
ejemplo anterior y, sin embargo, ¿por qué sí hemos podido generar el módulo main2.o?**

En main2.cpp se utilizan las funciones `print_sin()` `print_cos()` y `print_tan()`, las cuales
están definidas en `libmates.a`. Por ello, es necesario enlazar explícitamente la
biblioteca utilizada. 

```console
$ g++ -L./ -o programa2 main2.o factorial.o hello.o -lmates
```

La opción -L permite especificar directorios en donde g++ puede buscar las bibliotecas necesarias.
Por omisión g++ las busca en los directorios `/lib` y `/usr/lib`. Además, en el caso de `–lmates`,
esa opción `–l` busca la biblioteca cuya raíz es mates, con prefijo `lib` y sufijo
`.a`, es decir, busca la biblioteca `libmates.a.`

## Ejercicio 8.3.

**Explique por qué la orden g++ previa ha fallado. Explique los tipos de errores que ha encontrado.**

Los archivos de cabecera `functions.h` y `mates.h` no son encontrados, ya que
se encuentran ahora en el directorio `includes`. Por tanto, las funciones `print_hello`,
`factorial`, `print_sin`, `print_cos` y `print_tan` no pueden utilizarse, pues no se
ha enlazado correctamente. Para solucionarlo, utilizamos la opción `-I` en g++:

```console
g++ -I./includes -L./ -o programa2 main2.cpp factorial.cpp hello.cpp -lmates
```

# Ejercicio 8.4.

**Copie el contenido del makefile previo a un archivo llamado makefileE ubicado en el mismo
directorio en el que están los archivos de código fuente .cpp. Pruebe a modificar distintos archivos .cpp (puede
hacerlo usando la orden touch sobre uno o varios de esos archivos) y compruebe la secuencia de instrucciones
que se muestra en el terminal al ejecutarse la orden make. ¿Se genera siempre la misma secuencia de órdenes
cuando los archivos han sido modificados que cuando no? ¿A qué cree puede deberse tal comportamiento?**



La orden `make` devuelve una salida distinta en función de los archivos
que han sido modificados. Así no ejecuta todos los archivo si sólo ha cambiado
uno de ellos.

Cuando ejecutamos `make` pro primera vez

```console
$ make -f makefileE
g++ -I./includes -c main2.cpp
g++ -I./includes -c factorial.cpp
g++ -I./includes -c hello.cpp
g++ -I./includes -c sin.cpp
g++ -I./includes -c cos.cpp
g++ -I./includes -c tan.cpp
ar -rvs libmates.a sin.o cos.o tan.o
r - sin.o
r - cos.o
r - tan.o
g++ -L./ -o programa2 main2.o factorial.o hello.o libmates.a
```

Ahora bien si realizamos `touch` sobre uno o varios no vacíos, se modifican su fecha y hora
asociadas. Por tanto, `make` detecta que han sido actualizados y sólo ejecuta las órdenes
que contienen como dependencia estos archivos:

```console
$ touch main2.cpp 
$ make -f makefileE
g++ -I./includes -c main2.cpp
g++ -L./ -o programa2 main2.o factorial.o hello.o libmates.a
$ touch hello.cpp sin.cpp
$ make -f makefileE
g++ -I./includes -c hello.cpp
g++ -I./includes -c sin.cpp
ar -rvs libmates.a sin.o cos.o tan.o
r - sin.o
r - cos.o
r - tan.o
g++ -L./ -o programa2 main2.o factorial.o hello.o libmates.a
```

## Ejercicio 8.5.

**Obtener un nuevo makefileF a partir del makefile del ejercicio anterior que incluya además las
dependencias sobre los archivos de cabecera. Pruebe a modificar cualquier archivo de cabecera (usando la orden
touch) y compruebe la secuencia de instrucciones que se muestra en el terminal al ejecutarse la orden make.**

```makefile
# Nombre archivo: makefile
# Uso: make 
# Descripción: Mantiene todas las dependencias entre los módulos y la biblioteca
#              que utiliza el programa2.

LIB_DIR=./

programa2: main2.o factorial.o hello.o libmates.a
	g++ -L$(LIB_DIR) -o $@ $^

main2.o: main2.cpp ./includes/functions.h ./includes/mates.h 
	g++ -I./includes -c main2.cpp

factorial.o: factorial.cpp ./includes/functions.h
	g++ -I./includes -c factorial.cpp

hello.o: hello.cpp ./includes/functions.h
	g++ -I./includes -c hello.cpp

libmates.a: sin.o cos.o tan.o
	ar -rvs libmates.a sin.o cos.o tan.o

sin.o: sin.cpp ./includes/mates.h
	g++ -I./includes -c sin.cpp

cos.o: cos.cpp ./includes/mates.h
	g++ -I./includes -c cos.cpp

tan.o: tan.cpp ./includes/mates.h
	g++ -I./includes -c tan.cpp

cleanAll: cleanObj cleanLib
	rm programa2

cleanObj:
	rm main2.o factorial.o hello.o

cleanLib:
	rm sin.o cos.o tan.o libmates.a
```

Hemos añadido  `./include/function.h` `./includes/mates.h` como
como dependencias y `-I./include` de opción en `g++`. Por tanto, si modificamos
algún archivo de cabecera, se ejecutan todas las órdenes del Makefile
que lo incluyen como dependencia.

```console
$ touch includes/mates.h 
$ make -f makefileF
g++ -I./includes -c main2.cpp
g++ -I./includes -c sin.cpp
g++ -I./includes -c cos.cpp
g++ -I./includes -c tan.cpp
ar -rvs libmates.a sin.o cos.o tan.o
r - sin.o
r - cos.o
r - tan.o
g++ -L./ -o programa2 main2.o factorial.o hello.o libmates.a
```

## Ejercicio 8.6.

**Usando como base el archivo makefileG, sustituya la línea de orden de la regla cuyo objetivo es
programa2 por otra en la que se use alguna de las variables especiales y cuya ejecución sea equivalente.**

```shell

# Ricardo Ruiz
# Nombre archivo: makefileG
# Uso: make –f makefileG
# Descripción: Mantiene todas las dependencias entre los módulos y la biblioteca
# que utiliza el programa2.

# Variable que indica el compilador que se va a utilizar
CC=g++

# Variable que indica el directorio en donde se encuentran los archivos de cabecera
INCLUDE_DIR= ./includes

# Variable que indica el directorio en donde se encuentran las bibliotecas
LIB_DIR= ./

#Variable que indica las opciones que se le va a pasar al compilador
CPPFLAGS= -Wall

programa2: main2.o factorial.o hello.o libmates.a
      $(CC) -L$(LIB_DIR) -o $@ main2.o factorial.o hello.o -lmates

main2.o: main2.cpp
      $(CC) -I$(INCLUDE_DIR) -c main2.cpp

factorial.o: factorial.cpp
      $(CC) -I$(INCLUDE_DIR) -c factorial.cpp

hello.o: hello.cpp
      $(CC) -I$(INCLUDE_DIR) -c hello.cpp

libmates.a: sin.o cos.o tan.o
      ar -rvs libmates.a sin.o cos.o tan.o

sin.o: sin.cpp
      $(CC) -I$(INCLUDE_DIR) -c sin.cpp

cos.o: cos.cpp
      $(CC) -I$(INCLUDE_DIR) -c cos.cpp

tan.o: tan.cpp
      $(CC) -I$(INCLUDE_DIR) -c tan.cpp
clean:
      rm *.o programa2
```

## Ejercicio 8.7.

**Utilizando como base el archivo makefileG y los archivos fuente asociados, realice los cambios
que considere oportunos para que, en la construcción de la biblioteca estática libmates.a, este archivo pase a
estar en un subdirectorio denominado libs y se pueda enlazar correctamente con el resto de archivos objeto.**


```shell
# Nombre archivo: makefileG
# Uso: make –f makefileG
# Descripción: Mantiene todas las dependencias entre los módulos y la biblioteca
            # que utiliza el programa2.

# Variable que indica el compilador que se va a utilizar
CC=g++

# Variable que indica el directorio en donde se encuentran los archivos de cabecera
INCLUDE_DIR= ./includes

# Variable que indica el directorio en donde se encuentran las bibliotecas
LIB_DIR= ./

#Variable que indica las opciones que se le va a pasar al compilador
CPPFLAGS= -Wall

programa2: main2.o factorial.o hello.o ./libs/libmates.a
      $(CC) -L$(LIB_DIR) -o $@ main2.o factorial.o hello.o -lmates
main2.o: main2.cpp
      $(CC) -I$(INCLUDE_DIR) -c main2.cpp
factorial.o: factorial.cpp
      $(CC) -I$(INCLUDE_DIR) -c factorial.cpp
hello.o: hello.cpp
      $(CC) -I$(INCLUDE_DIR) -c hello.cpp
libmates.a: sin.o cos.o tan.o
      ar -rvs libmates.a sin.o cos.o tan.o
sin.o: sin.cpp
      $(CC) -I$(INCLUDE_DIR) -c sin.cpp
cos.o: cos.cpp
      $(CC) -I$(INCLUDE_DIR) -c cos.cpp
tan.o: tan.cpp
      $(CC) -I$(INCLUDE_DIR) -c tan.cpp
clean:
      rm *.o programa2
```

## Ejercicio 8.8.

**Busque la variable predefinida de make que almacena la utilidad del sistema que permite construir
bibliotecas. Recuerde que la orden para construir una biblioteca estática a partir de una serie de archivos objeto es
ar (puede usar la orden grep para filtrar el contenido; no vaya a leer línea a línea toda la salida). Usando el
archivo makefileG, sustituya la orden ar por su variable correspondiente.**


```shell
# Nombre archivo: makefileG
# Uso: make –f makefileG
# Descripción: Mantiene todas las dependencias entre los módulos y la
# biblioteca que utiliza el programa2. 
# Variable que indica el compilador que se va a utilizar CC=g++
# Variable que indica el directorio en donde se encuentran los archivos de cabecera INCLUDE_DIR= ./includes
# Variable que indica el directorio en donde se encuentran las bibliotecas LIB_DIR= ./
programa2: main2.o factorial.o hello.o libmates.a
$(CC) -L$(LIB_DIR) -o programa2 main2.o factorial.o hello.o -lmates
main2.o: main2.cpp
      $(CC) -I$(INCLUDE_DIR) -c main2.cpp
factorial.o: factorial.cpp
$(CC) -I$(INCLUDE_DIR) -c factorial.cpp
hello.o: hello.cpp
      $(CC) -I$(INCLUDE_DIR) -c hello.cpp
libmates.a: sin.o cos.o tan.o
      $(AR) -rvs libmates.a sin.o cos.o tan.o
sin.o: sin.cpp
      $(CC) -I$(INCLUDE_DIR) -c sin.cpp
cos.o: cos.cpp
      $(CC) -I$(INCLUDE_DIR) -c cos.cpp
tan.o: tan.cpp
      $(CC) -I$(INCLUDE_DIR) -c tan.cpp
```

## Ejercicio 8.9.
**Dado el siguiente archivo makefile, explique las dependencias que existen y para qué sirve cada
una de las líneas del mismo. Enumere las órdenes que se van a ejecutar a consecuencia de invocar la utilidad
make sobre este archivo.**



```shell
# Nombre archivo: makefileH
# Uso: make -f makefileH
# Descripción: Mantiene todas las dependencias entre los módulos que utiliza el
# programa1.
# La variable CC indica que vamos a compilar con c++
CC=g++
#La varialble CPPFLAGS nos indica nos indica todos los warning que se pueden dar
CPPFLAGS=-Wall –I./includes
#SOURCEMODUELS nos indica todos los archivos cpp
SOURCE_MODULES=main.cpp factorial.cpp hello.cpp
#OBJECTMODULES nos indica los archivos .o
OBJECT_MODULES=$(SOURCE_MODULES:.cpp=.o)
#EXECUTABLE nos indica el nombre del archivo ejecutable que se generara
EXECUTABLE=programa1
#all 
all: $(OBJECT_MODULES) $(EXECUTABLE)
$(EXECUTABLE): $(OBJECT_MODULES)
       $(CC) $^ -o $@
# Regla para obtener los archivos objeto .o que dependerán de los archivos .cpp
# Aquí, $< y $@ tomarán valores respectivamente main.cpp y main.o y así sucesivamente
.o: .cpp
       $(CC) $(CPPFLAGS) $< -o $@
```

