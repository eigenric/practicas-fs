# Práctica 2: Órdenes básicas de UNIX/Linux

## Ejercicio 1

**Cree el siguiente árbol de directorios a partir de un directorio de
su cuenta de usuario. Indique también cómo sería posible crear toda esa
estructura de directorios mediante una única orden (mire las opciones de la
orden de creación de directorios mediante man mkdir). Posteriormente realice
las siguientes acciones:**


Para crear la estructura:

```console
$ mkdir ejercicio1
$ cd ejercicio1
$ mkdir Ejer1 -p Ejer1/Ejer21 Ejer2 Ejer3 
```

(Obsérvese que la opción `-p` (`--parents`) crea directorios independientemente de si los directorios padres existen o no).

**a) En Ejer1 cree los archivos arch100.txt, filetags.txt, practFS.ext y robet201.me.**

```console
$ cd Ejer1; touch arch100.txt filetags.txt practFS.ext robet201.me
```

**b) En Ejer21 cree los archivos robet202.me, ejer11sol.txt y blue.me.**

(Una vez dentro de Ejer1)

```console
$ cd Ejer21; touch robet202.me ejer11sol.txt blue.me
```

**c) En Ejer2 cree los archivos ejer2arch.txt, ejer2filetags.txt y readme2.pdf.**

(`cd ../Ejer2` para acceder al directorio Ejer2)

```console
   touch ejer2arch.txt ejer2filetags.txt readme2.pdf
```
**d) En Ejer3 cree los archivos ejer3arch.txt, ejer3filetags.txt y readme3.pdf.**

```console
$ touch ejer3arch.txt ejer3filetags.txt readme3.pdf
```

**e) ¿Podrían realizarse las acciones anteriores empleando una única orden? Indique cómo.**

Sí, desde el directorio ejercicio1

```console
touch Ejer1/arch100.txt Ejer1/filetags.txt Ejer1/practFS.ext Ejer1/robet201.me Ejer1/Ejer21/robet202.me Ejer1/Ejer21/ejer11sol.txt Ejer1/Ejer21/blue.me Ejer2/ejer2arch.txt Ejer2/ejer2filetags.txt Ejer2/readme2.pdf Ejer3/ejer3arch.txt Ejer3/ejer3filetags.txt Ejer3/readme3.pdf
```

## Ejercicio 2.2

**a) Mueva el directorio Ejer21 al directorio Ejer2.**

```console
mv Ejer1/Ejer21 Ejer2
```

**b) Copie los archivos de Ejer1 cuya extensión tenga una x al directorio Ejer3.**

```console
cp Ejer1/*.x Ejer3
```

**c) Si estamos situado en el directorio Ejer2 y ejecutamos la orden ls -la ../Ejer3/*arch*, ¿qué archivo/s, en su caso, debería mostrar?**

Se debe mostrar el archivo `ejer3arch.txt` ya que cumple con el patrón
`\*arch\*` (teniendo en cuenta que el asterisco vale para todos los caracteres)

## Ejercicio 2.3

**Si estamos situados en el directorio Ejer2, indique la orden necesaria para listar sólo los nombres
de todos los archivos del directorio padre**

La orden necesaria seria `ls ../*`

Como vemos (En Ejer2):

```console
$ ls ../*

../Ejer1:
arch100.txt  Ejer21  filetags.txt  practFS.txt	robet201.me

../Ejer2:
ejer2arch.txt  ejer2filetags.txt  readme2.pdf

../Ejer3:
ejer3arch.txt  ejer3filtags.txt

```

## Ejercicio 2.4

**Liste los archivos que estén en su directorio actual y fíjese en alguno que no disponga de la fecha y
hora actualizada, es decir, la hora actual y el día de hoy. Ejecute la orden touch sobre dicho archivo y observe qué
sucede sobre la fecha del citado archivo cuando se vuelva a listar.**

Ejecutando `ls -la` en `Ejer2`:

```console
drwxr-xr-x 2 ricardoruiz alumno 2048 sep 21 20:01 .
drwxr-xr-x 5 ricardoruiz alumno 2048 sep 21 19:50 ..
-rw-r--r-- 1 ricardoruiz alumno    0 sep 21 20:01 ejer2arch.txt
-rw-r--r-- 1 ricardoruiz alumno    0 sep 21 20:01 ejer2filetags.txt
-rw-r--r-- 1 ricardoruiz alumno    0 sep 21 20:01 readme2.pdf
```

Son las 20:04. Si realizamos `touch ejer2arch.txt`, y nuevamente `ls -la`:


```console
-rw-r--r-- 1 ricardoruiz alumno    0 sep 21 20:04 ejer2arch.txt
```

Es decir, la hora queda actualizada a las 20:04


## Ejercicio 2.5


**La organización del espacio en directorios es fundamental para poder localizar fácilmente aquello
que estemos buscando. En ese sentido, realice las siguientes acciones dentro de su directorio home (es el
directorio por defecto sobre el que trabajamos al entrar en el sistema):**


**a) Obtenga en nombre de camino absoluto (pathname absoluto) de su directorio home. ¿Es el mismo que el de su compañero/a?**

Si ejecutamos `pwd`:

```console
/home/ricardoruiz
```

Se muestra la ruta absoluta de mi direcotiro home.
En cambio, a mi compañera: `/home/navidadmarian`

**b) Cree un directorio para cada asignatura en la que se van a realizar prácticas de laboratorio y, dentro de
cada directorio, nuevos directorios para cada una de las prácticas realizadas hasta el momento.**

`mkdir -p FS/practica2 FP/practica1 LMD`

**c) Dentro del directorio de la asignatura fundamentos del software (llamado FS ) y dentro del directorio
creado para esta práctica, copie los archivos hosts y passwd que se encuentran dentro del directorio
/etc.**

Usando metacaracteres de archivo: `cp /etc/{hosts,passwd} .`

**d) Muestre el contenido de cada uno de los archivos.**

Individualmente: 
   i) `cat hosts`
   ii) `cat passwd`


## Ejercicio 2.6


**Situados en algún lugar de su directorio principal de usuario (directorio HOME), cree los directorios
siguientes: Sesion.1, Sesion.10, Sesion.2, Sesion.3, Sesion.4, Sesion.27, Prueba.1 y
Sintaxis.2 y realice las siguientes tareas:**

**a) Borre el directorio Sesion.4**

```console
$ rmdir Sesion.4 
```

**b) Liste todos aquellos directorios que empiecen por Sesion. y a continuación tenga un único carácter**

```console
$ ls -l Sesion.?
```

**c) Liste aquellos directorios cuyos nombres terminen en .1**

```console
$ ls -l *.1
```

**d) Liste aquellos directorios cuyos nombres terminen en .1 o .2**

```console
$ ls -l *{.1,.2}
```

**e) Liste aquellos directorios cuyos nombres contengan los caracteres si**

```console
$ ls -l *si*
```

**f) Liste aquellos directorios cuyos nombres contengan los caracteres si y terminen en .2**

```console
$ ls -l *[si]*.2
```

## Ejercicio 2.7

**Desplacémonos hasta el directorio `/bin` , genere los siguientes listados de archivos (siempre de la
forma más compacta y utilizando los metacaracteres apropiados):**

**a) Todos los archivos que contengan sólo cuatro caracteres en su nombre.**

```console
$ ls -l ????
```

**b) Todos los archivos que comiencen por los caracteres d , f.**

```console
$ ls -l [df]*
```

**c) Todos los archivos que comiencen por las parejas de caracteres sa , se , ad.**

```console
$ ls -l {sa,se,ad}*
```
**d) Todos los archivos que comiencen por t y acaben en r.**

```console
$ ls -l t*r`
```

## Ejercicio 2.8

**Liste todos los archivos que comiencen por `tem` y terminen por `.gz` o `.zip`**

**a) De tu directorio HOME.**

```console
$ ls -l ~/tem*.{gz,zip}
```

**b) Del directorio actual.**

```console
ls -l *.{gz,zip}
```

**c) ¿Hay alguna diferencia en el resultado de su ejecución? Razone la respuesta.**

En los dos casos, no existe ningun archivo archivo terminado en `.gz` o `.zip`

## Ejercicio 2.9


**Muestre del contenido de un archivo regular que contenga texto:**

**a) Las 10 primeras líneas.**

```console
$ head hosts
```

**b) Las 5 últimas líneas.**

```console
$ tail -n 5 hosts
```


## Ejercicio 10

**Ordene el contenido de un archivo de texto según diversos criterios de ordenación.**

Si el archivo ejemplo contiene:

```
AEJEMPLO
dejemplo
Bejemplo
cejemplo
```

Ejecutamos

```console
$ sort ejemplo

AEJEMPLO
Bejemplo
cejemplo
dejemplo
```

Ahora:

```console
$ sort --reverse ejemplo

dejemplo
cejemplo
Bejemplo
AEJEMPLO
```

Como se puede comprobar, se invierte el orden de los elementos
alfabéticamente.


## Ejercicio 11
**¿Cómo podría ver el contenido de todos los archivos del directorio actual que terminen en `.txt` o `.c`?**

```console
$ cat *.{txt,c}
```
