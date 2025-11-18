import os # Necesario para interactuar con el sistema de archivos (carpetas y rutas)
import re # Necesario para usar expresiones regulares (Regular Expressions)
import sys # Necesario para leer argumentos de la línea de comandos (la carpeta)
import datetime # Necesario para manejar fechas y para poner la fecha en el encabezado del archivo SQL



# comprobamos que se ha pasado la carpeta de facturas
if len(sys.argv) != 2:
    # Si no es así, lanza una excepción y detiene el programa
    raise Exception("Se requiere exactamente un argumento: la carpeta de tickets")
    
# Almacenamos la carpeta de tickets
carpeta_tickets = sys.argv[1]

# Definimos el nombre del archivo SQL que se va a crear
archivo_sql_salida = 'inserciones_tickets.sql'

#funcion que extrae del ticket que se le cada uno de los campos con expresiones regulares para posteriormente generar las inserciones
def parsear_ticket(contenido_ticket):
   
    #patrones de los campos

    # Captura el número del ticket (dígitos después de "Ticket:")
    patron_numero_ticket = r"Ticket:\s(\d+)"
    # Captura la fecha (cualquier texto que no sea espacio después de "Fecha:")
    patron_fecha = r"Fecha:\s*([^ ]+)"
    # Captura la hora (formato de dígitos y dos puntos después de "Hora:")
    patron_hora = r"Hora:\s*([\d:]+)"
    # Captura el nombre del cajero (letras después de los números/guiones del cajero)
    patron_nombre_cajero = r"Cajero:\s*[\d\s-]*([A-Za-zñÑÁÉÍÓÚáéíóú].*?)\s"
    # Captura el ID numérico del cajero (dígitos después de "Cajero:")
    patron_id_cajero = r"Cajero:\s*(\d+)"
    # Captura el subtotal (dígitos con un punto y dos decimales)
    patron_subtotal = r"SUBTOTAL\s*(\d+\.\d{2})"
    # Captura el IVA (dígitos con un punto y dos decimales)
    patron_iva = r"IVA\s\(\d+%\)\s*(\d+\.\d{2})"
    # Captura el total a pagar (dígitos con un punto y dos decimales)
    patron_total_a_pagar = r"TOTAL A PAGAR\s*(\d+\.\d{2})"
    # Captura la forma de pago (palabra después de "FORMA DE PAGO:")
    patron_forma_pago = r"FORMA DE PAGO:\s(\w+)"
   
    # Captura los productos: cantidad (dígitos con posible decimal), descripción (texto) e importe (dígitos con punto y dos decimales)
    #porque todo junto en vez de separado? porque puede haber varias líneas de productos y necesitamos capturarlas todas ademas de que sino 
    #no va a saber de que importe es cada producto o su cantidad aka UN CAOS
    patron_productos = r'\s*(\d+\.?\d*)\s+([A-Za-zñÑÁÉÍÓÚáéíóú\s\(\)0-9a-zA-Z\/-]+)\s+([\d]+\.[\d]{2})\s€'
    # Captura el número de autorización de tarjeta (dígitos)
    patron_autorizacion = r"Autorización:\s(\d+)"

    # Función auxiliar para buscar un patrón y devolver el grupo capturado o None si no se 
    # encuentra , es mas que nada para los campos que no son obligatorios que si no existen no peten
    def extract_or_none(pattern, content):
        match = re.search(pattern, content, re.MULTILINE)
        # Esto previene el error "AttributeError: 'NoneType' object has no attribute 'group'"
        return match.group(1).strip() if match else None

    try:
        # Se extraen todos los campos usando la función auxiliar
        data = {
            'id_ticket': extract_or_none(patron_numero_ticket, contenido_ticket),
            'fecha': extract_or_none(patron_fecha, contenido_ticket),
            'hora': extract_or_none(patron_hora, contenido_ticket),
            'cajero': extract_or_none(patron_nombre_cajero, contenido_ticket),
            'id_cajero': extract_or_none(patron_id_cajero, contenido_ticket),
            'subtotal': extract_or_none(patron_subtotal, contenido_ticket),
            'iva_total': extract_or_none(patron_iva, contenido_ticket),
            'total_pagar': extract_or_none(patron_total_a_pagar, contenido_ticket),
            'pago': extract_or_none(patron_forma_pago, contenido_ticket),
            'autorizacion_tarjeta': extract_or_none(patron_autorizacion, contenido_ticket),
            
            # Se usa re.findall para obtener TODOS los productos como una lista de tuplas
            'productos': re.findall(patron_productos, contenido_ticket, re.MULTILINE)
        }
        
        # Validación de campos críticos (si faltan, el ticket es inválido)
        if not all([data['id_ticket'], data['fecha'], data['total']]):
             print(f"Error: El ticket {data.get('id_ticket', 'sin número')} no contiene datos esenciales.")
             return None
             
        return data

    except Exception as e:
        print(f"Error al parsear el ticket: {e}")
        return None

# funcion para generar el sql insert a partir de los datos parseados

def generar_sql_insert(data, filename):
    

    #primero hacemos un array donde iremos guardando las sentencias sql para luego meterlas todas juntas en el archivo
    sql_statements = []

    # Función auxiliar para formatear valores SQL (añade comillas a strings y usa NULL)
    def format_for_sql(value):
        if not value:
            return 'NULL'
        # Escapa comillas simples dentro de las cadenas
        value = value.replace("'", "''")
        return f"'{value}'"

    # Preparar y formatear la fecha para MySQL (YYYY-MM-DD)
    fecha_mysql = 'NULL'
    if data['fecha']:
        try:
            # Convierte el formato DD/MM/YYYY del ticket al formato MySQL
            fecha_obj = datetime.datetime.strptime(data['fecha'], '%d/%m/%Y')
            fecha_mysql = f"'{fecha_obj.strftime('%Y-%m-%d')}'"
        except (ValueError, TypeError):
            pass 

    # Lista de valores de cabecera formateados para el INSERT
    valores_cabecera = [
        format_for_sql(data['id_ticket']), 
        fecha_mysql,
        format_for_sql(data['hora']),
        format_for_sql(data['id_cajero']),
        format_for_sql(data['cajero']),
        data['subtotal'] if data['subtotal'] else 'NULL', # Decimales van sin comillas
        data['iva_total'] if data['iva_total'] else 'NULL', # Decimales van sin comillas
        data['total_pagar'], # Decimales van sin comillas
        format_for_sql(data['pago']),
        format_for_sql(data['autorizacion_tarjeta']),
    ]

    # Sentencia INSERT para la tabla 'tickets'
    sql_ticket = f"""
-- Datos del archivo: {filename} (Número de Ticket: {data['id_ticket']})
INSERT INTO tickets (id_ticket, fecha, hora, id_cajero, subtotal, iva_total, total_pagar)
VALUES ({', '.join(valores_cabecera)});
"""
    sql_statements.append(sql_ticket)

    # Generar sentencias INSERT para cada producto
    for cantidad, descripcion, importe in data['productos']:
        # Uso de LAST_INSERT_ID(): Esta función de MySQL se asegura de que el 'ticket_id' 
        # del producto sea el ID autoincremental que MySQL acaba de crear para el ticket de cabecera
        sql_producto = f"""
INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), {float(cantidad)}, {format_for_sql(descripcion.strip())}, {float(importe)});
"""
        sql_statements.append(sql_producto)
    
    # Devuelve todas las sentencias INSERT para este ticket
    return "\n".join(sql_statements)


# ahora ya con las funciones hechas procedemos a leer los archivos de la carpeta y generar el sql

print(f"Iniciando procesamiento de tickets en: {carpeta_tickets}")

# Abre el archivo SQL de salida en modo escritura ('w'). Si existe, lo sobreescribe.
with open(archivo_sql_salida, 'w', encoding='utf-8') as sql_file:
    
    # Escribe la cabecera informativa en el archivo SQL
    sql_file.write(f"-- Archivo de inserciones SQL generado el: {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
    # Comando USE para seleccionar la base de datos
    sql_file.write("USE supermercado;\n\n")

    # Itera sobre todos los nombres de archivos en la carpeta de tickets
    for filename in sorted(os.listdir(carpeta_tickets)): 
        # Procesa solo si el archivo termina en .txt
        if filename.endswith(".txt"):
            # Construye la ruta completa al archivo actual
            filepath = os.path.join(carpeta_tickets, filename)
            
            try:
                # Abre y lee el contenido completo del archivo en la variable contenido_ticket
                with open(filepath, 'r', encoding='utf-8') as f:
                    contenido_ticket = f.read()
                
                # Llama a la función de parseo
                datos_ticket = parsear_ticket(contenido_ticket)
                
                if datos_ticket:
                    # Si el parseo fue exitoso, genera las sentencias SQL
                    sql_inserts = generar_sql_insert(datos_ticket, filename) 
                    
                    # Escribe las sentencias en el archivo SQL
                    sql_file.write(sql_inserts)
                    sql_file.write("\n")
                    
                    # Imprime un mensaje de éxito en la consola
                    print(f"✅ Sentencias SQL generadas para {filename} (Ticket {datos_ticket['numero_ticket']})")
                
            except Exception as e:
                # Captura cualquier error que ocurra durante la lectura o procesamiento
                print(f"FATAL: Error al procesar {filename}. Saltando archivo. Error: {e}")

# Mensaje final después de que el bucle ha terminado
print(f"\nProceso finalizado. El archivo de inserciones se ha guardado en: {archivo_sql_salida}")