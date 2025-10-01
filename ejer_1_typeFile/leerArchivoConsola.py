import os
import sys

#los argumentos que le pasamos por consola se guardan en sys.argv, siendo el primer elemento el nombre del archivo
archivo = sys.argv[1]


#LIMPIAR PANTALLA en windows necesitas cls para borrar la pantalla, y clear para linux, por eso debemos especificar que sistema operativo es con os y dependiendo de lo que nos devuelva poner uno o otro
os.system('cls' if os.name == 'nt' else 'clear')


#dentro de un try (para controlar errores por si no encuentra el archivo o x cosas) abrimos el archivo en modo lectura
#con encoding="utf-8" nos aseguramos que si el archivo tiene caracteres especiales no de error, después lo recorremos con un for in pero le pedimos que tambien nos escupa el indice de la linea por la que va (al leerlo linea por linea no necesitamos .read)
try:
    with open(archivo, 'r', encoding="utf-8") as file:
        for indice,line in enumerate(file):
            #el end='' es para que no nos meta un salto de linea extra al imprimir y el +1 es para que el indice empiece en 1 en vez de 0
            print(indice+1,line, end='')
except FileNotFoundError:
    print(f"El archivo '{archivo}' no existe")
except Exception as e:
    print(f"Ocurrió un error: {e}")