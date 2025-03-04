
-- si existe la bd la eleiminamos

-- creamos la BD

DROP DATABASE IF  EXISTS MINISTERIOPUBLICO_GLOGISTICA;

CREATE DATABASE IF NOT EXISTS  MINISTERIOPUBLICO_GLOGISTICA;
USE MINISTERIOPUBLICO_GLOGISTICA;


-- creamos la tablas
CREATE TABLE IF NOT EXISTS Proveedor 
(
		id_proveedor int auto_increment not null,
        razon_social nvarchar(50) unique not null,
        nombe_comercial nvarchar(60) not null,
		numero_ruc nvarchar(15) unique not null,
		email varchar(50) unique null,
		direccion varchar(100) null,
        departamento varchar(35)not null,
        tel�fono varchar(15) not null,
        constraint  primary key(id_proveedor)
) ENGINE = InnoDB;

INSERT INTO proveedor (razon_social,nombe_comercial,numero_ruc,email,direccion,departamento,tel�fono)
VALUES
('Compunet S.A.C','Compunet','12345678984','Compunet@gmail.com','los portales 2003 Cercado','Lima','125436588'),
('Distribuidora Maderas Perunas S.A.C','Moubles Peruanos','12345678901','MoublesPeruanos@gmail.com','los Portales 221 Surco','Lima','125436577'),
('Constructora Andina S.A.C','Imuebles Andina','12345678955','ImueblesAndina@gmail.com','las Palmeras 1552 Miraflores','Lima','125436570'),
('San Mateo S.A.C','San Mateo','12345678200','SanMateo@gmail.com','Calle Ramirez 1524 Arequipa','Arequipa','125436542'),
('Samsung S.A.C','Samsung','35345678911','Samsung@gmail.com','Calle Ramirez 1524 San Isidro','Lima','125436500');

SELECT * FROM   proveedor;


CREATE TABLE IF NOT EXISTS OrdenCompra 
(
		id_orden_compra int auto_increment,
        nro_orden_compra char(10) unique not null,
        fechaOrden_compra date not null,
        fechaEntrega date not null,
		id_proveedor int not null,
        CondicionesPago varchar(25) not null,
        Embalaje char(15) null,
        Transporte char(20) null,
        ValorTotal_Orden float not null,
		constraint primary key (id_orden_compra),
        constraint FKProveedor_Ordencompra 
        foreign key(id_proveedor)
		references Proveedor(id_proveedor)
) ENGINE = InnoDB;


select * FROM ordencompra;

CREATE TABLE IF NOT EXISTS TipoBien
(
	   id_TipoBien int auto_increment,
       nombre varchar(100)  not null unique,
       constraint primary key (id_TipoBien)
) ENGINE = InnoDB;

INSERT INTO TipoBien (nombre)
VALUES ('Bien Inmuebles'),('Bien de consumo'),('Bien muebles'),('Bien Publicos'),('Bien Simples');

SELECT * FROM TipoBien;


CREATE TABLE IF NOT EXISTS Bien 
(
	   id_Bien int auto_increment not null,
	   id_TipoBien int not null,
       nombre varchar(100) null,
       descripcion varchar(256) null,
	   stock int not null,
       estado nvarchar(20) not null,
       constraint primary key (id_Bien),
	   constraint FKTipobienes_Bien
	   foreign key(id_TipoBien)
	   references TipoBien(id_TipoBien)
       
) ENGINE = InnoDB;

INSERT INTO Bien (id_TipoBien, nombre,descripcion, stock, estado)
VALUES('5','Laptops','Laptop HP 15.5" de 1TB,8RAM','50','Desaprobado'),
('5','Telefonos','Telefono xiaomi redmi 9a','15','Desaprobado'),
('2','Agua','Agua Mineral San Luis,botella x 5L','200','Aprobado'),
('5','Teclado','Teclado para Pc','20','Aprobado');


CREATE TABLE IF NOT EXISTS DetalleOrdenCompra 
(
		id_detalle_orden int auto_increment not null,
        id_orden_compra int not null,
        id_Bien int not null,
        cantidad int not null,
		precio_unitario float not null,
		valor_total float not null,
		constraint primary key (id_detalle_orden),
        constraint FKOrdencompraDetalleOC
        foreign key(id_orden_compra)
		references OrdenCompra(id_orden_compra),
        constraint FKBienesDetalleOC
        foreign key(id_Bien)
		references Bien(id_Bien)
) ENGINE = InnoDB;


SELECT * FROM DetalleOrdenCompra;



CREATE TABLE IF NOT EXISTS Cargo 
(
		id_Cargo int auto_increment,
		NombreCargo nvarchar(60) unique not null,
		 constraint primary key (id_Cargo)
) ENGINE = InnoDB;

INSERT INTO Cargo (NombreCargo)
VALUES ('Gerente de Compras'),
('Asitente Administrativo'),
('Sub Gerente de Abastecimiento'),
('Personal de Almacen'),
('Representante de la Oficina de TI'),
('Sub Gerente de Devoluci�n de Bienes'),
('Sub Gerente Administrativo');

SELECT * FROM Cargo;



CREATE TABLE IF NOT EXISTS Empleado 
(
		id_Empleado int auto_increment,
        id_cargo int not null,
		NomEmpleado nvarchar(50) not null,
		Apellidos nvarchar(60) not null,
		email nvarchar(30) null,
		Telefono nchar(15) null,
		fechaIngreso date not null,
		fechaCeses date null,
		constraint primary key (id_Empleado),
	    constraint FKCargoEmpleado
	    foreign key(id_cargo)
	    references Cargo(id_cargo)
) ENGINE = InnoDB;

INSERT INTO Empleado (id_cargo,NomEmpleado,Apellidos,email,Telefono,fechaIngreso,fechaCeses)
VALUES 
('1','Nelson','Criollo','ncriollo.minpub@gob.pe','988777666','2011-02-02',null),
('2','Franco','Chavez','fchavez.minpub@gob.pe','955444333','2014-05-05',null),
('3','Alfredo','Soto','asoto.minpub@gob.pe','999888777','2010-01-01',null),
('4','Jorge','Chavez','jchavez.minpub@gob.pe','966555444','2013-04-04',null),
('5','Edith','Flores','eflores.minpub@gob.pe','977666555','2012-03-03',null),
('6','Eduardo','Rojas','erojas.minpub@gob.pe','977666555','2012-03-03',null);


SELECT * FROM   Empleado;



CREATE TABLE IF NOT EXISTS Devolucion
(
		id_Devolucion int auto_increment,
        nro_ficha char(10) unique not null,
		fecha date not null,
		id_proveedor int not null,
		total_credito_adeudado float not null,
		nomRemitente varchar(40),
		constraint primary key (id_Devolucion),
	    constraint FKProveedorDevolucion
	    foreign key(id_proveedor)
	    references Proveedor(id_proveedor)
)ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS DetalleDevolucion 
(
		id_DetalleDevolucion int auto_increment,
        id_Devolucion int not null,
        nro_orden_compra char(10),
		id_Bien int not null,
		descripcion_del_da�o text not null,
		precioCompra float not null,
        cantidad int not null,
		credito_adeudado float not null,
		constraint primary key (id_DetalleDevolucion),
		constraint FKDevol_DetalleDevol
	    foreign key(id_Devolucion)
	    references Devolucion(id_Devolucion),
         constraint FKBienesDetalleDevol
        foreign key(id_Bien)
		references Bien(id_Bien)
) ENGINE = InnoDB;
   
   select * from detalledevolucion;


CREATE TABLE IF NOT EXISTS Carta_Devolucion 
(
		id_Carta int auto_increment,
        fecha_carta date null,
        id_Devolucion int not null,
        id_Empleado int not null,
		id_proveedor int not null,
		motivo_devolucion text null,
		constraint primary key (id_Carta),
        constraint FKDevol_CartaDevol
	    foreign key(id_Devolucion)
        references Devolucion(id_Devolucion),
        constraint FKEmpleadoCartaDevol
	    foreign key(id_Empleado)
	    references Empleado(id_Empleado),
        constraint FKProveedorCartaDevol
	    foreign key(id_proveedor)
	    references Proveedor(id_proveedor)
) ENGINE = InnoDB;

SELECT * FROM   Carta_Devolucion;


CREATE TABLE IF NOT EXISTS TipoMovimientosAlmacen 
(
id_TipoMovimiento int auto_increment,
nombreMovimiento  nvarchar(25) not null,
 constraint primary key (id_TipoMovimiento)
) ENGINE = InnoDB;

INSERT INTO TipoMovimientosAlmacen (nombreMovimiento)
VALUES
('Ingresos'),
('Salidas');

select * from TipoMovimientosAlmacen;



CREATE TABLE IF NOT EXISTS MovimientosAlmacen 
(
		id_codMovimiento int auto_increment,
		id_TipoMovimiento int not null,
        id_TipoBien int not null,
        id_Bien int not null,
		cantidad int not null,
        constraint primary key (id_codMovimiento),
        constraint FKTipoMovi_MovimientosAlmacen
	    foreign key(id_TipoMovimiento)
	    references TipoMovimientosAlmacen(id_TipoMovimiento),
        constraint FKTipobienesMovimientosAlmacen
		foreign key(id_TipoBien)
		references TipoBien(id_TipoBien),
        constraint FKBienesMovimientosAlmacen
	    foreign key(id_Bien)
	    references Bien(id_Bien)
) ENGINE = InnoDB;

select * from MovimientosAlmacen;


CREATE TABLE IF NOT EXISTS Usuario 
(
  cod_usuario int NOT NULL AUTO_INCREMENT,
  login_usuario varchar(15) DEFAULT NULL,
  password_usuario varchar(100) DEFAULT NULL,
  id_Empleado int NOT NULL,
  estado_usuario char(1) DEFAULT NULL,
		constraint primary key (cod_usuario),
	    constraint FKEmpleadoUsuario 
	    foreign key(id_Empleado)
	    references empleado(id_Empleado)
) ENGINE = InnoDB;

INSERT INTO Usuario (login_usuario,password_usuario,id_Empleado,estado_usuario)
VALUES
('Ncriollo',SHA('Ncriollo'),1,'1'),
('Fchavez',SHA('Fchavez'),2,'1'),
('Asoto',SHA('Asoto'),3,'1'),
('Jchavez',SHA('Jchavez'),4,'1'),
('Edith',SHA('Edith'),5,'1'),
('Eduardo',SHA('Eduardo'),6,'1');

select *  from Usuario;

CREATE TABLE IF NOT EXISTS Menu (
  cod_menu int NOT NULL AUTO_INCREMENT,
  des_mmenu varchar(55) DEFAULT NULL,
  icono_mmenu varchar(150) DEFAULT NULL,
  constraint primary key (cod_menu)
) ENGINE = InnoDB;

INSERT INTO  Menu (cod_menu,des_mmenu,icono_mmenu)
VALUES (1,'Mantenimiento','fas fa-boxes text-light me-3'),
	   (2,'Movimientos','fas fa-truck-loading text-light me-3'),
       (3,'Consultar','fas fa-dna text-light me-3'),
       (4,'Reporte','fas fa-barcode text-light me-3'),
       (5,'Nosotros','fas fa-users text-light me-3');

select *  from Menu;

CREATE TABLE IF NOT EXISTS Roles_UsuarioMenu (
  cod_Rol int NOT NULL AUTO_INCREMENT,
  des_Rol varchar(55) DEFAULT NULL,
  url_Rol varchar(500) DEFAULT NULL,
  cod_menu int NOT NULL,
  constraint primary key (cod_Rol),
  CONSTRAINT FKMenu_RolesUsuario FOREIGN KEY (cod_menu) REFERENCES Menu (cod_menu)
) ENGINE = InnoDB;

INSERT INTO Roles_UsuarioMenu (cod_Rol,des_Rol,url_Rol,cod_menu)
VALUES(1,'Bien','ServletBien?tipo=LISTAR',1),
(2,'Orden de Compra','ServletOrdenCompra?tipo=LISTAR',1),
(3,'Proveedores','ServletProveedor?tipo=LISTAR',1),
(4,'Devolucion de bienes','ServletDevolucionBien?tipo=LISTAR',1),
(5,'Inventario de Bienes','ServletMovimientoAlmacen?tipo=LISTAR',2),
(6,'Consultar Bienes','ServletBien?tipo=CONSULTAR',3),
(7,'Consultar Orden de Compra','ServletOrdenCompra?tipo=LISTAR',3),
(8,'Reporte de Orden de Compra','Reporte_Orden_de_Compra.jsp',4),
(9,'Reporte de Devolucion de bienes','Reporte_de_Devolucion.jsp',4),
(10,'Reporte de Bienes','Reporte_de_Bienes.jsp',4),
(11,'Reporte de Proveedores','Reporte_de_Proveedores.jsp',4),
(12,'Mantener Acceso','ServletAcceso?tipo=LISTAR',1),
(13,'Qi�nes Somos','quienes_somos.jsp',5);

select * from Roles_UsuarioMenu;

CREATE TABLE IF NOT EXISTS Acceso (
  id_acceso int NOT NULL AUTO_INCREMENT,
  cod_menu int NOT NULL,
  cod_usuario int NOT NULL,
  cod_Rol int NOT NULL,
 constraint primary key (id_acceso),
  CONSTRAINT FKMenu_Acceso FOREIGN KEY (cod_menu) REFERENCES Menu (cod_menu),
  CONSTRAINT FKUsuario_Acceso FOREIGN KEY (cod_usuario) REFERENCES Usuario (cod_usuario),
  CONSTRAINT FKRolesUsuarioMenu_Acceso FOREIGN KEY (cod_Rol) REFERENCES Roles_UsuarioMenu (cod_Rol)
) ENGINE = InnoDB;

INSERT INTO Acceso (cod_menu,cod_usuario,cod_Rol)
VALUES (1,1,1),(1,1,2),(1,1,3),(1,1,4),(2,1,5),(3,1,6),(3,1,7),(4,1,8),(4,1,9),(4,1,10),(4,1,11),(1,1,12),(4,1,13),
	   (1,2,1),(1,2,2),(1,2,3),(1,2,4),(2,2,5),(3,2,6),(3,2,7),(4,2,8),(4,2,9),(4,2,10),(4,2,11),(5,2,13),
       (1,3,1),(1,3,2),(1,3,3),(1,3,4),(2,3,5),(3,3,6),(3,3,7),(4,3,8),(4,3,9),(4,3,10),(4,3,11),(5,3,13),
       (1,4,1),(1,4,2),(1,4,3),(1,4,4),(2,4,5),(3,4,6),(3,4,7),(4,4,8),(4,4,9),(4,4,10),(4,4,11),(5,4,13),
       (1,5,1),(1,5,2),(1,5,3),(1,5,4),(2,5,5),(3,5,6),(3,5,7),(4,5,8),(4,5,9),(4,5,10),(4,5,11),(5,5,13),
       (1,6,1),(1,6,2),(1,6,3),(1,6,4),(2,6,5),(3,6,6),(3,6,7),(4,6,8),(4,6,9),(4,6,10),(4,6,11),(5,6,13);

select *  from Acceso;



show tables;
show databases;


