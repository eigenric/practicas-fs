# Practica 3: Permisos y redirecciones

## Ejercicio 1

a) Dar permiso de ejecución al resto de ususarios

```console
   $ chmod o+x alumnos 
   $ ls -l alumnos
    -rw-r--r-x 1 ricardo ricardo 0 sep 28 18:02 alumnos
```

b) Dar permiso de escritura y ejecución al grupo

```console
    $ chmod g+wx alumnos
    $ ls -l alumnos
    -rw-rwxr-x 1 ricardo ricardo 0 sep 28 18:02 alumnos
```

c) Quitar el permiso de lectura al grupo y al resto de usuarios


```console
    $ chmod go-r alumnos
    $ ls -l alumnos
    -rw--wx--x 1 ricardo ricardo 0 sep 28 18:02 alumnos
```

d) Dar permiso de ejecución al "propietario" y permiso de escritura al resto de
usuarios:

```console
    $ chmod u+x,o+w alumnos
    $ ls -l alumnos
    -rwx-wx-wx 1 ricardo ricardo 0 sep 28 18:02 alumnos
```

e) 

```console
    $ chmod g+x e*
    $ ls -l ealumnos
    -rwx-wx-wx 1 ricardo ricardo 0 sep 28 18:02 alumnos
```


## Ejercicio 2


a) `ls ../* > ej31`
b) `tail ej31 -2 > ej32`
c) `cat ej31 >> ej32`


## Ejercicio 3

a) 

```console
$ ls -l /etc/* | tail -6


    -rw-r--r-- 1 root root 1295 sep 11  2015 newuser.zshrc.recommended
    -rw-r--r-- 1 root root  344 sep 11  2015 zlogin
    -rw-r--r-- 1 root root   58 sep 11  2015 zlogout
    -rw-r--r-- 1 root root  264 sep 11  2015 zprofile
    -rw-r--r-- 1 root root  623 sep 11  2015 zshenv
    -rw-r--r-- 1 root root 3859 oct  2  2015 zshrc
```
 
b) `cat [ef]* 2>/dev/null | wc -m`
