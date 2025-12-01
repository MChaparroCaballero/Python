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
total_partidas = 0 # Inicializamos la variable
nicknames= [] #array de nombres
puntuacion_global=0
puntuacion_media=0
ranking_de_jugadores = {} #lista de diccionarios
nombre_archivo_general = 'resumen.txt'
nombre_archivo_ranking ='scores.txt'
try:
    # Abrimos el archivo en modo lectura ('r') con manejo automático de cierre.
    with open(archivo, 'r', encoding='utf-8') as file:
        # La forma más eficiente de contar líneas: leerlas todas y contar la lista.
        

        #empezamosa ir linea a linea
        for linea in file:
            linea_leida=linea.strip()
            if not linea_leida:
                # Omitimos líneas vacías
                continue
            campos = linea_leida.split(';')
            #con esto comprobamos si existe el nickname en el array y si no es asi lo mete
            if len(campos) < 3:
                # Línea malformada: se espera al menos 3 campos separados por ';'
                continue

            nickname=campos[0]
            if nickname not in nicknames:
                nicknames.append(nickname)
            
            try:
                # 2. Convertimos la puntuación a entero (INT) y la guardamos
                puntuaje_actual = int(campos[2].strip())
            except ValueError:
                # Omitimos la línea si la puntuación no es un número
                continue

            # Contamos sólo las partidas válidas (con puntuación numérica)
            total_partidas += 1

            #actualizamos el global (suma acumulada)
            puntuacion_global += puntuaje_actual

            # Comprobamos si el nickname ya existe en nuestro diccionario de ranking
            if nickname in ranking_de_jugadores:
                puntuaje_guardado = ranking_de_jugadores[nickname]["puntuaje"]
                
                # Si la puntuación actual es MAYOR, la actualizamos
                if puntuaje_actual > puntuaje_guardado:
                    ranking_de_jugadores[nickname]["puntuaje"] = puntuaje_actual
            else:
                # El jugador es nuevo, lo añadimos al diccionario de ranking
                jugador = {
                    "nickname": nickname,
                    "puntuaje": puntuaje_actual
                }
                ranking_de_jugadores[nickname] = jugador
            
    #como calcular la media (media por partida)
    puntuacion_media = (puntuacion_global / total_partidas) if total_partidas > 0 else 0

    try:
        with open(nombre_archivo_general, 'w', encoding='utf-8') as archivo_salida:
            archivo_salida.write("--- RESUMEN GENERAL SYNAPSE GAME ---\n")
            archivo_salida.write("Total de partidas: " + str(total_partidas) + "\n")
            archivo_salida.write("Total de jugadores distintos: " + str(len(nicknames)) + "\n")
            archivo_salida.write("Puntuacion media global: " + f"{puntuacion_media:.2f}" + "\n")
    except Exception as e:
        print(f"Ocurrió un error al escribir el archivo resumen: {e}")

    try:
        with open(nombre_archivo_ranking, 'w', encoding='utf-8') as archivo_salida:
            archivo_salida.write("--- Ranking de jugadores ---\n")
            archivo_salida.write("Total de partidas: " + str(total_partidas) + "\n")
            archivo_salida.write("Total de jugadores distintos: " + str(len(nicknames)) + "\n")
            archivo_salida.write("Puntuacion media global: " + f"{puntuacion_media:.2f}" + "\n")
            for jugador_data in ranking_de_jugadores.values():
            
                # Extraer los datos
                nickname_individual = jugador_data["nickname"]
                puntuaje = jugador_data["puntuaje"]
                
                # 3. Formatear la línea de texto que vamos a escribir
                # Usamos ';' como separador y '\n' para el salto de línea
                linea_a_escribir = f"{nickname_individual};{puntuaje}\n"
                
                # 4. Escribir la línea en el archivo
                archivo_salida.write(linea_a_escribir)
    except Exception as e:
        print(f"Ocurrió un error al escribir el archivo ranking: {e}")
   

except FileNotFoundError:
    # Manejar el error si el archivo no existe
    print(f"Error: El archivo '{archivo}' no se encontró.")
    sys.exit(1)

except Exception as e:
    # Manejar otros posibles errores (ej. permisos)
    print(f"Ocurrió un error al leer el archivo: {e}")

    sys.exit(1)
