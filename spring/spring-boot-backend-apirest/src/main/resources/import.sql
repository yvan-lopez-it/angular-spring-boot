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

insert into productos (nombre, precio, created_at) values ('Lemonade - Mandarin, 591 Ml', 45.63, '2022-08-08');
insert into productos (nombre, precio, created_at) values ('Lettuce Romaine Chopped', 19.76, '2022-08-08');
insert into productos (nombre, precio, created_at) values ('Cheese - Brick With Onion', 33.77, '2023-03-13');
insert into productos (nombre, precio, created_at) values ('Lamb - Racks, Frenched', 54.38, '2022-04-24');
insert into productos (nombre, precio, created_at) values ('Apricots - Halves', 26.58, '2022-09-13');
insert into productos (nombre, precio, created_at) values ('Cheese - Victor Et Berthold', 35.85, '2022-08-10');
insert into productos (nombre, precio, created_at) values ('Doilies - 10, Paper', 50.42, '2023-03-11');
insert into productos (nombre, precio, created_at) values ('Rosemary - Primerba, Paste', 34.71, '2023-02-06');
insert into productos (nombre, precio, created_at) values ('Pepper - Yellow Bell', 69.68, '2022-06-28');
insert into productos (nombre, precio, created_at) values ('Soup Campbells - Italian Wedding', 14.36, '2023-01-11');
insert into productos (nombre, precio, created_at) values ('Bread - Rye', 83.23, '2023-02-05');
insert into productos (nombre, precio, created_at) values ('Sausage - Breakfast', 49.75, '2023-03-06');
insert into productos (nombre, precio, created_at) values ('Filo Dough', 98.85, '2022-09-22');
insert into productos (nombre, precio, created_at) values ('Beef - Salted', 53.82, '2022-05-20');
insert into productos (nombre, precio, created_at) values ('Turkey Leg With Drum And Thigh', 48.79, '2022-07-13');
insert into productos (nombre, precio, created_at) values ('Shrimp, Dried, Small / Lb', 47.3, '2022-04-02');
insert into productos (nombre, precio, created_at) values ('Coffee - Hazelnut Cream', 16.29, '2022-12-11');
insert into productos (nombre, precio, created_at) values ('Potatoes - Pei 10 Oz', 70.82, '2022-11-18');
insert into productos (nombre, precio, created_at) values ('Tea - Lemon Green Tea', 43.55, '2022-12-06');
insert into productos (nombre, precio, created_at) values ('Veal - Brisket, Provimi,bnls', 83.51, '2023-03-08');
insert into productos (nombre, precio, created_at) values ('Guinea Fowl', 37.58, '2022-12-12');
insert into productos (nombre, precio, created_at) values ('Pernod', 54.48, '2022-07-18');
insert into productos (nombre, precio, created_at) values ('Lemonade - Strawberry, 591 Ml', 13.41, '2022-08-15');
insert into productos (nombre, precio, created_at) values ('Lettuce - Lambs Mash', 53.9, '2023-03-10');
insert into productos (nombre, precio, created_at) values ('Wine - Manischewitz Concord', 44.24, '2022-08-02');
insert into productos (nombre, precio, created_at) values ('Apple - Northern Spy', 4.65, '2022-08-26');
insert into productos (nombre, precio, created_at) values ('Wine - Red, Wolf Blass, Yellow', 89.5, '2022-06-27');
insert into productos (nombre, precio, created_at) values ('Syrup - Chocolate', 88.9, '2022-07-03');
insert into productos (nombre, precio, created_at) values ('Tomatoes - Roma', 75.67, '2022-11-19');
insert into productos (nombre, precio, created_at) values ('Salt - Rock, Course', 95.42, '2023-01-27');
insert into productos (nombre, precio, created_at) values ('Veal - Inside', 83.98, '2023-01-04');
insert into productos (nombre, precio, created_at) values ('Venison - Striploin', 46.69, '2023-02-10');
insert into productos (nombre, precio, created_at) values ('Sauce - Rosee', 4.96, '2022-09-24');
insert into productos (nombre, precio, created_at) values ('Sambuca - Ramazzotti', 98.8, '2022-08-09');
insert into productos (nombre, precio, created_at) values ('Wine - Blue Nun Qualitatswein', 60.84, '2022-10-05');
insert into productos (nombre, precio, created_at) values ('Salmon - Whole, 4 - 6 Pounds', 31.92, '2023-03-15');
insert into productos (nombre, precio, created_at) values ('Fond - Chocolate', 75.35, '2022-07-31');
insert into productos (nombre, precio, created_at) values ('Pastry - Baked Cinnamon Stick', 38.33, '2023-01-21');
insert into productos (nombre, precio, created_at) values ('Bread Base - Toscano', 70.66, '2022-07-02');
insert into productos (nombre, precio, created_at) values ('Doilies - 8, Paper', 32.96, '2022-09-28');
insert into productos (nombre, precio, created_at) values ('Lamb - Loin, Trimmed, Boneless', 27.7, '2022-09-02');
insert into productos (nombre, precio, created_at) values ('Red Pepper Paste', 86.48, '2022-04-15');
insert into productos (nombre, precio, created_at) values ('Stock - Chicken, White', 42.07, '2022-06-20');
insert into productos (nombre, precio, created_at) values ('Bread Base - Gold Formel', 8.48, '2022-11-21');
insert into productos (nombre, precio, created_at) values ('Spice - Greek 1 Step', 61.94, '2022-08-04');
insert into productos (nombre, precio, created_at) values ('Cake - Night And Day Choclate', 94.94, '2022-12-27');
insert into productos (nombre, precio, created_at) values ('Rabbit - Whole', 45.61, '2022-07-25');
insert into productos (nombre, precio, created_at) values ('Sugar - Crumb', 19.0, '2023-01-22');
insert into productos (nombre, precio, created_at) values ('Cleaner - Bleach', 3.42, '2022-04-07');
insert into productos (nombre, precio, created_at) values ('Apple - Northern Spy', 57.11, '2022-04-16');
insert into productos (nombre, precio, created_at) values ('Flavouring - Orange', 24.43, '2022-04-28');
insert into productos (nombre, precio, created_at) values ('Filling - Mince Meat', 21.9, '2022-07-07');
insert into productos (nombre, precio, created_at) values ('Bandage - Flexible Neon', 4.25, '2022-09-24');
insert into productos (nombre, precio, created_at) values ('Cod - Salted, Boneless', 81.79, '2022-12-13');
insert into productos (nombre, precio, created_at) values ('Cod - Salted, Boneless', 11.66, '2023-02-21');
insert into productos (nombre, precio, created_at) values ('Salt - Sea', 3.97, '2022-11-16');
insert into productos (nombre, precio, created_at) values ('Yucca', 89.3, '2023-02-05');
insert into productos (nombre, precio, created_at) values ('Cranberries - Fresh', 50.29, '2023-03-07');
insert into productos (nombre, precio, created_at) values ('Hand Towel', 94.22, '2022-09-17');
insert into productos (nombre, precio, created_at) values ('Cumin - Ground', 82.86, '2022-04-22');
insert into productos (nombre, precio, created_at) values ('Puree - Strawberry', 70.26, '2022-10-10');
insert into productos (nombre, precio, created_at) values ('Sambuca - Opal Nera', 71.45, '2022-04-07');
insert into productos (nombre, precio, created_at) values ('Tea - Decaf Lipton', 75.05, '2022-11-22');
insert into productos (nombre, precio, created_at) values ('Sardines', 92.0, '2022-05-17');
insert into productos (nombre, precio, created_at) values ('Quail Eggs - Canned', 20.47, '2022-10-11');
insert into productos (nombre, precio, created_at) values ('Pasta - Fettuccine, Egg, Fresh', 86.49, '2022-10-26');
insert into productos (nombre, precio, created_at) values ('Sweet Pea Sprouts', 62.26, '2023-02-28');
insert into productos (nombre, precio, created_at) values ('Table Cloth 144x90 White', 68.99, '2023-01-07');
insert into productos (nombre, precio, created_at) values ('Steamers White', 89.7, '2022-09-13');
insert into productos (nombre, precio, created_at) values ('Duck - Fat', 44.6, '2022-08-27');
insert into productos (nombre, precio, created_at) values ('Rum - Spiced, Captain Morgan', 22.71, '2022-06-21');
insert into productos (nombre, precio, created_at) values ('Pasta - Bauletti, Chicken White', 22.02, '2022-07-20');
insert into productos (nombre, precio, created_at) values ('Veal - Heart', 16.26, '2023-02-02');
insert into productos (nombre, precio, created_at) values ('Muffin Hinge Container 6', 32.14, '2023-03-25');
insert into productos (nombre, precio, created_at) values ('Extract - Raspberry', 57.9, '2022-11-22');
insert into productos (nombre, precio, created_at) values ('Wine - Remy Pannier Rose', 50.19, '2022-06-29');
insert into productos (nombre, precio, created_at) values ('Seaweed Green Sheets', 43.37, '2023-02-03');
insert into productos (nombre, precio, created_at) values ('Dawn Professionl Pot And Pan', 25.85, '2022-03-30');
insert into productos (nombre, precio, created_at) values ('Arizona - Plum Green Tea', 69.47, '2022-11-26');
insert into productos (nombre, precio, created_at) values ('Coffee Swiss Choc Almond', 10.5, '2022-05-17');
insert into productos (nombre, precio, created_at) values ('Garbag Bags - Black', 66.5, '2022-06-01');
insert into productos (nombre, precio, created_at) values ('Wine - Sawmill Creek Autumn', 84.38, '2022-06-03');
insert into productos (nombre, precio, created_at) values ('Trout - Hot Smkd, Dbl Fillet', 1.82, '2022-10-02');
insert into productos (nombre, precio, created_at) values ('Pepper - White, Ground', 60.1, '2022-06-19');
insert into productos (nombre, precio, created_at) values ('Wine - White, Concha Y Toro', 93.47, '2022-11-06');
insert into productos (nombre, precio, created_at) values ('Eggs - Extra Large', 40.26, '2023-03-02');
insert into productos (nombre, precio, created_at) values ('Vinegar - Raspberry', 61.01, '2022-12-28');
insert into productos (nombre, precio, created_at) values ('White Baguette', 5.42, '2022-04-30');
insert into productos (nombre, precio, created_at) values ('Wine - White, Colubia Cresh', 87.24, '2022-11-08');
insert into productos (nombre, precio, created_at) values ('Puff Pastry - Slab', 21.48, '2023-03-02');
insert into productos (nombre, precio, created_at) values ('Duck - Whole', 80.0, '2022-12-12');
insert into productos (nombre, precio, created_at) values ('Bandage - Fexible 1x3', 85.39, '2022-11-06');
insert into productos (nombre, precio, created_at) values ('Shrimp - Baby, Warm Water', 27.58, '2023-02-27');
insert into productos (nombre, precio, created_at) values ('Green Tea Refresher', 26.33, '2023-02-03');
insert into productos (nombre, precio, created_at) values ('Bag Clear 10 Lb', 72.39, '2023-02-09');
insert into productos (nombre, precio, created_at) values ('Muffin - Blueberry Individual', 15.81, '2022-09-26');
insert into productos (nombre, precio, created_at) values ('Beer - Upper Canada Light', 52.5, '2022-04-14');
insert into productos (nombre, precio, created_at) values ('Pear - Halves', 66.78, '2022-09-01');
insert into productos (nombre, precio, created_at) values ('Beef - Ground, Extra Lean, Fresh', 68.95, '2022-07-05');
insert into productos (nombre, precio, created_at) values ('External Supplier', 24.59, '2022-12-02');

-- Creamos algunas facturas
INSERT INTO facturas (descripcion, observacion, cliente_id, created_at) VALUES('Factura lista mercado', null, 1, NOW());
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(1,1,1);
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(2,1,4);
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(1,1,5);
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(1,1,7);

INSERT INTO facturas (descripcion, observacion, cliente_id, created_at) VALUES('Factura una compra', 'Alguna nota importante!', 1, NOW());
INSERT INTO facturas_items (cantidad, factura_id, producto_id) VALUES(3,2,6);