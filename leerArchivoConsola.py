import os
import sys
archivo = sys.argv[1]


#LIMPIAR PANTALLA en windows necesitas cls para borrar la pantalla, y clear para linux
os.system('cls' if os.name == 'nt' else 'clear')

try:
    with open(archivo, 'r', encoding="utf-8") as file:
        for indice,line in enumerate(file):
            print(indice+1,line, end='')
except FileNotFoundError:
    print(f"El archivo '{archivo}' no existe")
except Exception as e:
    print(f"Ocurrió un error: {e}")