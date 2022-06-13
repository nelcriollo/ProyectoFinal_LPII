
USE MINISTERIOPUBLICO_GLOGISTICA;


-- ----------------------------------------------------------------------------------------------------------------------
--  -- MANTENIMIENTO  OC
--------------------------------------------------------------------------------------------------------------------------
/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LAS ORDENES DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_ORDENES_COMPRA()
BEGIN
SELECT OC.id_orden_compra,OC.fechaOrden_compra,OC.fechaEntrega,PV.razon_social,OC.CondicionesPago,OC.Embalaje,OC.Transporte,OC.ValorTotal_Orden
 FROM OrdenCompra OC JOIN proveedor PV
 ON OC.id_proveedor=PV.id_proveedor
 ORDER BY OC.id_orden_compra DESC;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LAS ORDENES DE COMPRA POR CODIGO*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_ORDENES_COMPRA_COD(
_id_orden_compra INT
)
BEGIN
SELECT OC.id_orden_compra,OC.fechaOrden_compra,OC.fechaEntrega,PV.razon_social,OC.CondicionesPago,OC.Embalaje,OC.Transporte,OC.ValorTotal_Orden
 FROM OrdenCompra OC JOIN proveedor PV
 ON OC.id_proveedor=PV.id_proveedor
 WHERE OC.id_orden_compra=_id_orden_compra;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LAS ORDENES DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_ORDEN_COMPRA()
BEGIN
SELECT * FROM OrdenCompra;
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR UNA ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_ORDEN_COMPRA(
		_id_orden_compra int,
        _fechaOrden_compra date,
        _fechaEntrega date ,
		_id_proveedor int,
        _CondicionesPago nvarchar(25),
        _Embalaje nchar(15) ,
        _Transporte nchar(20) ,
        _ValorTotal_Orden float
)
BEGIN
INSERT INTO OrdenCompra 
VALUES (_id_orden_compra,_fechaOrden_compra,_fechaEntrega,_id_proveedor,_CondicionesPago,_Embalaje,_Transporte,_ValorTotal_Orden);
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR UNA ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_ORDEN_COMPRA(
		_id_orden_compra int,
        _fechaOrden_compra date,
        _fechaEntrega date ,
		_id_proveedor int,
        _CondicionesPago nvarchar(25),
        _Embalaje nchar(15) ,
        _Transporte nchar(20) ,
        _ValorTotal_Orden float
)
BEGIN
UPDATE OrdenCompra 
SET fechaOrden_compra=_fechaOrden_compra,fechaEntrega=_fechaEntrega,id_proveedor=_id_proveedor,
CondicionesPago=_CondicionesPago,Embalaje=_Embalaje,Transporte=_Transporte,ValorTotal_Orden=_ValorTotal_Orden
WHERE id_orden_compra=_id_orden_compra;
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
CREATE PROCEDURE SP_LISTAR_BIEN()
BEGIN
SELECT  b.id_bienes,tb.nombre as 'tipo_bienes',b.nombre,b.precio_Compra,b.stock,b.descripcion  FROM bienes as b 
JOIN mpglogistica.tipobienes as tb
ON b.id_bienes=tb.id_TipoBienes;								
END;



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
        _id_bienes int,
        _cantidad int ,
		_descripcion nvarchar(100),
		_precio_unitario float,
		_valor_Subtotal float
)
BEGIN
INSERT INTO detalleordencompra 
VALUES (_id_detalle_orden,_id_orden_compra,_id_bienes,_cantidad,_descripcion,_precio_unitario,_valor_Subtotal);
END;



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
	_id_orden_compra int
)
BEGIN
SELECT OC.id_orden_compra as 'Nro_Orden',OC.fechaOrden_compra,OC.fechaEntrega,PV.razon_social as 'Proveedor',OC.CondicionesPago,OC.Embalaje,OC.Transporte,TP.nombre as 'Tipo_Bienes',BN.nombre as 'Nom_Bienes',BN.descripcion,
DT.precio_unitario,DT.cantidad,DT.valor_total as 'Importe',OC.ValorTotal_Orden as 'Total_Orden_Compra' FROM  detalleordencompra as DT JOIN  OrdenCompra as OC
ON  DT.id_orden_compra=OC.id_orden_compra JOIN Bienes as BN
ON DT.id_bienes=BN.id_bienes JOIN TipoBienes as TP
ON BN.id_TipoBienes=TP.id_TipoBienes JOIN proveedor as PV
ON OC.id_proveedor=PV.id_proveedor
WHERE  OC.id_orden_compra=_id_orden_compra;
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LOS CODIGOS DE LOS EMPLEADOS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_EMPLEADOS_COD(
_NomEmpleado nvarchar(50)
)
BEGIN
SELECT  id_Empleado,NomEmpleado FROM Empleado
 WHERE NomEmpleado = _NomEmpleado;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LOS NOMBRES DE LOS EMPLEADOS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_EMPLEADOS_NOM()
BEGIN
SELECT  NomEmpleado FROM Empleado;
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

CALL SP_LISTAR_TIPOBIENES_NOM();



-- ----------------------------------------------------------------------------------------------------------------------------
-- Mantenimiento Devoluciones-
-- ------------------------------------------------------------------------------------------------------------------------------

CALL SP_GENERAR_CODIGO_DEVOLUCION();

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR LOS REGISTROS DE DEVOLUCION*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_DEVOLUCION(
		_id_devolucion int,
        _fecha date,
		_id_proveedor int,
        _nomRemitente nvarchar(25),
        _total_credito_adeudado float
)
BEGIN
INSERT INTO Devolucion 
VALUES (_id_devolucion,_fecha,_id_proveedor,_nomRemitente,_total_credito_adeudado);
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR LOS REGISTROS DE DEVOLUCION*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_DEVOLUCION(
		_id_devolucion int,
        _fecha date,
		_id_proveedor int,
        _nomRemitente nvarchar(25),
        _total_credito_adeudado float
)
BEGIN
UPDATE Devolucion 
SET fecha=_fecha,id_proveedor=_id_proveedor,nomRemitente=_nomRemitente,total_credito_adeudado=_total_credito_adeudado
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
CREATE PROCEDURE SP_LISTAR_DEVOLUCIONES()
BEGIN
SELECT D.id_Devolucion,D.fecha,PV.razon_social,D.nomRemitente,D.total_credito_adeudado
FROM Devolucion D JOIN proveedor PV
ON D.id_proveedor=PV.id_proveedor
ORDER BY D.id_Devolucion DESC;
END;

-- ----------------------------------------------------------------------------------------------------------------------------
-- Mantenimiento Detalle-Devoluciones-
-- ------------------------------------------------------------------------------------------------------------------------------

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR UN DETALLE DE DEVOLUCIÓN*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_DETALLE_DEVOL(
		_id_DetalleDevolucion int,
        _id_Devolucion int,
		_id_detalle_orden int,
		_descripcion_del_bien nvarchar(100),
		_descripcion_del_daño text,
        _Factura_referecia nvarchar(25),
		_precio float,
        _cantidad int,
		_credito_adeudado float
)
BEGIN
INSERT INTO DetalleDevolucion 
VALUES( _id_DetalleDevolucion,_id_Devolucion,_id_detalle_orden,_descripcion_del_bien,_descripcion_del_daño,_Factura_referecia,_precio,_cantidad,_credito_adeudado); 
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR UN DETALLE DE DEVOLUCIÓN*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_DETALLE_DEVOL(
		_id_DetalleDevolucion int,
        _id_Devolucion int,
		_id_detalle_orden int,
		_descripcion_del_bien nvarchar(100),
		_descripcion_del_daño text,
        _Factura_referecia nvarchar(25),
		_precio float,
        _cantidad int,
		_credito_adeudado float
)
BEGIN
UPDATE  DetalleDevolucion 
SET  id_Devolucion=_id_Devolucion,id_detalle_orden=_id_detalle_orden,descripcion_del_bien=_descripcion_del_bien,descripcion_del_daño=_descripcion_del_daño,Factura_referecia=_Factura_referecia,precio=_precio,cantidad=_cantidad,credito_adeudado=_credito_adeudado
WHERE id_DetalleDevolucion=_id_DetalleDevolucion;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ELIMINAR UN DETALLE DE DEVOLUCIÓN*/
DELIMITER $$
CREATE PROCEDURE SP_ELIMINAR_DETALLE_DEVOL(
		_id_DetalleDevolucion int
)
BEGIN
DELETE FROM  DetalleDevolucion 
WHERE id_DetalleDevolucion=_id_DetalleDevolucion;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR EL MOTO TOTAL DE  UNA ORDEN DE COMPRA*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZA_TOTAL_DEVOLUCION(
		_id_Devolucion int,
        _credito_adeudado float
)
BEGIN
UPDATE Devolucion
SET total_credito_adeudado = _credito_adeudado
WHERE id_Devolucion =_id_Devolucion;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR EL  DETALLE DE  DEVOL*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_DETALLE_DEVOLUCION_COD_DEVOL(
_id_Devolucion INT 
)
BEGIN
SELECT DTDV.id_DetalleDevolucion,DTDV.id_Devolucion,DOC.id_detalle_orden,B.descripcion,DTDV.descripcion_del_daño,DTDV.Factura_referecia,B.precio_Compra,DTDV.cantidad,DTDV.credito_adeudado
FROM DetalleDevolucion as DTDV JOIN Devolucion as DEV
ON DTDV.id_Devolucion=DEV.id_Devolucion JOIN DetalleOrdenCompra as DOC
ON DTDV.id_detalle_orden=DOC.id_detalle_orden JOIN Bienes as B 
ON DOC.id_bienes=B.id_bienes
WHERE DTDV.id_Devolucion=_id_Devolucion;
END;

SELECT * FROM ordenCompra;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LLENAR DATOS DE LA DETALLE DEVOL*/
DELIMITER $$
CREATE PROCEDURE SP_BUSCAR_DATOS(
_id_orden_compra INT
)
BEGIN
SELECT DT.id_detalle_orden,OC.id_orden_compra,BN.descripcion,BN.precio_Compra
FROM  detalleordencompra as DT JOIN  OrdenCompra as OC
ON  DT.id_orden_compra=OC.id_orden_compra JOIN Bienes as BN
ON DT.id_bienes=BN.id_bienes
WHERE DT.id_orden_compra=_id_orden_compra;
END;

SELECT * FROM  detalleordencompra

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LLENAR DATOS DE LA DETALLE DEVOL*/
DELIMITER $$
CREATE PROCEDURE SP_LLENAR_DATOS()
BEGIN
SELECT DT.id_detalle_orden,DT.id_orden_compra,BN.descripcion,BN.precio_Compra
FROM  detalleordencompra as DT JOIN Bienes as BN
ON DT.id_bienes=BN.id_bienes;
END;

call SP_LLENAR_DATOS();


-- ------------------------------------------------------------------------------------------------------------------------------------
-- movimientos de almacen-
-- -------------------------------------------------------------------------------------------------------------------------------------

CALL SP_GENERAR_CODIGO_MOVIMIENTO();

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR INGRESO O SALIDA DE BIENES*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_INGRESO_SALIDA_BIENES()
BEGIN
SELECT M.id_codMovimiento,TPA.nombreMovimiento,TPV.nombre as 'Tipo_Bienes',M.id_bienes,M.cantidad,M.descripcion_del_bien FROM MovimientosAlmacen as M JOIN TipoMovimientosAlmacen as TPA 
ON M.id_TipoMovimiento=TPA.id_TipoMovimiento JOIN TipoBienes as TPV
ON M.id_TipoBienes=TPV.id_TipoBienes JOIN Bienes as B 
ON M.id_bienes=B.id_bienes; 
END;



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LOS CODIGOS DE LOS TIPOS DE BIENES*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_BIENES_COD(
_nombre varchar(100)
)
BEGIN
SELECT id_TipoBienes FROM TipoBienes
 WHERE nombre= _nombre;
END;


/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LOS TIPOS DE BIENES POR NOMBRE*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_BIENES_NOM()
BEGIN
SELECT  nombre FROM TipoBienes
ORDER BY nombre ASC;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA LISTAR LOS TIPOS DE MOVIMIENTOS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_TIPO_MOVI_ALMACEN()
BEGIN
SELECT  nombreMovimiento FROM TipoMovimientosAlmacen
ORDER BY nombreMovimiento ASC;
END;

CALL SP_LISTAR_TIPO_MOVI_ALMACEN();


/*PROCEDIMIENTOS ALMACENADOS/*
/*P.A. PARA LISTAR LOS CODIGOS DE LOS TIPOS DE MOVIMIENTOS*/
DELIMITER $$
CREATE PROCEDURE SP_LISTAR_TIPO_MOV_COD(
_nombreMovimiento varchar(100)
)
BEGIN
SELECT id_TipoMovimiento FROM TipoMovimientosAlmacen
 WHERE nombreMovimiento= _nombreMovimiento;
END;

CALL SP_LISTAR_TIPO_MOV_COD('Ingresos');



/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA REGISTRAR EL INRESOS Y SALIDAS DE ALMACEN*/
DELIMITER $$
CREATE PROCEDURE SP_REGISTRAR_INGRESO_SALIDA_BIENES(
        _id_codMovimiento int,
		_id_tipoMovimiento int,
        _id_TipoBienes int,
        _id_bienes int,
		_cantidad int,
		_descripcion_del_bien nvarchar(100)
)
BEGIN
DECLARE tipomovimiento INT;

INSERT INTO  MovimientosAlmacen
VALUES (_id_codMovimiento,_id_tipoMovimiento,_id_TipoBienes,_id_bienes,_cantidad,_descripcion_del_bien);
SET tipomovimiento=(SELECT m.id_tipoMovimiento FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);
IF tipomovimiento = 1 THEN
UPDATE Bienes
SET stock = stock + _cantidad
WHERE id_bienes=_id_bienes;
ELSE
UPDATE Bienes
SET stock = stock - _cantidad
WHERE id_bienes=_id_bienes;
END IF;
END;

/*PROCEDIMIENTOS ALMACENADOS*/
/*P.A. PARA ACTUALIZAR EL INRESOS Y SALIDAS DE ALMACEN*/
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_INGRESO_SALIDA_BIENES(
        _id_codMovimiento int,
		_id_tipoMovimiento int,
        _id_TipoBienes int,
        _id_bienes int,
		_cantidad int,
		_descripcion_del_bien nvarchar(100)
)
BEGIN
DECLARE tipomovimiento INT;
DECLARE cantidad_old int;

SET cantidad_old=(SELECT m.cantidad FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);
UPDATE   MovimientosAlmacen
SET id_tipoMovimiento=_id_tipoMovimiento,id_TipoBienes=_id_TipoBienes,id_bienes=_id_bienes,cantidad=_cantidad,descripcion_del_bien=_descripcion_del_bien
WHERE id_codMovimiento=_id_codMovimiento;
SET tipomovimiento=(SELECT m.id_tipoMovimiento FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);
IF tipomovimiento = 1 THEN
UPDATE Bienes
SET stock = (stock-cantidad_old) + _cantidad
WHERE id_bienes=_id_bienes;
ELSE
UPDATE Bienes
SET stock = (stock+cantidad_old) - _cantidad
WHERE id_bienes=_id_bienes;
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
SET tipomovimiento=(SELECT m.id_tipoMovimiento FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);
SET _cantidad=(SELECT m.cantidad FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);

SET codBienes=(SELECT m.id_bienes FROM MovimientosAlmacen as m where id_codMovimiento=_id_codMovimiento);

DELETE FROM  MovimientosAlmacen
WHERE id_codMovimiento=_id_codMovimiento;

IF tipomovimiento = 1 THEN
UPDATE Bienes
SET stock = stock - _cantidad
WHERE id_bienes=codBienes;
ELSE
UPDATE Bienes
SET stock = stock + _cantidad
WHERE id_bienes=codBienes;
END IF;
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
        _teléfono varchar(15) 
)
BEGIN
UPDATE Proveedor 
SET razon_social=_razon_social,nombe_comercial=_nombe_comercial,numero_ruc=_numero_ruc,email=_email,direccion=_direccion,departamento=_departamento,teléfono=_teléfono
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

/*COMPROBAR*/
CALL SP_LISTAR_PROVEEDORES();

-- ---------------------------------------------------------------------------------------------------------------------------
-- ------- ----------------------------------- PARTE DEL LOGIN LOGIN ---------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------
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

call SP_REGISTRAR_ACCESO(00000080,5,5,13);

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
call SP_ACTUALIZAR_ACCESO(79,5,6,14);

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

call SP_EDITAR_ACCESO(78)
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
