create database teatro;
use teatro;

create table obra 
	(ref int auto_increment primary key not null,
	nombre text not null,
	grupo text not null,
	uri text not null,
	descripcion text not null,
	f_inicio date not null,
	f_final date not null)
	engine = innodb;

create table pase
	(fecha date not null,
	hora time not null,
	primary key (fecha,hora))
	engine = innodb;
	
create table seccion
	(codigo int primary key not null,
	precio float not null,
	descripcion varchar(20) not null)
	engine = innodb;

create table butaca
	(fila int not null,
	numero int not null,
	seccion int not null,
	primary key (fila,numero),
	foreign key seccion references seccion (codigo)
	on delete cascade on update cascade
	engine = innodb;

create table reserva
	(cod_reserva int auto_increment primary key not null,
	fecha date not null,
	hora time not null,
	fila int not null,
	numero int not null,
	seccion int not null,
	foreign key fecha references pase (fecha)
	on delete no action on update no action
	
	--faltan las claves foraneas