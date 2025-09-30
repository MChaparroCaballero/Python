import sys
archivo = sys.argv[1]
try:
    with open(archivo, 'r') as linea:
        contenido = linea.read()
        print("Contenido del archivo:")
        print(contenido)
except FileNotFoundError:
    print(f"El archivo '{archivo}' no existe")