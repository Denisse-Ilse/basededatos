/*=========================================================================
 SQL-LDD  en SQLServer

 Archiivo:04-practoces.sql

 Descripcion:Realiza los ejemplos del comando select
 
 ======================================================================= */

 --verificar la existencia de data en las tablas
SELECT COUNT(*) FROM [dbo].[categorias];
SELECT COUNT(*) FROM[dbo].[ciudades];
SELECT COUNT(*) FROM[dbo].[clientes];
SELECT COUNT(*) FROM[dbo].[departamentos];
SELECT COUNT(*) FROM[dbo].[detalle_ventas];
SELECT COUNT(*) FROM[dbo].[empleados];
SELECT COUNT(*) FROM[dbo].[estados];
SELECT COUNT(*) FROM[dbo].[productos];
SELECT COUNT(*) FROM[dbo].[proveedores];
SELECT COUNT(*) FROM[dbo].[ventas];

/*
Instruccion SELECT, es la intruccion mas utilizada en
SQL. Su objetico es consultar informacion de una o varias tablas

Sintaxis
SELECT
	columna_1,
	columna_2,
	columna_3
	columna_n
FROM nombre_tabla;
=================*/
SELECT * FROM estados; --no es recomendable usarla cuando muchos datos

SELECT nombre FROM estados;

--Mostrar los nombres de los departamentos
SELECT nombre FROM departamentos;

--Mostrar el nombre del proovedor, el telefono y su contacto

SELECT empresa,telefono,contacto FROM proveedores;

--Alias de columnas

--Muestrar los nombres de los estados
SELECT 
	nombre 'Nombre del estado'
FROM estados;

SELECT 
	nombre AS 'Nombre del estado'
FROM estados;

SELECT 
	nombre NombredelEstado
FROM estados;

SELECT 
	nombre Nombre_del_estado
FROM estados;

SELECT 
	nombre [Nombre del estado]
FROM estados;

SELECT 
	nombre AS [Nombre del estado]
FROM estados;

SELECT COUNT(*) AS [total de ventas Detalles]
FROM detalle_ventas;

--Mostrar el codigo, nombre y precio pero con nobres mas adecuados para el usuario
SELECT 
	codigo AS codigo_producto,
	UPPER(nombre) AS producto,
	precio AS precio_unitario
FROM productos

--TODO:
VER CAMPOS CALCULADOS




--Orden Logico de una consulta SELECT

--Orden de como escribimos la consulta

--SELECT
--FROM
--WHERE
--GROUP BY
--HAVING
--ORDER BY

--ORDEN DE EJECUCION DE SQL SERVER
FROM
WHERE
GROUP BY
HAVING
ORDER BY

