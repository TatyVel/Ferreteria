create database almacen;
use almacen;

create table menu(
id_menu int not null primary key auto_increment,
nombre_modulo varchar(500) not null,
url varchar(500) not null,
tipo int not null
);

create table roles(
id_rol int not null primary key auto_increment,
nombre_rol varchar(100) not null,
crear varchar(25) not null,
actualizar varchar(25) not null,
eliminar varchar(25) not null
);

create table rol_menu(
id_rol_menu int not null primary key auto_increment,
id_rol int not null,
id_menu int not null,
foreign key (id_rol) references roles(id_rol),
foreign key (id_menu) references menu(id_menu)
);

create table usuarios(
id_usuario int not null primary key auto_increment,
nombres varchar(150) not null,
apellidos varchar(150),
usuario varchar(150) not null,
clave varchar(150) not null,
recovery_pregunta varchar(150),
recovery_respuesta varchar(150),
id_rol int not null,
foreign key (id_rol) references roles(id_rol)
);


create table tipo_pieza(
	id_tipo int not null primary key auto_increment,
    tipo_pieza varchar(150) not null,
    descripcion varchar(250) not null
);

create table pieza(
	id_pieza int not null primary key auto_increment,
    tipo_pieza varchar(150) not null,
	modelo int not null,
	precio float not null,
	descripcion varchar(250) not null,
    cantidad int not null,
	id_tipo int not null,
    foreign key (id_tipo) references tipo_pieza(id_tipo)
);

create table almacen(
	id_almacen int not null primary key auto_increment,
    num_almacen int not null,
	descripcion varchar(250) not null,
	direccion varchar(250) not null,
	nombre_estanteria varchar(150) not null
);

create table movimientos(
	id_movimientos int not null primary key auto_increment,
	id_pieza int not null,
	id_almacen int not null,
	id_usuario int not null,
    foreign key (id_pieza) references pieza(id_pieza),
    foreign key (id_almacen) references almacen(id_almacen),
    foreign key (id_usuario) references usuarios(id_usuario) 
);

insert into roles values(1,'root','si','si','si');
insert into roles values(2,'admin','si','si','si');

insert into menu values(1,'Inicio','/principal?action=redireccionar',1);
insert into menu values(2,'Almacen','/almacen?action=getAllAlmacen',2);
insert into menu values(3,'Piezas','/pieza?action=seleccionar',3);
insert into menu values(4,'Tipos de piezas','/tipo?action=seleccionar',4);
insert into menu values(5,'Movimientos','/movimiento?action=view',5);
insert into menu values(6,'Usuarios','/usuarios?action=view',6);
insert into menu values(7,'Roles','/roles?action=view',7);

insert into rol_menu values(1,1,1);
insert into rol_menu values(2,1,2);
insert into rol_menu values(3,1,3);
insert into rol_menu values(4,1,4);
insert into rol_menu values(5,1,5);
insert into rol_menu values(6,1,6);
insert into rol_menu values(7,1,7);

insert into rol_menu values(8,2,1);
insert into rol_menu values(9,2,2);
insert into rol_menu values(10,2,3);
insert into rol_menu values(11,2,4);
insert into rol_menu values(12,2,5);
insert into rol_menu values(13,2,6);
insert into rol_menu values(14,2,7);

insert into usuarios values(1,'ROOT','','root','123','','',1);
insert into usuarios values(2,'admin','','admin','123','','',2);


