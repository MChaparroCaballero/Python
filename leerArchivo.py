with open('archivo.txt', 'r') as archivo:
    for linea in archivo:
        print(f"{linea.strip()}")