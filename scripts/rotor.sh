#!/bin/bash
# rotor –- Randal M. Michael – Mastering Unix Shell Scripting, Wiley, 2003

function rotar_linea {
     INTERVAL=1     # Tiempo a dormir entre giro
     TCOUNT="0"     # Para cada TCOUNT la linea gira 45 grados
     while true     # Bucle infinito hasta que terminamos la funcion
do
     TCOUNT=`expr $TCOUNT + 1` # Incrementa TCOUNT
     case $TCOUNT in
          "1" ) echo -e "-""\b\c"
          sleep $INTERVAL
          ;;
          "2" ) echo -e '\\'"\b\c"
          sleep $INTERVAL
          ;;
          "3" ) echo -e "|""\b\c"
          sleep $INTERVAL
          ;;
          "4" ) echo -e "/""\b\c"
          sleep $INTERVAL
          ;;
          * ) TCOUNT="0" ;; # Pone a cero TCOUNT
     esac
done
}

######## Cuerpo principal ############

rotar_linea &     # Ejecuta la funcion rotar_linea de fondo
ROTAR_PID=$!     # Captura el PID del ultimo proceso de fondo

# Simulamos la ejecucion de una orden que consume mucha CPU
# durante la cual mostramos la linea rotando
for ((CONT=1; CONT<400000; CONT++ )); do
:
done

# Paramos la funcion rotar_linea
kill -9 $ROTAR_PID
# Limpiamos el trazo que queda tras finalizar
echo -e "\b\b"
