/*=========================================================================
 SQL-LDD  en SQLServer

 Archiivo:05-consultas-basicas.sql

 Descripcion:Introduccion a la ejecucion de las primeras
 consultas de recuperacion de datos
 
 ======================================================================= */

 Use comercial_db;
 GO

 --Utilizando el operador asterisco(*), no  es muy recomendada
 -- *, todas las columnas

 SELECT *
 FROM productos;

 -- Seleccionar columnas necesarias (Proyeccion)
 
 SELECT 
	nombre
 FROM estados;

 SELECT 
	codigo,
	nombre,
	precio
FROM productos;
GO

SELECT 
	nombre,apellido_paterno telefono,
	correo
FROM clientes;
GO

SELECT 
	nombre,
	apellido_paterno,
	telefono,
	correo
FROM clientes;
GO

--Alias de columna
--Es un nombre temporal asignado a una columna dentro del
--resultado una consulta

SELECT 
codigo,
nombre,
precio
FROM productos;

SELECT 
codigo AS codigo_producto,
nombre AS nombre_producto,
precio AS precio_unitario
FROM productos;

SELECT 
codigo AS [codigo producto],
nombre AS [nombre producto],
precio AS [precio unitario]
FROM productos;

SELECT 
codigo AS 'codigo producto',
nombre AS 'nombre producto',
precio AS 'precio unitario'
FROM productos;

-- Otra forma se poner alias(No recomendada)
SELECT 
codigo codigo_producto,
nombre nombre_producto,
precio precio_unitario
FROM productos;
GO

--Alias dee tabla
SELECT 
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;

--Alias dee tabla
SELECT 
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos AS p;
GO

SELECT 
	c.id_categoria AS [numero-categoria],
	c.nombre AS [nombre_categoria],
	p.id_producto AS [numero_producto,
	p.nombre AS [nombre_producto],
	p.precio,
	p.existencia
FROM categorias AS c
INNER JOIN
productos AS p
ON c.id_categoria=p.id_categoria;

-- Columna calculada
-- Seleccionar los datos de los productos y el valor del inventario



SELECT
	p.codigo AS #,
	p.nombre AS [nombre_producto],
	p.precio AS [precio_producto],
	p.existencia AS [esistencia_producto],
	precio * existencia AS valor_inventario
FROM productos AS p;

--TODO:ver ejempllosk con campos calculados y operadores aritmeticos
-- Seleccionar los datos de las ventas, nummero de venta, cantidad vendida,
--(importe bruto por descuento entre 100) y
--precio, descuento y calcular el importe bruto, importe con desceunto y
--el importe neto (imported bruto por 1 menos el descuento entre 100)

SELECT 
	dv.id_venta AS [#venta],
	dv.cantidad AS [cantidad_vendida],
	dv.precio AS [precio_venta],
	dv.descuento AS [descuento],
	(dv.cantidad * dv.precio) AS [importe_bruto],
	(dv.cantidad * dv.precio*descuento/100.0) AS importe_descuento,
	dv.cantidad * dv.precio *(1-descuento/100.0) AS importe_neto
FROM detalle_ventas AS dv;

--USO DE DISTINCT
--Elimina del resultado las filas que tengan valores repetido en todas
--las columnas seleccionadas
/*=====================================================
	SELECT DISTINCT columna
	FROM tabla;
=====================================================*/
-- Ejemplo sin distinct
-- Selecciona los sexos de los clientes

SELECT sexo
FROM clientes;


--Ejemplo con DISTINCT
SELECT DISTINCT 
	sexo
FROM clientes;

--Seleccionar los distintos descuentos que se han aplicado a las ventas
SELECT 
	dv.descuento
FROM detalle_ventas AS dv

--Seleccionar los distintos departamentos a los que pertenecen los empleados
SELECT DISTINCT
	e.id_departamento AS [departamento]
FROM empleados as e;

SELECT DISTINCT
	e.id_empleado AS [departamento]
FROM empleados AS e;

--	DISTINCT PARA VARIAS COLUMNAS
--cuando se utiliza varias columnas, se evalua la combinacion completa

SELECT 
	p.id_categoria,
	p.id_proveedor
FROM productos AS P;
GO

-- USE DE TOP
--Limita la cantidad de filas devueltas por una consulta

/*======================================================
SELECT TOP (cantidad)
	columna_1,
	columna_2,
	columna_n
FROM tabla;

=======================================================*/

--Seleccionar cinco primeros productos encontrados en la tabla productos

SELECT TOP(15)
	id_producto,
	codigo
FROM productos AS p;


-- eleccionar los primeros 5 productos que aparezcan en la consulta,
--mostrando el codigo,nmbre,precio,existencia y el valor del inventario
-- de la tabla productos
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p;

--TOP CON PORCENTAJE
--SQL Server permite liitar el resultado mediante un porcentaje

/* 
	SELECT  TOP(porcentaje) PERCENT
		colmnas
	FROM tabla;
*/

--Seleccionar el 10 por ciento de los registros de la tabla productos
--mostrando numero de producto, codigo y nombre

SELECT TOP (10) PERCENT
	p.id_producto,
	p.codigo,
	p.nombre
FROM productos AS p;
GO

-- Seleccionar los tre primeros desceuntos distintos
SELECT DISTINCT TOP(3)
	descuento
FROM detalle_ventas AS dv;

