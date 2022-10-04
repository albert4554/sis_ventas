
drop database if exists sis_ventas;
create database sis_ventas character set uft8mb4;
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
