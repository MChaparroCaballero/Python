#autor : Maria Chaparro 
# git : MChaparroCaballero
import os
import sys

#para comprovar si nos ha pasado los argumento y si no que no explote pero que informe y cierre
if len(sys.argv) != 2:
    print("No me has pasado todos los argumentos, necesito nombre del programa y el archivo a leer")
    sys.exit(1)

#los argumentos que le pasamos por consola se guardan en sys.argv, 
# siendo el de la posicion 0 el nombre del archivo del programa 
# y el de la posicion 1 seria ya el nombre del archivo que le pasamos 
nombre_carpeta = sys.argv[1]