
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
        teléfono varchar(15) not null,
        constraint  primary key(id_proveedor)
) ENGINE = InnoDB;

INSERT INTO proveedor (razon_social,nombe_comercial,numero_ruc,email,direccion,departamento,teléfono)
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
        fechaOrden_compra date not null,
        fechaEntrega date not null,
		id_proveedor int not null,
        CondicionesPago nvarchar(25) not null,
        Embalaje nchar(15) null,
        Transporte nchar(20) null,
        ValorTotal_Orden float not null,
		constraint primary key (id_orden_compra),
        constraint FKProveedor_Ordencompra 
        foreign key(id_proveedor)
		references Proveedor(id_proveedor)
) ENGINE = InnoDB;


select * FROM ordencompra;

CREATE TABLE IF NOT EXISTS TipoBienes 
(
	   id_TipoBienes int auto_increment,
       nombre varchar(100)  not null unique,
       constraint primary key (id_TipoBienes)
) ENGINE = InnoDB;

INSERT INTO TipoBienes (nombre)
VALUES ('Bienes Inmuebles'),('Bienes de consumo'),('Bienes muebles'),('Bienes Publicos'),('Bienes Simples');

SELECT * FROM TipoBienes;



CREATE TABLE IF NOT EXISTS Bienes 
(
	   id_bienes int auto_increment,
	   id_TipoBienes int not null,
       nombre varchar(100) not null,
       precio_Compra float not null,
	   stock int not null,
       descripcion varchar(256) null,
       estado nvarchar(20) not null,
       constraint primary key (id_bienes),
	   constraint FKTipobienes_Bienes
	   foreign key(id_TipoBienes)
	   references TipoBienes(id_TipoBienes)
       
) ENGINE = InnoDB;

INSERT INTO Bienes (id_TipoBienes, nombre, precio_compra, stock, descripcion, estado)
VALUES('5','Laptops','5000.00','500','HP Laptop','Desaprobado'),
('5','Telefonos','6000.25','500','Telefono del gobierno','Desaprobado'),
('2','Agua','10000.90','200','Agua Mineral San Luis','Aprobado'),
('1','Teclado','25.00','2','Teclado Blue','Aprobado');

SELECT * FROM Bienes;



CREATE TABLE IF NOT EXISTS DetalleOrdenCompra 
(
		id_detalle_orden int auto_increment not null,
        id_orden_compra int not null,
        id_bienes int not null,
        cantidad int not null,
		descripcion nvarchar(100) not null,
		precio_unitario float not null,
		valor_total float not null,
		constraint primary key (id_detalle_orden),
        constraint FKOrdencompraDetalleOC
        foreign key(id_orden_compra)
		references OrdenCompra(id_orden_compra),
        constraint FKBienesDetalleOC
        foreign key(id_bienes)
		references Bienes(id_bienes)
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
('Sub Gerente de Devolución de Bienes'),
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



CREATE TABLE IF NOT EXISTS ControlCalidad 
(
		id_Controlcalidad int auto_increment,
		id_proveedor int null,
		fecha_control date null,
		Firm_jef_dep_logistica nvarchar(30) not null,
		Firm_jef_almacen nvarchar(30) not null,
		constraint primary key (id_Controlcalidad),
		constraint FKProveedorControlCalidad
		foreign key(id_proveedor)
		references Proveedor(id_proveedor)
) ENGINE = InnoDB;

SELECT * FROM   ControlCalidad;



CREATE TABLE IF NOT EXISTS DetalleControlCalidad 
(
		id_DetalleControlCalidad int auto_increment,
        id_Controlcalidad int not null,
		id_Empleado int not null,
		id_orden_compra int not null,
        id_bienes int not null,
		especificaciones_de_OC nvarchar(100) not null,
		cumple_especificaciones nchar(5) not null,
		Observaciones text not null,
		Estado nvarchar(20) not null,
		constraint primary key (id_DetalleControlCalidad),
	    constraint FKCtrlCalidad_DetalleCtrlCalidad
	    foreign key(id_Controlcalidad)
	    references ControlCalidad(id_Controlcalidad),
        constraint FKEmpleadoDetalleCtrlCalidad
	    foreign key(id_Empleado)
	    references Empleado(id_Empleado),
		constraint FKOrdenCompraDetalleCtrlCalidad
	    foreign key(id_orden_compra)
	    references OrdenCompra(id_orden_compra),
        constraint FKBienesDetalleCtrlCalidad
	    foreign key(id_bienes)
	    references Bienes(id_bienes)
) ENGINE = InnoDB;

SELECT * FROM   DetalleControlCalidad;



CREATE TABLE IF NOT EXISTS Devolucion
(
		id_Devolucion int auto_increment,
		fecha date not null,
		id_proveedor int not null,
		nomRemitente nvarchar(60) not null,
		total_credito_adeudado float not null,
		constraint primary key (id_Devolucion),
	    constraint FKProveedorDevolucion
	    foreign key(id_proveedor)
	    references Proveedor(id_proveedor)
)ENGINE = InnoDB;

select * from Devolucion;


CREATE TABLE IF NOT EXISTS DetalleDevolucion 
(
		id_DetalleDevolucion int auto_increment,
        id_Devolucion int not null,
		id_detalle_orden int not null,
		descripcion_del_bien nvarchar(100) null,
		descripcion_del_daño text not null,
        Factura_referecia nvarchar(25) null,
		precio float not null,
        cantidad int not null,
		credito_adeudado float not null,
		constraint primary key (id_DetalleDevolucion),
		constraint FKDevol_DetalleDevol
	    foreign key(id_Devolucion)
	    references Devolucion(id_Devolucion),
        constraint FKDetalleOrdenCompraDetalleDevol
	    foreign key(id_detalle_orden)
	    references DetalleOrdenCompra(id_detalle_orden)
) ENGINE = InnoDB;
   
   select * from detalledevolucion;
   


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
		id_tipoMovimiento int not null,
        id_TipoBienes int not null,
        id_bienes int not null,
		cantidad int not null,
		descripcion_del_bien nvarchar(100) not null,
        constraint primary key (id_codMovimiento),
        constraint FKTipoMovi_MovimientosAlmacen
	    foreign key(id_tipoMovimiento)
	    references TipoMovimientosAlmacen(id_TipoMovimiento),
        constraint FKTipobienesMovimientosAlmacen
		foreign key(id_TipoBienes)
		references TipoBienes(id_TipoBienes),
        constraint FKBienesMovimientosAlmacen
	    foreign key(id_bienes)
	    references Bienes(id_bienes)
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
       (5,'Nosotos','fas fa-users text-light me-3');

select *  from Menu;

CREATE TABLE IF NOT EXISTS Roles_UsuarioMenu (
  cod_Rol int NOT NULL AUTO_INCREMENT,
  des_Rol varchar(55) DEFAULT NULL,
  url_Rol varchar(500) DEFAULT NULL,
  cod_menu int NOT NULL,
  constraint primary key (cod_Rol),
  CONSTRAINT FKMenu_RolesUsuario FOREIGN KEY (cod_menu) REFERENCES Menu (cod_menu)
) ENGINE = InnoDB;

INSERT INTO  Roles_UsuarioMenu (cod_Rol,des_Rol,url_Rol,cod_menu)
VALUES  (1,'Bienes','ServletBienes?tipo=LISTAR',1),
		(2,'Orden de Compra','ServletOrdenCompra?tipo=LISTAR.jsp',1),
		(3,'Proveedores','ServletProveedor?tipo=LISTAR.jsp',1),
		(4,'Devolucion de bienes','ServletDevolucion?tipo=LISTAR.jsp',1),
		(5,'Carta de Devolución de Bienes','ServletCartaDevolucion?tipo=LISTAR',1),
		(6,'Inventario de Bienes','ServletInventarioBienes?tipo=LISTAR.jsp',2),
        (7,'Consultar Bienes','ServletBienes?tipo=LISTAR.jsp',3),
		(8,'Consultar Orden de Compra','ServletOrdenCompra?tipo=LISTAR.jsp',3),
		(9,'Reporte de Orden de Compra','ServletOrdenCompra?tipo=REPORTE.jsp',4),
		(10,'Reporte de Devolucion de bienes','ServletDevolucion?tipo=REPORTE.jsp',4),
		(11,'Reporte de Bienes','ServletBienes?tipo=REPORTE',4),
		(12,'Reporte de Inventario de Bienes','ServletInventarioBienes?tipo=REPORTE.jsp',4),
		(13,'Qiénes Somos','ServletNosotros?tipo=LISTAR.jsp',5);

select * from Roles_UsuarioMenu;

CREATE TABLE IF NOT EXISTS Acceso (
  cod_menu int NOT NULL,
  cod_usuario int NOT NULL,
  cod_Rol int NOT NULL,
 constraint primary key (cod_menu,cod_usuario,cod_Rol),
  CONSTRAINT FKMenu_Acceso FOREIGN KEY (cod_menu) REFERENCES Menu (cod_menu),
  CONSTRAINT FKUsuario_Acceso FOREIGN KEY (cod_usuario) REFERENCES Usuario (cod_usuario),
  CONSTRAINT FKRolesUsuarioMenu_Acceso FOREIGN KEY (cod_Rol) REFERENCES Roles_UsuarioMenu (cod_Rol)
) ENGINE = InnoDB;

INSERT INTO Acceso (cod_menu,cod_usuario,cod_Rol)
VALUES (1,1,1),(1,1,2),(1,1,3),(1,1,4),(1,1,5),(2,1,6),(3,1,7),(3,1,8),(4,1,9),(4,1,10),(4,1,11),(4,1,12),(5,1,13),
	   (1,2,1),(1,2,2),(1,2,3),(1,2,4),(1,2,5),(2,2,6),(3,2,7),(3,2,8),(4,2,9),(4,2,10),(4,2,11),(4,2,12),(5,2,13),
       (1,3,1),(1,3,2),(1,3,3),(1,3,4),(1,3,5),(2,3,6),(3,3,7),(3,3,8),(4,3,9),(4,3,10),(4,3,11),(4,3,12),(5,3,13),
       (1,4,1),(1,4,2),(1,4,3),(1,4,4),(1,4,5),(2,4,6),(3,4,7),(3,4,8),(4,4,9),(4,4,10),(4,4,11),(4,4,12),(5,4,13),
       (1,5,1),(1,5,2),(1,5,3),(1,5,4),(1,5,5),(2,5,6),(3,5,7),(3,5,8),(4,5,9),(4,5,10),(4,5,11),(4,5,12),(5,5,13),
       (1,6,1),(1,6,2),(1,6,3),(1,6,4),(1,6,5),(2,6,6),(3,6,7),(3,6,8),(4,6,9),(4,6,10),(4,6,11),(4,6,12),(5,6,13);

select *  from Acceso;