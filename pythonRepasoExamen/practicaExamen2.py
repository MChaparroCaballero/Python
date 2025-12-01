import sys
if len(sys.argv) != 2:
    # Este mensaje de error es coherente con lo que el código espera (solo el archivo).
    print(f"Uso: python {sys.argv[0]} <ruta_del_archivo>")
    print("Error: Necesito exactamente el nombre del archivo para contar sus líneas.")
    sys.exit(1)

archivo = sys.argv[1] # Esto toma el segundo argumento (el nombre del archivo)
total_partidas = 0 # Inicializamos la variable
nicknames= [] #array de nombres
ranking_de_jugadores = {} #lista de diccionarios
puntuacion_global=0
puntuacion_media=0
nombre_archivo_general = 'resumen_general.txt'
nombre_archivo_ranking ='ranking_jugadores.txt'


#funcion que devuelve los puntos de un jugador en el diccionario
def obtener_puntuacion(diccionario_jugador):
    """Devuelve la puntuación para usarla como clave de ordenación."""
    return diccionario_jugador['puntuaje']
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
                campos = linea_leida.split('.')
                if len(campos) < 3:
                    # Línea malformada: se espera al menos 3 campos separados por ';'
                    continue
               
                nickname=campos[0]
                if nickname not in nicknames:
                    nicknames.append(nickname)
                
                try:
                    # 2. Convertimos la puntuación a entero (INT) y la guardamos
                    puntuaje_actual = int(campos[1].strip())
                except ValueError:
                    # Omitimos la línea si la puntuación no es un número
                    continue
                total_partidas+=1
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
                    #actualizamos el global (suma acumulada)
                puntuacion_global += puntuaje_actual
            

    if len(nicknames)>0:
        puntuacion_media = (puntuacion_global / len(nicknames))
    else:  
        puntuacion_media=0
    
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
            ranking_ordenado = sorted(ranking_de_jugadores.values(), 
                                  key=obtener_puntuacion, # Usamos el nombre de la función
                                  reverse=True)
            for jugador_data in ranking_ordenado:
            
                # Extraer los datos
                nickname_individual = jugador_data["nickname"]
                puntuaje = jugador_data["puntuaje"]
                
                #Formatear la línea de texto que vamos a escribir
                # Usamos ';' como separador y '\n' para el salto de línea
                linea_a_escribir = f"{nickname_individual};{puntuaje}\n"
                
                # Escribir la línea en el archivo
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
