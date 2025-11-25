
drop database if exists supermercado;
create database supermercado;
use supermercado;
DROP TABLE IF EXISTS Ticket_Linea;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Tickets; 
DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Sucursal;

CREATE TABLE Sucursal (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    cif VARCHAR(15) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    telefono VARCHAR(15),
    id_sucursal INT NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);


CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL UNIQUE,
    precio_unitario DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Tickets (
    id_ticket INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT NOT NULL,
    id_sucursal INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    iva_total DECIMAL(10, 2) NOT NULL,
    total_pagar DECIMAL(10, 2) NOT NULL,
	tipo_pago VARCHAR(50) NOT NULL,
    autorizacion VARCHAR(50),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);

CREATE TABLE Ticket_Linea (
    id_ticket_linea INT AUTO_INCREMENT PRIMARY KEY,
    id_ticket INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_ticket) REFERENCES Tickets(id_ticket),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('015', 'Juan Pérez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '015'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010001, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-11',
    '17:01',
    25.42,
    5.34,
    30.76,
    'TARJETA', 
    '741486'
);
SET @TicketID = 20010001; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pasta Spaghetti 500g', 0.85);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pasta Spaghetti 500g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.7
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.8
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    13.0
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    1.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Manzana Golden (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Manzana Golden (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2500, 
    3.12
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('033', 'Laura García', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '033'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010002, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-12',
    '18:26',
    28.10,
    5.90,
    34.00,
    'EFECTIVO', 
    NULL
);
SET @TicketID = 20010002; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Manzana Golden (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Manzana Golden (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    500, 
    0.62
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 6.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.0
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1250, 
    1.38
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pimiento Rojo (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pimiento Rojo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1500, 
    3.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    8.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.8
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('011', 'Carlos Ruiz', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '011'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010003, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-13',
    '10:15',
    22.30,
    4.68,
    26.98,
    'EFECTIVO', 
    NULL
);
SET @TicketID = 20010003; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pasta Spaghetti 500g', 0.85);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pasta Spaghetti 500g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.55
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    8.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Leche Entera 1L', 0.95);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Leche Entera 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.85
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Tomate Triturado 400g', 0.9);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Tomate Triturado 400g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.7
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('028', 'Ana Fernández', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '028'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010004, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-14',
    '10:29',
    18.10,
    3.80,
    21.90,
    'TARJETA', 
    '257572'
);
SET @TicketID = 20010004; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    3.45
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Banana (kg)', 1.75);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Banana (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.75
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pasta Spaghetti 500g', 0.85);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pasta Spaghetti 500g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.7
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('019', 'Sofía Martínez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '019'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010005, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-15',
    '13:37',
    32.75,
    6.88,
    39.63,
    'TARJETA', 
    '114488'
);
SET @TicketID = 20010005; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Tomate Triturado 400g', 0.9);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Tomate Triturado 400g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.8
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Azúcar 1kg', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Azúcar 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pimiento Rojo (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pimiento Rojo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2500, 
    6.0
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pan Baguette 250g', 0.7);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pan Baguette 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.8
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Mantequilla 250g', 1.6);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Mantequilla 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    4.8
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    11.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Yogur Natural 125g', 0.45);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Yogur Natural 125g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.45
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Leche Entera 1L', 0.95);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Leche Entera 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.9
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('042', 'Diego Gómez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '042'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010006, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-16',
    '17:35',
    34.25,
    7.19,
    41.44,
    'TARJETA', 
    '253659'
);
SET @TicketID = 20010006; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.0
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Banana (kg)', 1.75);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Banana (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.75
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.15
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.8
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    4.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    13.0
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Manzana Golden (kg)', 1.25);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Manzana Golden (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.25
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Leche Entera 1L', 0.95);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Leche Entera 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.85
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Yogur Natural 125g', 0.45);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Yogur Natural 125g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.45
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pimiento Rojo (kg)', 2.4);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pimiento Rojo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    4.8
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('024', 'Marta López', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '024'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010007, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-17',
    '10:57',
    29.10,
    6.11,
    35.21,
    'TARJETA', 
    '286629'
);
SET @TicketID = 20010007; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    6.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    4.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 6.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Azúcar 1kg', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Azúcar 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Leche Entera 1L', 0.95);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Leche Entera 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.9
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Yogur Natural 125g', 0.45);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Yogur Natural 125g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    0.9
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('015', 'Juan Pérez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '015'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010008, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-18',
    '19:12',
    38.15,
    8.01,
    46.16,
    'TARJETA', 
    '656754'
);
SET @TicketID = 20010008; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.0
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 0.01);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2500, 
    15.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pimiento Rojo (kg)', 2.4);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pimiento Rojo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    2.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Tomate Triturado 400g', 0.9);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Tomate Triturado 400g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.7
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    12.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Leche Entera 1L', 0.95);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Leche Entera 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.85
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.1
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('033', 'Laura García', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '033'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010009, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-19',
    '13:36',
    31.25,
    6.56,
    37.81,
    'TARJETA', 
    '388285'
);
SET @TicketID = 20010009; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pasta Spaghetti 500g', 0.85);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pasta Spaghetti 500g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.55
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Refresco Cola 2L', 1.3);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Refresco Cola 2L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    3.9
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Banana (kg)', 1.75);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Banana (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    3.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 0.01);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    500, 
    3.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Leche Entera 1L', 0.95);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Leche Entera 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.85
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    500, 
    0.55
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Azúcar 1kg', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Azúcar 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pan Baguette 250g', 0.7);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pan Baguette 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    9.3
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('011', 'Carlos Ruiz', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '011'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010010, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-20',
    '17:58',
    22.15,
    4.65,
    26.80,
    'TARJETA', 
    '132091'
);
SET @TicketID = 20010010; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Azúcar 1kg', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Azúcar 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pasta Spaghetti 500g', 0.85);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pasta Spaghetti 500g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.7
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Mantequilla 250g', 1.6);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Mantequilla 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    3.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    7.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Yogur Natural 125g', 0.45);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Yogur Natural 125g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.45
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.5
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('028', 'Ana Fernández', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '028'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010011, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-21',
    '11:53',
    40.00,
    8.40,
    48.40,
    'TARJETA', 
    '539623'
);
SET @TicketID = 20010011; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Azúcar 1kg', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Azúcar 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    3.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    6.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    11.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    8.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Refresco Cola 2L', 1.3);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Refresco Cola 2L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.6
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('019', 'Sofía Martínez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '019'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010012, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-22',
    '13:25',
    14.20,
    2.98,
    17.18,
    'EFECTIVO', 
    NULL
);
SET @TicketID = 20010012; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Refresco Cola 2L', 1.3);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Refresco Cola 2L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pasta Spaghetti 500g', 0.85);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pasta Spaghetti 500g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.85
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Yogur Natural 125g', 0.45);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Yogur Natural 125g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.45
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Tomate Triturado 400g', 0.9);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Tomate Triturado 400g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.7
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    8.4
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('042', 'Diego Gómez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '042'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010013, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-23',
    '16:10',
    28.05,
    5.89,
    33.94,
    'TARJETA', 
    '997874'
);
SET @TicketID = 20010013; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Yogur Natural 125g', 0.45);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Yogur Natural 125g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    1.35
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    12.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Refresco Cola 2L', 1.3);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Refresco Cola 2L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    3.45
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 0.01);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1250, 
    7.75
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('024', 'Marta López', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '024'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010014, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-24',
    '11:21',
    27.76,
    5.83,
    33.59,
    'EFECTIVO', 
    NULL
);
SET @TicketID = 20010014; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Banana (kg)', 1.75);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Banana (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    3.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 6.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.0
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pan Baguette 250g', 0.7);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pan Baguette 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Azúcar 1kg', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Azúcar 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Manzana Golden (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Manzana Golden (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1250, 
    1.56
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pasta Spaghetti 500g', 0.85);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pasta Spaghetti 500g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.55
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    500, 
    0.55
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('015', 'Juan Pérez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '015'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010015, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-25',
    '15:58',
    19.25,
    4.04,
    23.29,
    'TARJETA', 
    '134875'
);
SET @TicketID = 20010015; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pimiento Rojo (kg)', 2.4);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pimiento Rojo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    2.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pan Baguette 250g', 0.7);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pan Baguette 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Tomate Triturado 400g', 0.9);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Tomate Triturado 400g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.7
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Mantequilla 250g', 1.6);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Mantequilla 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Sal Fina 1kg', 0.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Sal Fina 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.0
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.15
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Refresco Cola 2L', 1.3);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Refresco Cola 2L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.3
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('033', 'Laura García', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '033'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010016, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-26',
    '10:34',
    23.25,
    4.88,
    28.13,
    'TARJETA', 
    '819358'
);
SET @TicketID = 20010016; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 6.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    4.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Mantequilla 250g', 1.6);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Mantequilla 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    3.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pimiento Rojo (kg)', 2.4);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pimiento Rojo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    2.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pan Baguette 250g', 0.7);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pan Baguette 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    3.45
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('011', 'Carlos Ruiz', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '011'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010017, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-27',
    '18:14',
    23.73,
    4.98,
    28.71,
    'TARJETA', 
    '199052'
);
SET @TicketID = 20010017; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Banana (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Banana (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    500, 
    0.88
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2500, 
    2.75
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pimiento Rojo (kg)', 2.4);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pimiento Rojo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    2.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Tomate Triturado 400g', 0.9);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Tomate Triturado 400g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.9
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    11.4
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('028', 'Ana Fernández', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '028'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010018, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-28',
    '14:51',
    47.60,
    10.00,
    57.60,
    'TARJETA', 
    '643300'
);
SET @TicketID = 20010018; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    19.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Yogur Natural 125g', 0.45);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Yogur Natural 125g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    0.9
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    3.8
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 0.01);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2500, 
    15.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Mantequilla 250g', 1.6);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Mantequilla 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    3.2
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('019', 'Sofía Martínez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '019'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010019, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-29',
    '10:47',
    36.52,
    7.67,
    44.19,
    'EFECTIVO', 
    NULL
);
SET @TicketID = 20010019; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    7.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Yogur Natural 125g', 0.45);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Yogur Natural 125g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    0.9
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Azúcar 1kg', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Azúcar 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    2.2
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.4
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Manzana Golden (kg)', 0.0);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Manzana Golden (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    500, 
    0.62
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Arroz Redondo 1kg', 1.15);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Arroz Redondo 1kg'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.15
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Cebolla (kg)', 1.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Cebolla (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    1.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Leche Entera 1L', 0.95);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Leche Entera 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.85
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Huevos Camperos 12u', 3.1);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Huevos Camperos 12u'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    9.3
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Queso Manchego 250g', 4.2);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Queso Manchego 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    8.4
);

COMMIT;

START TRANSACTION;
INSERT IGNORE INTO Sucursal (nombre, direccion, cif, telefono) VALUES ('SUPERMERCADOS EL AHORRO', '123', 'B12345678', '910123456');

SELECT id_sucursal INTO @SucursalID 
FROM Sucursal 
WHERE cif = 'B12345678'
LIMIT 1;

INSERT IGNORE INTO Empleados (id_empleado, nombre, cargo, id_sucursal)
VALUES ('042', 'Diego Gómez', 'Cajero/a', @SucursalID);


SELECT id_empleado INTO @EmpleadoID 
FROM Empleados 
WHERE id_empleado = '042'
LIMIT 1;


INSERT INTO tickets (id_ticket, id_empleado, id_sucursal, fecha, hora, subtotal, iva_total, total_pagar, tipo_pago, autorizacion)
VALUES (
    20010020, 
    @EmpleadoID, 
    @SucursalID, 
    '2025-09-30',
    '12:55',
    38.00,
    7.98,
    45.98,
    'EFECTIVO', 
    NULL
);
SET @TicketID = 20010020; 


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pechuga de Pollo (kg)', 0.01);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pechuga de Pollo (kg)'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2500, 
    15.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Aceite de Oliva 1L', 6.5);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Aceite de Oliva 1L'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    6.5
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Pan Baguette 250g', 0.7);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Pan Baguette 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    2.1
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Galletas María 200g', 0.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Galletas María 200g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    2, 
    1.6
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Tomate Triturado 400g', 0.9);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Tomate Triturado 400g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    1, 
    0.9
);


INSERT IGNORE INTO Productos (descripcion, precio_unitario)
VALUES ('Café Molido 250g', 3.8);


SELECT id_producto INTO @ProductoID 
FROM Productos 
WHERE descripcion = 'Café Molido 250g'
LIMIT 1;


INSERT INTO ticket_Linea (id_ticket, id_producto, cantidad, precio_total)
VALUES (
    @TicketID, 
    @ProductoID, 
    3, 
    11.4
);

COMMIT;

