# Práctica 7: Depuración y control de trabajos

## Ejercicio 7.1.

**Indique cuál ha sido el error introducido en el guion anterior y cómo se corregiría.**

El error está en el uso del comando `test` mediante la sintaxis `[ ]`. Es necesario
dejar un espacio entre cada corchete para que se ejecute el comando test.

## Ejercicio 7.2.

**Aplicar las herramientas de depuración vistas en la sección 2 para la detección de errores durante el
desarrollo de los guiones propuestos como ejercicios en la práctica 6.**

Antes de entregar los ejercicios de la práctica 6, estos fueron cuidadosamente depurados.

## Ejercicio 7.3.

**Escribir un guion que nos dé el nombre del proceso del sistema que consume más memoria.**

`consume.sh`
```bash
ps -u $USER -o cmd --sort=-%mem --no-headers | head -n 1
```
Explicación;:
- `ps`
    - `-u` $USER muestra todos los procesos del usuario activo.
    - `-o cmd` Permite sólo mostrar el nombre del comando
    - `--sort=-%mem` Ordena por memoria ocupada descendentemente
            (máximo arriba)
    - `no-headers` No muestra la cabecera
- `head -n 1`
    - Obtenemos la primera línea

## Ejercicio 7.4.

**Escribir un guion que escriba números desde el 1 en adelante en intervalos de un segundo ¿Cómo
se podría, desde otro terminal, detener la ejecución de dicho proceso, reanudarlo y terminar definitivamente su
ejecución?**

`contador_fantasma`

```bash
a=1
while true; do
    sleep 1
    echo $((++a))
done
```

Ejecutamos

```console
$ contador_fantasma &
[1] 21828
```

Y desde otra terminal ejecutamos:

- Detener la ejecución del proceso (Señal `SIGTSTP`)

```console
$ kill -TSTP 21828
```

(Es más adecuada una señal `SIGTSTP` que una `SIGSTOP`)

- Reanudar la ejecución del proceso (Señal `CONT`)

```console
$ kill -CONT 21828
```

- Terminar definitivamente su ejecución:

```console
$ kill -TERM 21828
```

## Ejercicio 7.5.

**¿Se puede matar un proceso que se encuentra suspendido? En su caso, ¿cómo?**

Sí, mediante la opción `-9` de la orden `kill`

```console
$ kill -9 [pid]
```

## Ejercicio 7.6.

**¿Qué debemos hacer a la orden top para que nos muestre sólo los procesos nuestros?**

Simplemente usando la opción `-u`

```console
$ ps -u $USER
```
