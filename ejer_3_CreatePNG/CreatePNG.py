# autor : Maria Chaparro
# git : MChaparroCaballero
import os
import sys
import string
import random

# importamos la de string para que podamos usar string.ascii si no se pone como indefinido

# para comprovar si nos ha pasado los argumento y si no que no explote pero que informe y cierre
if len(sys.argv) != 3:
    print(
        "No me has pasado todos los argumentos, necesito nombre del programa y el archivo a leer"
    )
    sys.exit(1)

# los argumentos que le pasamos por consola se guardan en sys.argv,
# siendo el de la posicion 0 el nombre del archivo del programa
# y el de la posicion 1 seria ya el nombre de la carpeta que vamos a crear.
nombre_carpeta = sys.argv[1]
numero_archivos = sys.argv[2]
nombres_archivos = []
try:
    #crear carpeta
    os.mkdir(nombre_carpeta)
    caracteres_posibles = string.ascii_letters + string.digits
    #para que me lo haga n veces archivo
    for _ in range(numero_archivos):
        #para crear un nombre de archivo aleatorio
        for _ in range(15):
            caracter = random.choice(caracteres_posibles)
            nombre_aleatorio += caracter
    nombres_archivos.append(nombre_aleatorio)

except Exception as e:
    print(f"Ocurrió un error: {e}")
#falta excepciones, crear archivos y comparar no repetidos