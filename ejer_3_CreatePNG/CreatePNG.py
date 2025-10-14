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



#primero la cadena de caracteres posibles para que sea accedible por la funcion
caracteres_posibles = string.ascii_letters + string.digits


#funcion que crea los nombres aleatorios con la longitud de caracteres que indicamos gracias
#  al range que nos lo hara 15 veces y elige uno al azar de los posibles con el random choice
#concatenamos a lo que ya llevamos de palabra y cuando haga las 15 nos lo retorna
def generar_nombre_aleatorio():
        nombre_aleatorio = ""
        for _ in range(15):
            caracter = random.choice(caracteres_posibles)
            nombre_aleatorio += caracter
        return nombre_aleatorio


#donde almacenamos el nombre de la carpeta a crea
nombre_carpeta = sys.argv[1]
#donde almacenamos el numero de archivos que queremos hacer importante parseo por que los sys.argv devuelve strings
numero_archivos = int(sys.argv[2])

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
            nuevo_nombre = generar_nombre_aleatorio()  # Llamas a tu función
            if nuevo_nombre not in nombres_archivos:
                nombres_archivos.append(nuevo_nombre)
                ruta_archivo = os.path.join(nombre_carpeta, f"{nuevo_nombre}.txt")
                with open(ruta_archivo, 'w') as f:
                    f.write(f"Este es el contenido del archivo {nuevo_nombre}")
                print("Añadido:", nuevo_nombre)
                break  # Sale del while y sigue con el siguiente
            else:
                print(f"{nuevo_nombre} ya existe, creando otro...")
#si existe la carpeta mandamos error               
except FileExistsError:
    print("Ya existe una carpeta con ese nombre")
except Exception as e:
    print(f"Ocurrió un error: {e}")
