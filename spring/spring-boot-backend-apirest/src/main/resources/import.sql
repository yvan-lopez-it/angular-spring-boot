-- Populate tabla clientes
INSERT INTO regiones(id, nombre) VALUES (1,'Sudamérica');
INSERT INTO regiones(id, nombre) VALUES (2,'Centroamérica');
INSERT INTO regiones(id, nombre) VALUES (3,'Norteamérica');
INSERT INTO regiones(id, nombre) VALUES (4,'Europa');
INSERT INTO regiones(id, nombre) VALUES (5,'Asia');
INSERT INTO regiones(id, nombre) VALUES (6,'África');
INSERT INTO regiones(id, nombre) VALUES (7,'Oceanía');
INSERT INTO regiones(id, nombre) VALUES (8,'Antártida');

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
INSERT INTO usuarios(username, password, enabled) VALUES('yvan', '$2a$10$D.fuTL1dmViVstbWlHEnQeMzQZucVscPE9NXth37UPVXggELRZr8e', 1)
INSERT INTO usuarios(username, password, enabled) VALUES('admin', '$2a$10$X9SGazzekxK5VIwz4GefWOHivnPeSL/HXjcnKeEeFMz5l61vyV4Ha', 1)

INSERT INTO roles(nombre) VALUES('ROLE_USER')
INSERT INTO roles(nombre) VALUES('ROLE_ADMIN')

INSERT INTO usuarios_roles(usuario_id, role_id) VALUES(1, 1);
INSERT INTO usuarios_roles(usuario_id, role_id) VALUES(2, 2);
INSERT INTO usuarios_roles(usuario_id, role_id) VALUES(2, 1);
