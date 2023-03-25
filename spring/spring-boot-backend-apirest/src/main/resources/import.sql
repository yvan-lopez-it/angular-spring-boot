-- Populate tabla clientes
INSERT INTO regiones(id, nombre) VALUES (1,'Sudamerica');
INSERT INTO regiones(id, nombre) VALUES (2,'Centroamerica');
INSERT INTO regiones(id, nombre) VALUES (3,'Norteamerica');
INSERT INTO regiones(id, nombre) VALUES (4,'Europa');
INSERT INTO regiones(id, nombre) VALUES (5,'Asia');
INSERT INTO regiones(id, nombre) VALUES (6,'Africa');
INSERT INTO regiones(id, nombre) VALUES (7,'Oceania');
INSERT INTO regiones(id, nombre) VALUES (8,'AntArtida');

INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(1, 'Yvan', 'Lopez', 'yvan@mail.com', '2023-01-19');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(2, 'Benjamin', 'Rivera', 'benjamin@mail.com', '2022-01-19');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(3, 'Maritza', 'Tiburcio', 'maritza@mail.com', '2021-11-20');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(4, 'Fausto', 'De La Cruz', 'fausto@mail.com', '2020-10-18');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(5, 'Eber', 'Ruiz', 'eber@mail.com', '2019-09-17');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(6, 'Maria', 'Rivera', 'maria@mail.com', '2018-08-16');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(7, 'Silvana', 'Banana', 'silvana@mail.com', '2017-07-15');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(8, 'Eva', 'Constancia', 'eva@mail.com', '2016-06-14');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(1,'Segundo', 'Cerna', 'segundo@mail.com', '2015-05-13');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(2,'Ricardo', 'Oviedo', 'ricardo@mail.com', '2014-04-12');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(4,'Jose', 'Guanilo', 'jose@mail.com', '2013-03-11');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(3,'Luis', 'Carrasco', 'luis@mail.com', '2012-02-10');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(5,'Roberto', 'Gomez', 'user1@mail.com', '2007-01-19');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(6,'Mery', 'Xmas', 'user2@mail.com', '2006-01-19');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(7,'Raul', 'Romero', 'user3@mail.com', '2005-11-20');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(8,'Edinson', 'Flores', 'user4@mail.com', '2006-10-18');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(1,'Malena', 'Diaz', 'user5@mail.com', '2004-09-17');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(2,'Eva', 'Longoria', 'user6@mail.com', '2003-08-16');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(3,'Antonia', 'Nieves', 'user7@mail.com', '2008-07-15');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(4,'Glicerio', 'Tamayo', 'user8@mail.com', '2001-06-14');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(5,'Manuel', 'Bell', 'user9@mail.com', '1982-05-13');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(6,'Cesar', 'Lomas', 'user10@mail.com', '1985-04-12');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(7,'Sergio', 'Ramirez', 'user11@mail.com', '1952-03-11');
INSERT INTO clientes(region_id, nombre, apellido, email, created_at) VALUES(8,'Leoncio', 'Villa', 'user12@mail.com', '1981-02-10');

-- Creamos algunos usuarios con sus roles
INSERT INTO usuarios(username, password, enabled, nombre, apellido, email) VALUES('admin', '$2a$10$D.fuTL1dmViVstbWlHEnQeMzQZucVscPE9NXth37UPVXggELRZr8e', 1, 'Yvan', 'Lopez', 'yvancho@mail.com')
INSERT INTO usuarios(username, password, enabled, nombre, apellido, email) VALUES('user', '$2a$10$X9SGazzekxK5VIwz4GefWOHivnPeSL/HXjcnKeEeFMz5l61vyV4Ha', 1, 'Benjamin', 'Lopez', 'benji@mail.com')

INSERT INTO roles(nombre) VALUES('ROLE_ADMIN')
INSERT INTO roles(nombre) VALUES('ROLE_USER')

INSERT INTO usuarios_roles(usuario_id, role_id) VALUES(1, 1);
INSERT INTO usuarios_roles(usuario_id, role_id) VALUES(1, 2);
INSERT INTO usuarios_roles(usuario_id, role_id) VALUES(2, 2);

-- Populate tabla productos
insert into productos (nombre, precio, created_at) values ('Container - Hngd Cll Blk 7x7x3', 18.04, NOW());
insert into productos (nombre, precio, created_at) values ('Beer - Pilsner Urquell', 84.21, NOW());
insert into productos (nombre, precio, created_at) values ('Shrimp - 16/20, Peeled Deviened', 74.27, NOW());
insert into productos (nombre, precio, created_at) values ('Sobe - Berry Energy', 25.74, NOW());
insert into productos (nombre, precio, created_at) values ('Tomatoes - Yellow Hot House', 57.26, NOW());
insert into productos (nombre, precio, created_at) values ('Juice - Lagoon Mango', 63.89, NOW());
insert into productos (nombre, precio, created_at) values ('Chicken - Whole Fryers', 24.9, NOW());
insert into productos (nombre, precio, created_at) values ('Tart Shells - Sweet, 2', 95.63, NOW());
insert into productos (nombre, precio, created_at) values ('Pork - Liver', 21.18, NOW());
insert into productos (nombre, precio, created_at) values ('Food Colouring - Pink', 4.54, NOW());

-- Creamos algunas facturas
INSERT INTO facturas (descripcion, observacion, cliente_id, created_at) VALUES('Factura lista mercado', null, 1, NOW());
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(1,1,1);
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(2,1,4);
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(1,1,5);
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(1,1,7);

INSERT INTO facturas (descripcion, observacion, cliente_id, created_at) VALUES('Factura una compra', 'Alguna nota importante!', 1, NOW());
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(3,2,6);