-- Archivo de inserciones SQL generado el: 2025-11-16 19:49:27
USE supermercado;


-- Datos del archivo: factura_001.txt (Número de Ticket: 20010001)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010001', '2025-09-11', '17:01', '015', 'Juan', 25.42, 5.34, 30.76, 'TARJETA', '741486');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010001.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Pasta Spaghetti 500g', 1.7);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Café Molido 250g', 3.8);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Arroz Redondo 1kg', 2.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Aceite de Oliva 1L', 13.0);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Sal Fina 1kg', 1.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.5, 'Manzana Golden (kg)', 3.12);


-- Datos del archivo: factura_002.txt (Número de Ticket: 20010002)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010002', '2025-09-12', '18:26', '033', 'Laura', 28.10, 5.90, 34.00, 'EFECTIVO', NULL);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 0.5, 'Manzana Golden (kg)', 0.62);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Pechuga de Pollo (kg)', 6.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Sal Fina 1kg', 1.0);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.25, 'Cebolla (kg)', 1.38);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Huevos Camperos 12u', 3.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.5, 'Pimiento Rojo (kg)', 3.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Queso Manchego 250g', 8.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Café Molido 250g', 3.8);


-- Datos del archivo: factura_003.txt (Número de Ticket: 20010003)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010003', '2025-09-13', '10:15', '011', 'Carlos', 22.30, 4.68, 26.98, 'EFECTIVO', NULL);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010003.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Cebolla (kg)', 2.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Huevos Camperos 12u', 3.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Pasta Spaghetti 500g', 2.55);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Queso Manchego 250g', 8.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Sal Fina 1kg', 0.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Leche Entera 1L', 2.85);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Tomate Triturado 400g', 2.7);


-- Datos del archivo: factura_004.txt (Número de Ticket: 20010004)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010004', '2025-09-14', '10:29', '028', 'Ana', 18.10, 3.80, 21.90, 'TARJETA', '257572');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010004.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Galletas María 200g', 1.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Arroz Redondo 1kg', 3.45);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Banana (kg)', 1.75);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Huevos Camperos 12u', 3.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Aceite de Oliva 1L', 6.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Pasta Spaghetti 500g', 1.7);


-- Datos del archivo: factura_005.txt (Número de Ticket: 20010005)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010005', '2025-09-15', '13:37', '019', 'Sofía', 32.75, 6.88, 39.63, 'TARJETA', '114488');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010005.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Tomate Triturado 400g', 1.8);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Huevos Camperos 12u', 3.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Azúcar 1kg', 1.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.5, 'Pimiento Rojo (kg)', 6.0);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Pan Baguette 250g', 1.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Galletas María 200g', 0.8);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Mantequilla 250g', 4.8);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Café Molido 250g', 11.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Yogur Natural 125g', 0.45);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Leche Entera 1L', 1.9);


-- Datos del archivo: factura_006.txt (Número de Ticket: 20010006)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010006', '2025-09-16', '17:35', '042', 'Diego', 34.25, 7.19, 41.44, 'TARJETA', '253659');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010006.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Sal Fina 1kg', 1.0);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Banana (kg)', 1.75);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Arroz Redondo 1kg', 1.15);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Café Molido 250g', 3.8);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Queso Manchego 250g', 4.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Aceite de Oliva 1L', 13.0);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Manzana Golden (kg)', 1.25);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Leche Entera 1L', 2.85);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Yogur Natural 125g', 0.45);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Pimiento Rojo (kg)', 4.8);


-- Datos del archivo: factura_007.txt (Número de Ticket: 20010007)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010007', '2025-09-17', '10:57', '024', 'Marta', 29.10, 6.11, 35.21, 'TARJETA', '286629');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010007.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Huevos Camperos 12u', 6.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Queso Manchego 250g', 4.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Aceite de Oliva 1L', 6.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Pechuga de Pollo (kg)', 6.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Azúcar 1kg', 1.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Leche Entera 1L', 1.9);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Galletas María 200g', 1.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Sal Fina 1kg', 0.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Yogur Natural 125g', 0.9);


-- Datos del archivo: factura_008.txt (Número de Ticket: 20010008)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010008', '2025-09-18', '19:12', '015', 'Juan', 38.15, 8.01, 46.16, 'TARJETA', '656754');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010008.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Sal Fina 1kg', 1.0);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.5, 'Pechuga de Pollo (kg)', 15.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Pimiento Rojo (kg)', 2.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Tomate Triturado 400g', 2.7);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Queso Manchego 250g', 12.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Leche Entera 1L', 2.85);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Cebolla (kg)', 1.1);


-- Datos del archivo: factura_009.txt (Número de Ticket: 20010009)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010009', '2025-09-19', '13:36', '033', 'Laura', 31.25, 6.56, 37.81, 'TARJETA', '388285');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010009.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  3   Pasta Spaghetti 500g', 2.55);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Refresco Cola 2L', 3.9);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Banana (kg)', 3.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 0.5, 'Pechuga de Pollo (kg)', 3.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Leche Entera 1L', 2.85);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 0.5, 'Cebolla (kg)', 0.55);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Azúcar 1kg', 1.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Arroz Redondo 1kg', 2.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Pan Baguette 250g', 2.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Huevos Camperos 12u', 9.3);


-- Datos del archivo: factura_010.txt (Número de Ticket: 20010010)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010010', '2025-09-20', '17:58', '011', 'Carlos', 22.15, 4.65, 26.80, 'TARJETA', '132091');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010010.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  1   Azúcar 1kg', 1.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Pasta Spaghetti 500g', 1.7);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Mantequilla 250g', 3.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Aceite de Oliva 1L', 6.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Cebolla (kg)', 1.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Café Molido 250g', 7.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Yogur Natural 125g', 0.45);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Sal Fina 1kg', 0.5);


-- Datos del archivo: factura_011.txt (Número de Ticket: 20010011)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010011', '2025-09-21', '11:53', '028', 'Ana', 40.00, 8.40, 48.40, 'TARJETA', '539623');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010011.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  3   Azúcar 1kg', 3.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Galletas María 200g', 1.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Huevos Camperos 12u', 6.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Aceite de Oliva 1L', 6.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Café Molido 250g', 11.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Queso Manchego 250g', 8.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Refresco Cola 2L', 2.6);


-- Datos del archivo: factura_012.txt (Número de Ticket: 20010012)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010012', '2025-09-22', '13:25', '019', 'Sofía', 14.20, 2.98, 17.18, 'EFECTIVO', NULL);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010012.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  1   Refresco Cola 2L', 1.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Pasta Spaghetti 500g', 0.85);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Yogur Natural 125g', 0.45);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Tomate Triturado 400g', 2.7);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Sal Fina 1kg', 0.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Queso Manchego 250g', 8.4);


-- Datos del archivo: factura_013.txt (Número de Ticket: 20010013)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010013', '2025-09-23', '16:10', '042', 'Diego', 28.05, 5.89, 33.94, 'TARJETA', '997874');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010013.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  3   Yogur Natural 125g', 1.35);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Queso Manchego 250g', 12.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Galletas María 200g', 1.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Refresco Cola 2L', 1.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Arroz Redondo 1kg', 3.45);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.25, 'Pechuga de Pollo (kg)', 7.75);


-- Datos del archivo: factura_014.txt (Número de Ticket: 20010014)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010014', '2025-09-24', '11:21', '024', 'Marta', 27.76, 5.83, 33.59, 'EFECTIVO', NULL);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010014.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Arroz Redondo 1kg', 2.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Banana (kg)', 3.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Pechuga de Pollo (kg)', 6.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Sal Fina 1kg', 1.0);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Pan Baguette 250g', 1.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Azúcar 1kg', 2.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Aceite de Oliva 1L', 6.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.25, 'Manzana Golden (kg)', 1.56);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Pasta Spaghetti 500g', 2.55);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 0.5, 'Cebolla (kg)', 0.55);


-- Datos del archivo: factura_015.txt (Número de Ticket: 20010015)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010015', '2025-09-25', '15:58', '015', 'Juan', 19.25, 4.04, 23.29, 'TARJETA', '134875');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010015.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  1   Pimiento Rojo (kg)', 2.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Pan Baguette 250g', 1.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Tomate Triturado 400g', 2.7);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Galletas María 200g', 2.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Mantequilla 250g', 1.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Cebolla (kg)', 2.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Huevos Camperos 12u', 3.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Sal Fina 1kg', 1.0);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Arroz Redondo 1kg', 1.15);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Refresco Cola 2L', 1.3);


-- Datos del archivo: factura_016.txt (Número de Ticket: 20010016)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010016', '2025-09-26', '10:34', '033', 'Laura', 23.25, 4.88, 28.13, 'TARJETA', '819358');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010016.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  1   Pechuga de Pollo (kg)', 6.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Queso Manchego 250g', 4.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Mantequilla 250g', 3.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Galletas María 200g', 2.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Pimiento Rojo (kg)', 2.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Pan Baguette 250g', 1.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Arroz Redondo 1kg', 3.45);


-- Datos del archivo: factura_017.txt (Número de Ticket: 20010017)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010017', '2025-09-27', '18:14', '011', 'Carlos', 23.73, 4.98, 28.71, 'TARJETA', '199052');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010017.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Arroz Redondo 1kg', 2.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 0.5, 'Banana (kg)', 0.88);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.5, 'Cebolla (kg)', 2.75);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Pimiento Rojo (kg)', 2.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Huevos Camperos 12u', 3.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Tomate Triturado 400g', 0.9);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Café Molido 250g', 11.4);


-- Datos del archivo: factura_018.txt (Número de Ticket: 20010018)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010018', '2025-09-28', '14:51', '028', 'Ana', 47.60, 10.00, 57.60, 'TARJETA', '643300');


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010018.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Arroz Redondo 1kg', 2.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Aceite de Oliva 1L', 19.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Yogur Natural 125g', 0.9);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Galletas María 200g', 2.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Café Molido 250g', 3.8);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.5, 'Pechuga de Pollo (kg)', 15.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Mantequilla 250g', 3.2);


-- Datos del archivo: factura_019.txt (Número de Ticket: 20010019)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010019', '2025-09-29', '10:47', '019', 'Sofía', 36.52, 7.67, 44.19, 'EFECTIVO', NULL);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 20010019.0, '------------------------------------------------
CANT  DESCRIPCIÓN                  IMPORTE
------------------------------------------------
  2   Café Molido 250g', 7.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Yogur Natural 125g', 0.9);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Azúcar 1kg', 2.2);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Galletas María 200g', 2.4);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 0.5, 'Manzana Golden (kg)', 0.62);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Arroz Redondo 1kg', 1.15);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Cebolla (kg)', 1.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Leche Entera 1L', 2.85);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Huevos Camperos 12u', 9.3);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Queso Manchego 250g', 8.4);


-- Datos del archivo: factura_020.txt (Número de Ticket: 20010020)
INSERT INTO tickets (ticket_num, fecha, hora, id_cajero, nombre_cajero, subtotal, iva, total, forma_pago, autorizacion)
VALUES ('20010020', '2025-09-30', '12:55', '042', 'Diego', 38.00, 7.98, 45.98, 'EFECTIVO', NULL);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.5, 'Pechuga de Pollo (kg)', 15.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Aceite de Oliva 1L', 6.5);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Pan Baguette 250g', 2.1);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 2.0, 'Galletas María 200g', 1.6);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 1.0, 'Tomate Triturado 400g', 0.9);


INSERT INTO productos_vendidos (ticket_id, cantidad, descripcion, importe_unitario_o_total)
VALUES (LAST_INSERT_ID(), 3.0, 'Café Molido 250g', 11.4);

