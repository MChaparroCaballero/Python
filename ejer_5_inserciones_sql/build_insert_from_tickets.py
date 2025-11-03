import os
import re
import sys


#la carpeta donde estan los tickets
carpeta_tickets = sys.argv[1]

#a ver primero necesitamos parsear la info del ticket en distintos grupos
#luego va a tocar recorrer en un for todos los tickets  (y llamar a la funcion de parseo)
#necesitamos hacer como un condicional o algo para que la primera vez cree el archivo de inserciones
#y cuando ya este creado vaya agregando las nuevas inserciones


#vamos si o si a tener que usar expresiones regulares para parsear los tickets cuales? ni idea

def parsear_ticket(contenido_ticket):
    # Expresiones regulares para extraer la información

    #patrones hasta id cajero hecho
    patron_numero_ticket = r"Ticket:\s*(\d+)"
    patron_fecha = r"Fecha:\s*([^ ]+)"
    patron_hora= r"Hora:\s*([\d:]+)"
    patron_nombre_cajero = r"Cajero:\s*[\d\s-]*([A-Za-z].*?)\s"
    patron_id_cajero = r"Cajero:\s*(\d+)"


    
    patron_cliente = r"Customer Name:\s*([A-Za-z\s]+)"
    patron_total = r"Total Amount:\s*\$([\d.]+)"

    numero_ticket = re.search(patron_numero_ticket, contenido_ticket).group(1)
    fecha = re.search(patron_fecha, contenido_ticket).group(1)
    cliente = re.search(patron_cliente, contenido_ticket).group(1)
    total = re.search(patron_total, contenido_ticket).group(1)

    return numero_ticket, fecha, cliente, total