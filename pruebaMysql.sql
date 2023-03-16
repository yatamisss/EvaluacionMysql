CREATE SCHEMA minimarket;

USE minimarket;

CREATE TABLE Comprador (
comprador_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(25),
direccion VARCHAR(50),
correo VARCHAR(40), 
medioPago VARCHAR(20)
);

CREATE TABLE Productoo (
productoo_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(25),
precio DOUBLE,
venta_id INTEGER,
proveedorr_id INTEGER
);

CREATE TABLE TipoProducto (
tipoProducto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
categoria VARCHAR(30)
);

CREATE TABLE Venta (
venta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
cantidadVenta INTEGER,
fechaVenta DATE,
productoo_id INTEGER
);

CREATE TABLE Proveedorr (
proveedorr_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(25),
rol VARCHAR(25),
contacto INTEGER,
fechaVisita DATE
 );
 
CREATE TABLE Boletaa (
boletaa_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
numeroBoleta VARCHAR(25),
Fecha DATE,
total DOUBLE,
comprador_id INTEGER
);

CREATE TABLE ProductooProveedorr (
productoProveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
productoo_id INTEGER,
proveedorr_id INTEGER,
FOREIGN KEY (productoo_id) REFERENCES Productoo(productoo_id),
FOREIGN KEY (proveedorr_id) REFERENCES Proveedorr(proveedorr_id)
);


INSERT INTO Productoo (nombre, precio, venta_id, proveedorr_id) VALUES ("mayonesa", "1234","1", "3");
INSERT INTO Productoo (nombre, precio, venta_id, proveedorr_id) VALUES ("mantequilla", "1500","2", "1");
INSERT INTO Productoo (nombre, precio, venta_id, proveedorr_id) VALUES ("leche", "990","4", "1");
INSERT INTO Productoo (nombre, precio, venta_id, proveedorr_id) VALUES ("cafe", "1600","5", "2");
INSERT INTO Productoo (nombre, precio, venta_id, proveedorr_id) VALUES ("azucar", "1300","3", "6");

INSERT INTO TipoProducto (categoria) VALUES ("congelados");
INSERT INTO TipoProducto (categoria) VALUES ("electronica");
INSERT INTO TipoProducto (categoria) VALUES ("higiene");
INSERT INTO TipoProducto (categoria) VALUES ("congelados");

INSERT INTO Comprador (nombre, direccion, correo, medioPago) VALUES ("juan rojas", "elradal33", "juanr@gmail.com", "efectivo");
INSERT INTO Comprador (nombre, direccion, correo, medioPago) VALUES ("Ana Parra", "siemoreviva3", "ana@gmail.com", "debito");

INSERT INTO Venta (cantidadVenta, fechaVenta, productoo_id) VALUES ("3", "2023-05-03", "1");
INSERT INTO Venta (cantidadVenta, fechaVenta, productoo_id) VALUES ("2", "2023-05-03", "2");
INSERT INTO Venta (cantidadVenta, fechaVenta, productoo_id) VALUES ("15", "2023-06-12", "5");

INSERT INTO Proveedorr (nombre, rol, contacto, fechaVisita) VALUES ("Lacteos el condado", "Lacteos", "956346574", "2023-04-12");
INSERT INTO Proveedorr (nombre, rol, contacto, fechaVisita) VALUES ("nescafe", "bienes de consumo", "964738292", "2023-04-22");
INSERT INTO Proveedorr (nombre, rol, contacto, fechaVisita) VALUES ("Rica mayo", "aderesos", "956483934", "2023-04-15");

INSERT INTO Boletaa (numeroBoleta, fecha, total, comprador_id) VALUES ("345", "2023-04-12", "15500", "1");
INSERT INTO Boletaa (numeroBoleta, fecha, total, comprador_id) VALUES ("345", "2023-05-06", "3300", "2");

# Generar dos consultas básicas obteniendo datos de tablas

#trae el nombre y el correo del comprador en donde su nombre inicie con A
SELECT nombre, correo FROM Comprador
WHERE nombre LIKE ('A%');

# trae todos los datos de proveedor donde el rol sea lacteos
SELECT * FROM Proveedorr
WHERE rol = 'Lacteos';

#Generar una consulta que una a lo menos 2 tablas (JOIN)

SELECT Productoo.nombre, Proveedorr.nombre
FROM Productoo JOIN Proveedorr ON Productoo.proveedorr_id = Proveedorr.proveedorr_id
WHERE productoo.productoo_id = 2 OR proveedorr.proveedorr_id = 1;

SELECT Productoo.nombre, Venta.cantidadVenta, Venta.fechaVenta
FROM Venta RIGHT JOIN Productoo ON Venta.productoo_id = Productoo.productoo_id;






