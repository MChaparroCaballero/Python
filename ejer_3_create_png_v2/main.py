# autor : Maria Chaparro
# git : MChaparroCaballero
import os
import sys
import string
import random

# importamos la de string para que podamos usar string.ascii si no se pone como indefinido

# para comprovar si nos ha pasado los argumento y si no que no explote pero que informe y cierre
if len(sys.argv) < 2 or len(sys.argv) > 3:
    print(" Error de argumentos: Necesito el número de archivos y, opcionalmente, el nombre de la carpeta.")
    sys.exit(1)
# los argumentos que le pasamos por consola se guardan en sys.argv,
# siendo el de la posicion 0 el nombre del archivo del programa
# y el de la posicion 1 seria ya el nombre de la carpeta que vamos a crear.

#carpeta por defecto si no se pasa
carpeta_defecto = "img"


#primero la cadena de caracteres posibles para que sea accedible por la funcion
caracteres_posibles = string.ascii_letters + string.digits


#funcion que crea los nombres aleatorios con la longitud de caracteres que indicamos gracias
#  al range que nos lo hara 15 veces y elige uno al azar de los posibles con el random choice
#concatenamos a lo que ya llevamos de palabra y cuando haga las 15 nos lo retorna
def generar_nombre_aleatorio():
        nombre_aleatorio = ""
        for _ in range(10):
            caracter = random.choice(caracteres_posibles)
            nombre_aleatorio += caracter
        return nombre_aleatorio


#donde almacenamos el nombre de la carpeta a crea
# ASIGNACIÓN DE CARPETA USANDO IF/ELSE TRADICIONAL (Sustituye a la ternaria)
if len(sys.argv) == 3:
    # Si hay 3 argumentos, el tercero (índice 2) es el nombre de la carpeta.
    nombre_carpeta = sys.argv[2]
else:
    # Si no hay 3 argumentos (solo hay 2), usamos el valor por defecto.
    nombre_carpeta = carpeta_defecto

#donde almacenamos el numero de archivos que queremos hacer importante parseo por que los sys.argv devuelve strings
numero_archivos = int(sys.argv[1])

#lista donde almacenaremos todos los nombres de archivos para su comparacion
nombres_archivos = []

#primero intentamos crear la carpeta
try:
    #crear carpeta
    os.mkdir(nombre_carpeta)
    
    #para que me lo haga n veces lo de crear archivo     
    for _ in range(numero_archivos):
        #usamos bucle infinito para que hasta que no se cumpla la condicion de que no es repe siga 1 nombre nuevo luego cuando lo crea itera otra vez el for
        while True:
            #me generas un nuevo nombre y si no esta en la lista me lo añades y me lo creas en ese orden y escribimos tipo algo para que se vea 
            nuevo_nombre = generar_nombre_aleatorio()  # Llamas a tu función para crear el nombre aleatorio
            if nuevo_nombre not in nombres_archivos:
                nombres_archivos.append(nuevo_nombre)
                ruta_archivo = os.path.join(nombre_carpeta, f"{nuevo_nombre}.png")
                try:
                    #como son archivos binarios abrimos en modo wb, si las imagenes son binarias
                    with open(ruta_archivo, 'wb') as f:
                        pass  # Crear un archivo vacío de png
                    print("Añadido:", nuevo_nombre)
                    break  # Sale del while y sigue con el siguiente
                except IOError as e:
                    # Este try/except maneja fallos de disco/permisos y evita que el programa se detenga
                    print(f"Error al crear el archivo {nuevo_nombre}.png (posibles permisos/disco lleno): {e}")
                    # Usamos 'continue' para que el while True vuelva a generar un nuevo nombre y lo intente de nuevo
                    continue
            #que si existe un archivo con ese nombre? que me lo diga y genere otro
            else:
                print(f"{nuevo_nombre} ya existe, creando otro...")
#si existe la carpeta mandamos error               
except FileExistsError:
    print("Ya existe una carpeta con ese nombre")
except Exception as e:
    print(f"Ocurrió un error: {e}")
