import sys

# La condición es CORRECTA si solo esperas: 
# 1. sys.argv[0] -> El nombre del script
# 2. sys.argv[1] -> El nombre del archivo
if len(sys.argv) != 2:
    # Este mensaje de error es coherente con lo que el código espera (solo el archivo).
    print(f"Uso: python {sys.argv[0]} <ruta_del_archivo>")
    print("Error: Necesito exactamente el nombre del archivo para contar sus líneas.")
    sys.exit(1)

archivo = sys.argv[1] # Esto toma el segundo argumento (el nombre del archivo)
numero_lineas = 0 # Inicializamos la variable

try:
    # Abrimos el archivo en modo lectura ('r') con manejo automático de cierre.
    with open(archivo, 'r', encoding='utf-8') as file:
        # La forma más eficiente de contar líneas: leerlas todas y contar la lista.
        numero_lineas = len(file.readlines())
    
    # 🌟 ¡Faltaba imprimir el resultado!
    print(f"\nEl archivo '{archivo}' tiene **{numero_lineas}** líneas.")

except FileNotFoundError:
    # Manejar el error si el archivo no existe
    print(f"❌ Error: El archivo '{archivo}' no se encontró.")
    sys.exit(1)

except Exception as e:
    # Manejar otros posibles errores (ej. permisos)
    print(f"⚠️ Ocurrió un error al leer el archivo: {e}")
    sys.exit(1)