import os
import sys

#los argumentos que le pasamos por consola se guardan en sys.argv,
#  siendo el primer elemento el programa (posicion 0), el segundo el archivo donde buscar (posición 1) y
#  el tercero la palabra a buscar (posición 2)
archivo = sys.argv[1]
palabra = sys.argv[2]


#LIMPIAR PANTALLA en windows necesitas cls para borrar la pantalla,
#  y clear para linux, por eso debemos especificar que sistema operativo es con os 
# y dependiendo de lo que nos devuelva poner uno o otro
os.system('cls' if os.name == 'nt' else 'clear')
try:
    #declaramos variable contador para contar las veces que aparece la palabra empieza en 0
    contador = 0
    with open(archivo, 'r', encoding="utf-8") as file:
         #leemos el archivo linea a linea y por cada linea contamos cuantas veces aparece la palabra
         #  con .count y se lo sumamos al contador, no remplazamos sino que sumamos.
         for linea in (file):
            contador +=linea.count(palabra)
    #imprimimos el resultado con la palabra y el archivo donde la hemos buscado y 
    # el contador con las veces que ha aparecido#
    if contador>0 :
        print(f"{palabra}:{contador}") 
    else:
        print("no se han encontrado instancias de ese caracter") 
          
except FileNotFoundError:
    print(f"El archivo '{archivo}' no existe")
except Exception as e:
    print(f"Ocurrió un error: {e}")





