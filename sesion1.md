# Práctica 2: Órdenes básicas de UNIX/Linux

## Ejercicio 2.1

Para crear la estructura:
  `mkdir ejercicio1`
  `cd ejercicio1`
  `mkdir Ejer1 -p Ejer1/Ejer21 Ejer2 Ejer3 `
  (Obsérvese que la opción `-p` (`--parents`) crea directorios independientemente de si los directorios padres existen o no).

a) `cd Ejer1; touch arch100.txt filetags.txt practFS.ext robet201.me`
c) (Una vez dentro de Ejer1)
    `cd Ejer21; touch robet202.me ejer11sol.txt blue.me`
d) `cd ../Ejer2` (Para acceder al directorio `Ejer2`)
   `touch ejer2arch.txt ejer2filetags.txt readme2.pdf`
e) Sí, desde el directorio ejercicio1
   `touch Ejer1/arch100.txt Ejer1/filetags.txt Ejer1/practFS.ext Ejer1/robet201.me Ejer1/Ejer21/robet202.me Ejer1/Ejer21/ejer11sol.txt Ejer1/Ejer21/blue.me Ejer2/ejer2arch.txt Ejer2/ejer2filetags.txt Ejer2/readme2.pdf Ejer3/ejer3arch.txt Ejer3/ejer3filetags.txt Ejer3/readme3.pdf`

## Ejercicio 2.2

a) `mv Ejer1/Ejer21 Ejer2`
b) `cp Ejer1/*.x Ejer3`
c) Se debe mostrar el archivo `ejer3arch.txt` ya que cumple con el patrón
`\*arch\*` (teniendo en cuenta que el asterisco vale para todos los caracteres)

## Ejercicio 2.3

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

a) Si ejecutamos `pwd`:

```console
/home/ricardoruiz
```

Se muestra la ruta absoluta de mi direcotiro home. En cambio, a mi compañera: `/home/navidadmarian`

b) `mkdir -p FS/practica2 FP/practica1 LMD`

c) Usando metacaracteres de archivo: `cp /etc/{hosts,passwd} .`

d) Individualmente: 
    i) `cat hosts`
    ii) `cat passwd`


## Ejercicio 2.6

a) `rmdir Sesion.4`
b) `ls -l Sesion.?`
c) `ls -l *.1`
d) `ls -l *{.1,.2}`
e) `ls -l *si*`
f) `ls -l *[si]*.2`

## Ejercicio 2.7

a) `ls -l ????`
b) `ls -l [df]*`
c) `ls -l {sa,se,ad}*`
d) `ls -l t*r`

## Ejercicio 2.8

a) `ls -l ~/tem*.{gz,zip}`
b) `ls -l *.{gz,zip}`
c) En los dos casos, no existe ningun archivo archivo terminado en `.gz` o `.zip`

## Ejercicio 2.9

a) `head hosts`
b) `tail -n 5 hosts`
c) Si el archivo ejemplo contiene:

AEJEMPLO
dejemplo
Bejemplo
cejemplo

Ejecutando `sort ejemplo`:

AEJEMPLO
Bejemplo
cejemplo
dejemplo

Ejecutando `sort --reverse ejemplo`

dejemplo
cejemplo
Bejemplo
AEJEMPLO

Como se puede comprobar, se invierte el orden de los elementos alfabéticamente.

d) `cat *.{txt,c}`
