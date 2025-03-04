
USE MINISTERIOPUBLICO_GLOGISTICA;


-- ----------------------------------------------------------------------------------------------------------------------
--  -- MANTENIMIENTO  OC
--------------------------------------------------------------------------------------------------------------------------
/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LAS ORDENES DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_ORDENES_COMPRA()
BEGIN
SELECT OC.id_orden_compra,OC.nro_orden_compra,OC.fechaOrden_compra,OC.fechaEntrega,PV.razon_social,OC.CondicionesPago,OC.Embalaje,OC.Transporte,OC.ValorTotal_Orden
 FROM OrdenCompra OC JOIN proveedor PV
 ON OC.id_proveedor=PV.id_proveedor
 ORDER BY OC.id_orden_compra DESC;
END;

CALL SP_LISTAR_ORDENES_COMPRA();

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LAS ORDENES DE COMPRA POR CODIGO*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_ORDENES_COMPRA_COD(
_id_orden_compra INT
)
BEGIN
SELECT OC.id_orden_compra,OC.nro_orden_compra,OC.fechaOrden_compra,OC.fechaEntrega,PV.razon_social,OC.CondicionesPago,OC.Embalaje,OC.Transporte,OC.ValorTotal_Orden
 FROM OrdenCompra OC JOIN proveedor PV
 ON OC.id_proveedor=PV.id_proveedor
 WHERE OC.id_orden_compra=_id_orden_compra;
END;





/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR UNA ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_ORDEN_COMPRA(
		_id_orden_compra int,
         _nro_orden_compra char(10),
        _fechaOrden_compra date,
        _fechaEntrega date ,
		_id_proveedor int,
        _CondicionesPago varchar(25),
        _Embalaje char(15) ,
        _Transporte char(20) ,
        _ValorTotal_Orden float
)
BEGIN
INSERT INTO OrdenCompra 
VALUES (null,_nro_orden_compra,_fechaOrden_compra,_fechaEntrega,_id_proveedor,_CondicionesPago,_Embalaje,_Transporte,_ValorTotal_Orden);
END;

call SP_REGISTRAR_ORDEN_COMPRA(NULL,'OC-00001','2022-06-16','2022-07-17',1,'CONTADO','CON EMBAAJE','SI',1000.00);





/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR UNA ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_ORDEN_COMPRA(
		_id_orden_compra int,
		_nro_orden_compra char(10),
        _fechaOrden_compra date,
        _fechaEntrega date ,
		_id_proveedor int,
        _CondicionesPago varchar(25),
        _Embalaje char(15) ,
        _Transporte char(20) ,
        _ValorTotal_Orden float
)
BEGIN
UPDATE OrdenCompra 
SET fechaOrden_compra=_fechaOrden_compra,fechaEntrega=_fechaEntrega,id_proveedor=_id_proveedor,
CondicionesPago=_CondicionesPago,Embalaje=_Embalaje,Transporte=_Transporte,ValorTotal_Orden=_ValorTotal_Orden
WHERE id_orden_compra=_id_orden_compra and nro_orden_compra=_nro_orden_compra;
END;




/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR UNA ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_ORDEN_COMPRA(
		_id_orden_compra int
)
BEGIN
DELETE FROM OrdenCompra 
WHERE id_orden_compra=_id_orden_compra;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LOS CODIGOS DE LOS PROVEEDORES*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_PROVEEDORES_COD(
_razon_social nvarchar(50)
)
BEGIN
SELECT  *  FROM PROVEEDOR
 WHERE razon_social= _razon_social;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LOS PROVEEDORES*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_PROVEEDORES_NOM()
BEGIN
SELECT  razon_social FROM PROVEEDOR
 ORDER BY razon_social ASC;
END;


-- ----------------------------------------------------------------------------------------------------------------------
--  -- MANTENIMIENTO DETALLE OC
--------------------------------------------------------------------------------------------------------------------------



/*P.A. PARA LISTAR LOS PRODUCTOS*/
DELIMITER $$
CREATE PROCEDURE SP_BUSCAR_BIEN_COD(
_id_bienes INT 
)
BEGIN
SELECT  b.id_bienes,tb.nombre as 'tipo_bienes',b.nombre,b.precio_Compra,b.stock,b.descripcion  FROM bienes as b 
JOIN tipobienes as tb
ON b.id_bienes=tb.id_TipoBienes
WHERE b.id_bienes=_id_bienes;							
END;

/*P.A. PARA LISTAR LOS BIENES POR TIPO DE BIENES*/
DELIMITER $$
CREATE PROCEDURE SP_BUSCAR_BIEN_POR_TPOBIENES(
_id_TipoBienes INT 
)
BEGIN
SELECT  b.id_bienes,tb.nombre as 'tipo_bienes',b.nombre,b.precio_Compra,b.stock,b.descripcion  FROM bienes as b 
JOIN tipobienes as tb
ON b.id_bienes=tb.id_TipoBienes
WHERE b.id_TipoBienes=_id_TipoBienes;							
END;

/*P.A. PARA LISTAR LOS PRODUCTOS POR NOMBRE Y/O DESC DE BIENES*/
DELIMITER $$
CREATE PROCEDURE SP_BUSCAR_NOMRE_BIEN(
BUSCA VARCHAR(100)
)
BEGIN
SELECT  b.id_bienes,tb.nombre as 'tipo_bienes',b.nombre,b.precio_Compra,b.stock,b.descripcion  FROM bienes as b 
JOIN tipobienes as tb
ON b.id_bienes=tb.id_TipoBienes
WHERE b.id_TipoBienes LIKE CONCAT(BUSCA,'%') OR b.descripcion LIKE CONCAT(BUSCA,'%');	
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR UN DETALLE_ORDEN_COMPRA POR CODIGO DE ORDEN COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_DETALLE_ORDEN_COMPRA_COD(
	_id_orden_compra int
)
BEGIN
SELECT  * FROM  detalleordencompra 
WHERE  id_orden_compra=_id_orden_compra;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR UN DETALLE DE ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_DETALLE_OC(
		_id_detalle_orden  int,
        _id_orden_compra int,
        _id_Bien int,
        _cantidad int ,
		_precio_unitario float,
		_valor_total float
        
)
BEGIN
INSERT INTO detalleordencompra 
VALUES (null,_id_orden_compra,_id_Bien,_cantidad,_precio_unitario,_valor_total);
END;

CALL SP_REGISTRAR_DETALLE_OC(null,'1',1,40,25.00,500);





/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR N DETALLE DE ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_DETALLE_ORDEN_COMPRA(
		_id_detalle_orden int,
        _id_orden_compra int,
        _id_bienes int,
        _cantidad int ,
		_descripcion nvarchar(100),
		_precio_unitario float,
		_valor_Subtotal float
)
BEGIN
UPDATE detalleordencompra 
SET id_orden_compra=_id_orden_compra,id_bienes=_id_bienes,cantidad=_cantidad,descripcion=_descripcion,precio_unitario=_precio_unitario,valor_total=_valor_Subtotal
WHERE id_detalle_orden =_id_detalle_orden;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR UN DETALLEORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_DETALLE_ORDEN_COMPRA(
		_id_detalle_orden int
)
BEGIN
DELETE FROM  detalleordencompra 
WHERE id_detalle_orden =_id_detalle_orden;
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR EL MOTO TOTAL DE  UNA ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZA_TOTAL_ORDEN_COMPRA(
		_id_orden_compra int,
         _ValorTotal_Orden float
)
BEGIN
UPDATE OrdenCompra
SET ValorTotal_Orden = _ValorTotal_Orden
WHERE id_orden_compra =_id_orden_compra;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA GEMNERAR RERPTE DE UNA ORDEN DE COMPRA CON SU DETALLE*/
DELIMITER $$
CREATE PROCEDURE SP_REPORTE_ORDEN_COMPRA_DETALLE(
)
BEGIN
SELECT OC.nro_orden_compra as 'Nro_Orden',PV.razon_social as 'Proveedor',BN.id_bien,BN.nombre as 'Nom_Bienes',BN.descripcion,
DT.precio_unitario,DT.cantidad,DT.valor_total as 'Importe'
FROM   OrdenCompra as OC  
JOIN  detalleordencompra as DT
ON  OC.id_orden_compra=DT.id_orden_compra JOIN Bien as BN
ON DT.id_bien=BN.id_bien JOIN TipoBien as TP
ON BN.id_TipoBien=TP.id_TipoBien JOIN proveedor as PV
ON OC.id_proveedor=PV.id_proveedor
ORDER BY  OC.nro_orden_compra DESC;
END;



-- ----------------------------------------------------------------------------------------------------------------------------
-- Mantenimiento Bienes-
-- ------------------------------------------------------------------------------------------------------------------------------


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR NUEVOS BIENES*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_BIEN(
       _id_Bien int,
	   _id_TipoBien int,
       _nombre varchar(100),
        _descripcion varchar(256) ,
	   _stock int,
       _estado nvarchar(20)
)
BEGIN
INSERT INTO Bien
VALUES (_id_Bien,_id_TipoBien,_nombre,_descripcion,_stock,_estado);
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR BIENES*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_BIEN(
		_id_Bien int,
	   _id_TipoBien int,
       _nombre varchar(100),
        _descripcion varchar(256) ,
	   _stock int,
       _estado nvarchar(20)
)
BEGIN
UPDATE Bien 
SET id_TipoBien=_id_TipoBien,nombre=_nombre,descripcion=_descripcion,stock=_stock,estado=_estado
WHERE id_Bien=_id_Bien;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR BIENES*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_BIEN(
       _id_Bien int
)
BEGIN
DELETE FROM  Bien
WHERE id_Bien=_id_Bien;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR BIENES*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_BIEN(
)
BEGIN
SELECT B.id_Bien,B.nombre,B.descripcion,TP.nombre as 'Tipo_Bien',B.stock,B.estado FROM  Bien B JOIN TipoBien TP
ON B.id_TipoBien=TP.id_TipoBien
ORDER BY B.id_Bien DESC;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR BIEN POR CODIGO*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_BIEN_POR_COD(
 _id_Bien int
)
BEGIN
SELECT B.id_Bien,B.nombre,B.descripcion,TP.id_TipoBien,TP.nombre as 'Tipo_Bien',B.stock,B.estado FROM  Bien B JOIN TipoBien TP
ON B.id_TipoBien=TP.id_TipoBien
WHERE id_Bien =_id_Bien
ORDER BY B.id_Bien DESC;
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR BIENES MOSTRAR SOLO NOMBRES*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_TIPOBIEN(
)
BEGIN
SELECT  id_TipoBien,nombre FROM  TipoBien
ORDER BY nombre ASC;
END;


-- ------------------------------------------------------------------------------------------------------------------
-- Mantenimiento Movimientos de almac�n
-- --------------------------------------------------------------------------------------------------------------------

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR EL INRESOS Y SALIDAS DE ALMACEN*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_INGRESO_SALIDA_BIENES(
        _id_codMovimiento int,
		_id_TipoMovimiento int,
        _id_TipoBien int,
        _id_bien int,
		_cantidad int
)
BEGIN
INSERT INTO  MovimientosAlmacen VALUES (_id_codMovimiento,_id_TipoMovimiento,_id_TipoBien,_id_bien,_cantidad);
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR EL STOCK*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_STOCK_BIEN(
_id_TipoMovimiento INT,
_id_bien INT,
_cantidad INT

)
BEGIN
IF _id_TipoMovimiento  = 1 THEN
UPDATE Bien
SET stock = stock + _cantidad
WHERE id_Bien=_id_bien;
ELSE 
UPDATE Bien
SET stock = stock - _cantidad
WHERE id_Bien=_id_bien;
END IF;
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR INGRESO-SALIDA DE ALMACEN*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_INGRESO_SALIDA(
	    _id_codMovimiento int
)
BEGIN
DECLARE tipomovimiento, _cantidad, codBienes INT;
SET tipomovimiento=(SELECT m.id_TipoMovimiento FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);
SET _cantidad=(SELECT m.cantidad FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);

SET codBienes=(SELECT m.id_bien FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);

DELETE FROM  MovimientosAlmacen
WHERE id_codMovimiento=_id_codMovimiento;

IF tipomovimiento = 1 THEN
UPDATE Bien
SET stock = stock - _cantidad
WHERE id_bien=codBienes;
ELSE
UPDATE Bien
SET stock = stock + _cantidad
WHERE id_bien=codBienes;
END IF;
END;


/*P.A. PARA LISTAR BIENES CON ESTADO APROBADO*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_BIENES_ESTADO()
BEGIN
SELECT id_Bien,descripcion FROM Bien
WHERE estado = 'Aprobado'
ORDER BY descripcion asc;
END;




/*P.A. PARA LISTAR EL TIPO DE BIEN CON EL NOMBRE*/
DELIMITER $$
CREATE PROCEDURE SP_BUSCAR_TIPOBIEN_DESCRIPCIONBIEN(id_bien int)
BEGIN
SELECT TB.id_TipoBien,TB.nombre as 'nombre_Tipo_Bien' 
FROM Bien B JOIN TipoBien TB
ON B.id_TipoBien = TB.id_TipoBien
WHERE B.id_bien = id_bien;
END;


/*P.A. PARA EDITAR LOS MOVIMIENTOS DE ALMANCEN*/
DELIMITER $$
CREATE PROCEDURE SP_EDITAR_MOVIMIENTO_ALMACEN(_id_codMovimiento int)
BEGIN
SELECT * FROM MovimientosAlmacen
WHERE id_codMovimiento = _id_codMovimiento;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LOS TIPOS DE MOVIMIENTOS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_TIPO_MOVI_ALMACEN()
BEGIN
SELECT  * FROM TipoMovimientosAlmacen
ORDER BY nombreMovimiento ASC;
END;



/*P.A. PARA LISTAR INGRESO O SALIDA DE BIENES*/ 
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_INGRESO_SALIDA_BIENES()
BEGIN
SELECT 	M.id_codMovimiento,
	TPA.nombreMovimiento,
        TPV.nombre as 'Tipo_Bienes',
        B.descripcion as 'Nombre_Bien',
        M.cantidad
FROM MovimientosAlmacen as M
JOIN TipoMovimientosAlmacen as TPA ON M.id_TipoMovimiento=TPA.id_TipoMovimiento 
JOIN TipoBien as TPV ON M.id_TipoBien=TPV.id_TipoBien
JOIN Bien as B ON M.id_bien=B.id_bien
ORDER BY id_codMovimiento asc;
END;



-- ----------------------------------------------------------------------------------------------------------------------------
-- Mantenimiento Devoluciones-
-- ------------------------------------------------------------------------------------------------------------------------------
/*P.A. PARA GENERAR EL NUMERO DE BOLETA*/
DELIMITER $$
CREATE PROCEDURE SP_GENERAR_NUM_FICHA_DEVOLUCION()
BEGIN
  DECLARE NUEVONUMERO_DEV CHAR(10);
  IF NOT EXISTS(SELECT nro_ficha FROM Devolucion) THEN
	  SET NUEVONUMERO_DEV ='DEV-00001';
	ELSE
	 SET NUEVONUMERO_DEV = (SELECT concat('DEV-',
	Substring(
	 concat('00000',cast( Substring( max(nro_ficha),5) as unsigned )+1),
	 length(concat('00000',cast( Substring( max(nro_ficha),5) as unsigned )+1))-4))
     from Devolucion);
   END IF;
     SELECT NUEVONUMERO_DEV AS NRO_DEV;
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR LAS DE DEVOLUCIONES*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_DEVOLUCION(
		_id_devolucion int,
		_nro_ficha char(10),
        _fecha date,
		_id_proveedor int,
        _total_credito_adeudado float,
		_nomRemitente varchar(25)
)
BEGIN
INSERT INTO Devolucion 
VALUES (null,_nro_ficha,_fecha,_id_proveedor,_total_credito_adeudado,_nomRemitente);
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR LOS REGISTROS DE DEVOLUCION*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_DEVOLUCION(
		_id_devolucion int,
		_nro_ficha char(10),
        _fecha date,
		_id_proveedor int,
        _total_credito_adeudado float,
		_nomRemitente varchar(25)
)
BEGIN
UPDATE Devolucion 
SET  nro_ficha=_nro_ficha,fecha=_fecha,id_proveedor=_id_proveedor,total_credito_adeudado=_total_credito_adeudado,nomRemitente=_nomRemitente
WHERE id_devolucion=_id_devolucion;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR UN REGISTROS DE DEVOLUCION*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_DEVOLUCION(
	_id_devolucion int
)
BEGIN
DELETE FROM Devolucion 
WHERE id_Devolucion=_id_devolucion;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LAS DEVOLUCIONES*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_DEVOLUCION()
BEGIN
SELECT D.id_Devolucion,D.nro_ficha,D.fecha,PV.razon_social,D.total_credito_adeudado,D.nomRemitente
FROM Devolucion D JOIN proveedor PV
ON D.id_proveedor=PV.id_proveedor
ORDER BY D.id_Devolucion DESC;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LAS DEVOLUCIONES POR CODIGO*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_DEVOLUCION_COD(
_id_Devolucion int 
)
BEGIN
SELECT D.id_Devolucion,D.nro_ficha,D.fecha,PV.id_proveedor,PV.razon_social,D.total_credito_adeudado,D.nomRemitente
FROM Devolucion D JOIN proveedor PV
ON D.id_proveedor=PV.id_proveedor
WHERE id_Devolucion=_id_Devolucion;
END;


-- ----------------------------------------------------------------------------------------------------------------------------
-- Mantenimiento Detalle-Devoluciones-
-- ------------------------------------------------------------------------------------------------------------------------------

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR UN DETALLE DE DEVOLUCI�N*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_DETALLE_DEVOLUCION(
		_id_DetalleDevolucion int,
        _id_Devolucion int,
        _nro_orden_compra nvarchar(8),
       	_id_Bien int,
		_descripcion_del_da�o text,
		_precioCompra float,
        _cantidad int,
		_credito_adeudado float
)
BEGIN
INSERT INTO DetalleDevolucion 
VALUES( _id_DetalleDevolucion,_id_Devolucion,_nro_orden_compra,_id_Bien,_descripcion_del_da�o,_precioCompra,_cantidad,_credito_adeudado); 
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR UN DETALLE DE DEVOLUCI�N*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_DETALLE_DEVOLUCION(
		_id_DetalleDevolucion int,
        _id_Devolucion int,
        _nro_orden_compra nvarchar(8),
       	_id_Bien int,
		_descripcion_del_da�o text,
		_precioCompra float,
        _cantidad int,
		_credito_adeudado float
)
BEGIN
UPDATE  DetalleDevolucion 
SET  nro_orden_compra=_nro_orden_compra,id_Bien=_id_Bien,descripcion_del_da�o=_descripcion_del_da�o,precioCompra=_precioCompra,cantidad=_cantidad,credito_adeudado=_credito_adeudado
WHERE id_DetalleDevolucion=_id_DetalleDevolucion AND id_Devolucion=_id_Devolucion;
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR UN DETALLE DE DEVOLUCI�N*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_DETALLE_DEVOLUCION(
	_id_DetalleDevolucion int
)
BEGIN
DELETE FROM  DetalleDevolucion 
WHERE id_DetalleDevolucion=_id_DetalleDevolucion;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR EL MOTO TOTAL DE  UNA ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZA_TOTAL_CREDITO_ADEUDADO_DEVOLUCION(
		_nro_ficha char(10),
		_total_credito_adeudado float
)
BEGIN
UPDATE Devolucion
SET total_credito_adeudado = _total_credito_adeudado
WHERE nro_ficha =_nro_ficha;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR EL  DETALLE DE  DEVOL*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_DETALLE_DEVOLUCION_COD_DEVOLUCION(
_id_Devolucion int 
)
BEGIN
SELECT DTDV.id_DetalleDevolucion,DEV.id_Devolucion,DEV.nro_ficha,OC.nro_orden_compra,TP.nombre,B.id_Bien,B.descripcion,DTDV.descripcion_del_da�o,DTDV.precioCompra,DTDV.cantidad,DTDV.credito_adeudado
FROM DetalleDevolucion as DTDV JOIN Devolucion as DEV
ON DTDV.id_Devolucion=DEV.id_Devolucion JOIN  Bien as B 
ON DTDV.id_Bien=B.id_Bien join TipoBien Tp
ON TP.id_TipoBien=B.id_TipoBien join OrdenCompra OC
ON OC.nro_orden_compra=DTDV.nro_orden_compra
WHERE DTDV.id_Devolucion=_id_Devolucion;
END;


-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Mantenimiento proveedores
--------------------------------------------------------------------------------------------------------------------------------------


/*P.A. PARA REGISTRAR PROVEEDORES*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_PROVEEDORES(
_id_proveedor int,
_razon_social nvarchar(50),
_nombre_comercial nvarchar(60),
_numero_ruc nvarchar(15),
_email varchar(50),
_direccion varchar(100),
_departamento varchar(35),
_telefono varchar(15)
)
BEGIN
INSERT INTO Proveedor VALUES (_id_proveedor,_razon_social,_nombre_comercial,_numero_ruc,_email,_direccion,_departamento,_telefono);
END;


/*P.A. PARA ACTUALIZAR REGISTRO DE PROVEEDORES*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_PROVEEDORES(
		_id_proveedor int,
        _razon_social nvarchar(50),
        _nombe_comercial nvarchar(60),
		_numero_ruc nvarchar(15),
		_email varchar(50),
		_direccion varchar(100),
        _departamento varchar(35),
        _tel�fono varchar(15) 
)
BEGIN
UPDATE Proveedor 
SET razon_social=_razon_social,nombe_comercial=_nombe_comercial,numero_ruc=_numero_ruc,email=_email,direccion=_direccion,departamento=_departamento,tel�fono=_tel�fono
WHERE id_proveedor=_id_proveedor;
END;


/*P.A. PARA ELIMINAR REGISTRO DE PROVEEDORES*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_PROVEEDORES(
_id_proveedor int
)
BEGIN
DELETE FROM Proveedor WHERE id_proveedor=_id_proveedor;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR REGISTRO DE PROVEEDORES*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_PROVEEDORES()
BEGIN
SELECT * FROM Proveedor
ORDER BY id_proveedor DESC; 
END;




-- ----------------------------------------------------------------------------------------------------------------------
-- MANTENIMIENTO DE LA TABLA USUARIO
-- ----------------------------------------------------------------------------------------------------------------------
/*PROCEDIMIENTOS ALMACENADOS*/


/*P.A. PARA REGISTRAR UN USUARIO*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_USUARIO(
  V_cod_usuario int ,
  V_login_usuario varchar(15) ,
  V_password_usuario varchar(100) ,
  V_id_Empleado int,
  V_estado_usuario char(1)
)
BEGIN
INSERT INTO Usuario 
VALUES (V_cod_usuario,V_login_usuario,V_password_usuario,V_id_Empleado,V_estado_usuario);
END;


/*P.A. PARA REGISTRAR ACTUALIZAR UN USUARIO*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_USUARIO(
  V_cod_usuario int ,
  V_login_usuario varchar(15) ,
  V_password_usuario varchar(100) ,
  V_id_Empleado int,
  V_estado_usuario char(1)
)
BEGIN
UPDATE  Usuario 
SET  login_usuario=V_login_usuario, password_usuario=V_password_usuario, id_Empleado=V_id_Empleado, estado_usuario=V_estado_usuario
WHERE cod_usuario=V_cod_usuario;
END;


/*P.A. PARA REGISTRAR ELIMINAR UN USUARIO*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_USUARIO(
  V_cod_usuario int
)
BEGIN
DELETE  FROM Usuario 
WHERE cod_usuario=V_cod_usuario;
END;

/*P.A. PARA  LISTAR LOS USUARIOS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_USUARIOS()
BEGIN
SELECT * FROM Usuario;
END;

/*P.A. PARA  LISTAR USUARIO POR CODIGO*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_USUARIO_POR_CODIGO(
  V_cod_usuario int
  )
BEGIN
SELECT * FROM Usuario
WHERE cod_usuario=V_cod_usuario;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA VALIDAR INICIO DE SESSION*/
DELIMITER $$
CREATE PROCEDURE SP_INICIAR_SESSION(
  V_login_usuario varchar(15) ,
  V_password_usuario varchar(100)
  
)
BEGIN
SELECT  U.cod_usuario,U.login_usuario,E.NomEmpleado,E.Apellidos
FROM Usuario U
JOIN Empleado E
ON U.id_Empleado=E.id_Empleado
WHERE login_usuario=V_login_usuario and password_usuario =SHA(V_password_usuario);
END;

-- -------------------------------------------------------------------------------
-- MANTENIMIENTO DE LA TABLA ROLES DE USUARIO POR MENU
-- --------------------------------------------------------------------------------

/*P.A. PARA REGISTRAR UN ROL DEL USUARIO */
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_ROL_USUARIO_MENU(
  V_cod_Rol int ,
  V_des_Rol varchar(55) ,
  V_url_Rol varchar(500), 
  V_cod_menu int
)
BEGIN
INSERT INTO Roles_UsuarioMenu 
VALUES (V_cod_Rol, V_des_Rol, V_url_Rol,V_cod_menu);
END;


/*P.A. PARA ACTUALIZAR UN ROL DEL USUARIO */
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_ROL_USUARIO_MENU(
  V_cod_Rol int ,
  V_des_Rol varchar(55) ,
  V_url_Rol varchar(500), 
  V_cod_menu int
)
BEGIN
UPDATE Roles_UsuarioMenu 
SET des_Rol=V_des_Rol, url_Rol=V_url_Rol,cod_menu=V_cod_menu
WHERE cod_Rol=V_cod_Rol;
END;


/*P.A. PARA ELIMINAR UN ROL DE USUARIO */
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_ROL_USUARIO_MENU(
  V_cod_Rol int 
)
BEGIN
DELETE FROM Roles_UsuarioMenu 
WHERE cod_Rol=V_cod_Rol;
END;



/*P.A. PARA LISTAR LOS  MENUS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_ROLES(
V_cod_menu int
)
BEGIN
SELECT * FROM Roles_UsuarioMenu
WHERE cod_menu=V_cod_menu;
END;

/*P.A. PARA LISTAR LOS  ROLES POR USUARIO*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_ROLES_POR_USUARIO(
 V_cod_usuario int,
 V_cod_menu int
)
BEGIN
SELECT M.cod_menu,M.des_mmenu,R.cod_Rol,R.des_Rol,R.url_Rol 
FROM Acceso A
JOIN Roles_UsuarioMenu R
ON A.cod_Rol=R.cod_Rol JOIN Menu M
ON A.cod_menu=M.cod_menu
WHERE A.cod_usuario=V_cod_usuario AND R.cod_menu=V_cod_menu;
END;


-- -------------------------------------------------------------------------------
-- MANTENIMIENTO DE LA TABLA ACCESO
-- --------------------------------------------------------------------------------

/*P.A. PARA REGISTRAR UN ACCESO*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_ACCESO(
  V_id_acceso int,
  V_cod_menu int ,
  V_cod_usuario int,
  V_cod_Rol int
)
BEGIN
INSERT INTO Acceso 
VALUES (V_id_acceso,V_cod_menu, V_cod_usuario,V_cod_Rol);
END;


/*P.A. PARA ACTUALIZAR UN ACCESO*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_ACCESO(
  V_id_acceso int,
  V_cod_menu int ,
  V_cod_usuario int,
  V_cod_Rol int
)
BEGIN
UPDATE  Acceso 
SET   cod_menu=V_cod_menu,cod_usuario=V_cod_usuario,cod_Rol=V_cod_Rol
WHERE id_acceso=V_id_acceso;
END;


/*P.A. PARA ELIMINAR UN ACCESO*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_ACCESO(
V_id_acceso int
)
BEGIN
DELETE FROM  Acceso A 
WHERE A.id_acceso=V_id_acceso;
END;

/*P.A. PARA LISTAR TODOS LOS ACCESOS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_ACCESOS()
BEGIN
SELECT A.id_acceso,M.des_mmenu,U.login_usuario,R.des_Rol
FROM  Acceso A 
JOIN Menu M 
ON A.cod_menu=M.cod_menu JOIN Usuario U
ON A.cod_usuario=U.cod_usuario 
JOIN Roles_UsuarioMenu R
ON A.cod_Rol=R.cod_Rol; 
END;

/*P.A. PARA LISTAR LOS  MENUS*/
DELIMITER $$
CREATE PROCEDURE SP_EDITAR_ACCESO(
V_id_acceso int
)
BEGIN
SELECT A.id_acceso,A.cod_usuario,U.login_usuario,M.cod_menu,M.des_mmenu,R.cod_Rol,R.des_Rol
FROM  Acceso A 
JOIN Usuario U 
ON A.cod_usuario=U.cod_usuario JOIN MENU M
ON A.cod_menu=M.cod_menu JOIN Roles_UsuarioMenu R 
ON A.cod_Rol=R.cod_Rol
WHERE A.id_acceso=V_id_acceso;
END;


-- ------------------------------------------------------------------------------------------------
-- MANTENIMIENTO DE LA TABLA  MENU
-- -------------------------------------------------------------------------------------------------
/*P.A. PARA LISTAR LOS  MENU POR USUARIO*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_MENU_POR_USUARIO(
 V_cod_usuario int
)
BEGIN
SELECT M.cod_menu,M.des_mmenu,M.icono_mmenu
FROM Menu M
JOIN Acceso A
ON M.cod_menu=A.cod_menu
WHERE A.cod_usuario=V_cod_usuario
group by M.cod_menu;
END;

/*P.A. PARA LISTAR LOS  MENUS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_MENUS()
BEGIN
SELECT * FROM Menu;
END;