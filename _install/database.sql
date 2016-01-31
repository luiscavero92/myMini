/* Borramos la base de datos si existe */
drop database if exists myMini;
/* Creacion de la base de datos */
create database myMini character set utf8 collate utf8_general_ci;
/* Uso de la base de datos */
use myMini;


/* Tabla listado de usuarios */
create table usuario (
    id int(10) not null auto_increment,
    nombre varchar(50) not null,
    apellidos varchar(255) not null,
    email varchar(255) not null,
    passwd text not null,
    unique(email),
    primary key(id)
);

/* Insercion de datos en la tabla usuario */
/* Por si fuera necesario para la corrección del examen, la contraseña de ambos es Admin123 */
insert into usuario(nombre, apellidos, email, passwd) values ('Luis', 'Cavero', 'luiscavero@gmail.com', 'e64b78fc3bc91bcbc7dc232ba8ec59e0');
insert into usuario(nombre, apellidos, email, passwd) values ('root', 'admin', 'luilliangelux@gmail.com', 'e64b78fc3bc91bcbc7dc232ba8ec59e0');

/* Tabla listado de categorías */
create table categoria (
	id int(10) not null auto_increment,
	nombre varchar(255) not null,
    unique(nombre),
	primary key(id)
);
/* Insercion de datos en la tabla categoría */
insert into categoria(nombre) values ('Amigos');
insert into categoria(nombre) values ('Conocidos');
insert into categoria(nombre) values ('Familiares');
insert into categoria(nombre) values ('Otros');

/* Tabla listado de contactos */
create table contacto (
	id int(10) not null auto_increment,
	usuario int(10) not null,
	nombre varchar(50) not null,
    apellidos varchar(255) not null,
    telefono varchar(13) not null,
    email varchar(255) not null,
    direccion text not null,
    categoria int(10) not null,
    fecha_alta date not null,
    foreign key(usuario) references usuario(id),
    foreign key(categoria) references categoria(id),
    primary key(id)
);

/* Insercion de datos en la tabla contacto */
insert into contacto(usuario, nombre, apellidos, telefono, email, direccion, categoria, fecha_alta) values 
	(1, 'David', 'Valiente', '628394829', 'davidvaliente@gmail.com', 'C/ Vendaval s/n', 1, '2015-06-09');
insert into contacto(usuario, nombre, apellidos, telefono, email, direccion, categoria, fecha_alta) values 
    (1, 'Antonio', 'Cavero', '974930293', 'luiscav@gmail.com', 'C/ Tormentosa s/n', 1, '2016-02-10');
insert into contacto(usuario, nombre, apellidos, telefono, email, direccion, categoria, fecha_alta) values 
	(1, 'Paco', 'Guerrero', '+32 628393829', 'pacoguerrero@hotmail.es', 'C/ Aire s/n', 2, '2016-01-11');
insert into contacto(usuario, nombre, apellidos, telefono, email, direccion, categoria, fecha_alta) values 
    (2, 'Paquito', 'el Chocolatero', '+34 628433829', 'Paquito@hotmail.es', 'C/ Chocolate s/n', 1, '2016-01-11');
insert into contacto(usuario, nombre, apellidos, telefono, email, direccion, categoria, fecha_alta) values 
    (2, 'Freddy', 'Mercury', '+34 658468239', 'Fredy@hotmail.com', 'C/ Caramelo s/n', 1, '2013-04-10');