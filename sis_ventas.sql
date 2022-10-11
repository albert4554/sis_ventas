
drop database if exists sis_ventas;
create database sis_ventas;
use sis_ventas;

create table proveedor(
id_proveedor int unsigned auto_increment primary key,
nombre varchar(50) not null,
telefono varchar(25) not null,
direccion varchar(30) not null,
doc_identidad varchar(20) not null
);
create table cliente(
id_cliente int unsigned auto_increment primary key ,
nombre varchar(50) not null,
telefono varchar(25) not null,
direccion varchar(30) not null,
sexo     enum('H','M') not null,
doc_identidad varchar(20) not null
);

create table categoria(
id_categoria int unsigned auto_increment primary key,
nombre varchar(50) not null,
descripcion varchar(255) not null
);

create table venta(
id_venta int unsigned auto_increment primary key,
id_cliente int unsigned not null ,
fecha date not null,
monto_final decimal(20,3) not null,
descuento decimal(20,3) not null,
foreign key(id_cliente) references cliente(id_cliente)
);

create table producto(
id_producto int unsigned auto_increment primary key,
id_proveedor int unsigned not null,
id_categoria int unsigned not null,
nombre varchar(50),
precio decimal(20,3),
stock int not null,
foreign key(id_proveedor) references proveedor(id_proveedor),
foreign key(id_categoria) references categoria(id_categoria)
);


create table detalle_venta(
id_detalle int unsigned auto_increment primary key,
id_producto int unsigned not null,
id_venta int unsigned not null,
cantidad int not null,
foreign key(id_producto) references producto(id_producto),
foreign key(id_venta) references venta(id_venta)
);

INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (1,'albert','947228277','C/ Real del barrio alto','70385484');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (2,'diego','990901554','C/ Mercurio','70385485');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (3,'alfonso','947228296','C/ Marte','70385486');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (4,'santiago','963452148','C/ Estrella fugaz','70385487');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (5,'facundo','987532412','C/ Venus','70385488');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (6,'martin','986325451','C/ Júpiter','70385489');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (7,'gustavo','912345678','C/ Neptuno','70385490');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (8,'guillermo','932145678','C/ Saturno','70385491');
INSERT INTO proveedor (`id_proveedor`,`nombre`,`telefono`,`direccion`,`doc_identidad`) VALUES (9,'leo','974852163','C/ Urano','70385492');



INSERT INTO cliente (`id_cliente`,`nombre`,`telefono`,`direccion`,`sexo`,`doc_identidad`) VALUES (1,'Salvador','950254837','C/ Tajo','H','26902806M');
INSERT INTO cliente (`id_cliente`,`nombre`,`telefono`,`direccion`,`sexo`,`doc_identidad`) VALUES (2,'Juan','618253876','C/ Sierra de los Filabres','H','89542419S');
INSERT INTO cliente (`id_cliente`,`nombre`,`telefono`,`direccion`,`sexo`,`doc_identidad`) VALUES (3,'Zoe','618223876','C/ Sierra de Gádor','M','11105554G');
INSERT INTO cliente (`id_cliente`,`nombre`,`telefono`,`direccion`,`sexo`,`doc_identidad`) VALUES (4,'David','678516294','C/ Picos de Europa','H','38223286T');
INSERT INTO cliente (`id_cliente`,`nombre`,`telefono`,`direccion`,`sexo`,`doc_identidad`) VALUES (5,'Jose','628349590','C/ Quinto pino','H','04233869Y');
INSERT INTO cliente (`id_cliente`,`nombre`,`telefono`,`direccion`,`sexo`,`doc_identidad`) VALUES (6,'Cristina','669162534','C/ Cabo de Gata','M','79503962T');
INSERT INTO cliente (`id_cliente`,`nombre`,`telefono`,`direccion`,`sexo`,`doc_identidad`) VALUES (7,'Ramón','626351429','C/ Zapillo','H','82842571K');



INSERT INTO categoria (`id_categoria`,`nombre`,`descripcion`) VALUES (1,'Tecnologia','Celulares');
INSERT INTO categoria (`id_categoria`,`nombre`,`descripcion`) VALUES (2,'Tecnologia','Smartwatches');
INSERT INTO categoria (`id_categoria`,`nombre`,`descripcion`) VALUES (3,'Tecnologia','Videojuegos');
INSERT INTO categoria (`id_categoria`,`nombre`,`descripcion`) VALUES (4,'Tecnologia','Computadoras');
INSERT INTO categoria (`id_categoria`,`nombre`,`descripcion`) VALUES (5,'Electrohogar','Refrigeradoras');
INSERT INTO categoria (`id_categoria`,`nombre`,`descripcion`) VALUES (6,'Electrohogar','Lavado y planchado');
INSERT INTO categoria (`id_categoria`,`nombre`,`descripcion`) VALUES (7,'Electrohogar','Maquinas de cocer');
INSERT INTO categoria (`id_categoria`,`nombre`,`descripcion`) VALUES (8,'Muebles y organización','Comedor');


INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (1,2,'2022-10-08',300.000,10.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (2,1,'2022-10-09',200.000,5.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (3,3,'2022-10-10',450.000,15.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (4,4,'2022-10-11',410.000,15.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (5,5,'2022-10-12',1000.000,20.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (6,5,'2022-10-13',205.000,10.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (7,5,'2022-10-14',247.000,12.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (8,6,'2022-10-15',523.000,14.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (9,6,'2022-10-16',412.000,14.000);
INSERT INTO venta(`id_venta`,`id_cliente`,`fecha`,`monto_final`,`descuento`) VALUES (10,7,'2022-10-17',724.000,12.000);


INSERT INTO producto (`id_producto`,`id_proveedor`,`id_categoria`,`nombre`,`precio`,`stock`) VALUES (1,1,4,'iPhone 11 64GB',2299.000,10);
INSERT INTO producto (`id_producto`,`id_proveedor`,`id_categoria`,`nombre`,`precio`,`stock`) VALUES (2,1,5,'SMARTPHONE SAMSUNG GALAXY A13 6.6\'\' 4GB 64GB NEGRO',3000.000,10);
INSERT INTO producto (`id_producto`,`id_proveedor`,`id_categoria`,`nombre`,`precio`,`stock`) VALUES (3,5,7,'Cocina 6 hornillas CMP7620FX0 acero MABE',1249.000,15);
INSERT INTO producto (`id_producto`,`id_proveedor`,`id_categoria`,`nombre`,`precio`,`stock`) VALUES (4,6,5,'Cocina a Gas 30P 76GS NEG 5H',2999.000,10);
INSERT INTO producto (`id_producto`,`id_proveedor`,`id_categoria`,`nombre`,`precio`,`stock`) VALUES (5,6,5,'Cocina 20 4H Blanca Parrillas Enlozadas',629.000,14);



INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (1,1,1,2);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (2,1,2,3);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (3,2,3,4);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (4,2,4,5);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (5,2,5,1);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (6,3,6,2);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (7,3,7,3);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (8,3,8,7);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (9,5,9,1);
INSERT INTO detalle_venta (`id_detalle`,`id_producto`,`id_venta`,`cantidad`) VALUES (10,5,10,2);
