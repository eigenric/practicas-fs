# Practica 3: Permisos y redirecciones

## Ejercicio 1


**Se debe utilizar solamente una vez la orden `chmod` en cada apartado.  Los
cambios se harán en un archivo concreto del directorio de trabajo (salvo que se
indique otra cosa). Cambiaremos uno o varios permisos en cada apartado
(independientemente de que el archivo ya tenga o no dichos permisos) y
comprobaremos que funciona correctamente:**

**a) Dar permiso de ejecución al resto de ususarios**

```console
   $ chmod o+x alumnos 
   $ ls -l alumnos
    -rw-r--r-x 1 ricardo ricardo 0 sep 28 18:02 alumnos
```

**b) Dar permiso de escritura y ejecución al grupo**

```console
    $ chmod g+wx alumnos
    $ ls -l alumnos
    -rw-rwxr-x 1 ricardo ricardo 0 sep 28 18:02 alumnos
```

**c) Quitar el permiso de lectura al grupo y al resto de usuarios**


```console
    $ chmod go-r alumnos
    $ ls -l alumnos
    -rw--wx--x 1 ricardo ricardo 0 sep 28 18:02 alumnos
```

**d) Dar permiso de ejecución al "propietario" y permiso de escritura al resto de usuarios:**

```console
    $ chmod u+x,o+w alumnos
    $ ls -l alumnos
    -rwx-wx-wx 1 ricardo ricardo 0 sep 28 18:02 alumnos
```

**e) Dar permiso de ejecución al “grupo” de todos los archivos cuyo nombre comience con la letra “e”. Nota: Si
no hay más de dos archivos que cumplan esa condición, se deberán crear archivos que empiecen con “e”
y/o modificar el nombre de archivos ya existentes para que cumplan esa condición.**


```console
    $ chmod g+x e*
    $ ls -l ealumnos
    -rwx-wx-wx 1 ricardo ricardo 0 sep 28 18:02 alumnos
```


## Ejercicio 2


**Utilizando solamente las órdenes de la práctica anterior y los metacaracteres de redirección de
salida:**

**a) Cree un archivo llamado ej31 , que contendrá el nombre de los archivos del directorio padre del directorio
de trabajo.**

```console
$ ls ../* > ej31
```

**b) Cree un archivo llamado ej32 , que contendrá las dos últimas líneas del archivo creado en el ejercicio
anterior.**

```console
$ tail ej31 -2 > ej32
```

**c) Añada al final del archivo ej32 , el contenido del archivo ej31.**

```console
$ cat ej31 >> ej32
```


## Ejercicio 3

**Utilizando el metacarácter de creación de cauces y sin utilizar la orden `cd`:**

**a) Muestre por pantalla el listado (en formato largo) de los últimos 6 archivos del directorio padre
correspondiente a su directorio de trabajo (HOME).**

```console
$ ls -l /etc/* | tail -6

    -rw-r--r-- 1 root root 1295 sep 11  2015 newuser.zshrc.recommended
    -rw-r--r-- 1 root root  344 sep 11  2015 zlogin
    -rw-r--r-- 1 root root   58 sep 11  2015 zlogout
    -rw-r--r-- 1 root root  264 sep 11  2015 zprofile
    -rw-r--r-- 1 root root  623 sep 11  2015 zshenv
    -rw-r--r-- 1 root root 3859 oct  2  2015 zshrc
```

**b) La orden wc muestra por pantalla el número de líneas, palabras y bytes de un archivo (consulta la orden
man para conocer más sobre ella). Utilizando dicha orden, muestre por pantalla el número de caracteres
(sólo ese número) de los archivos del directorio de trabajo que comiencen por los caracteres “e” o “f”.**


```console
cat [ef]* 2>/dev/null | wc -m
```


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
