--Comparaciones con expresiones calculadas
--Where
--Mostrar productos cuyo valor de inventario sea mayor a $50, 000
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio * p.existencia)>5000
ORDER BY valor_inventario DESC;
GO

--Operador Logico AND
--Mostrar oroductos con precio entre $200 y $300 que ademas tenga menos que 50 unidades

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio>=200
AND p.precio<=300
AND p.existencia<50;

--Clausula BETWEEN (Equivalente a un rango)
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio BETWEEN 200 AND 300
AND p.existencia<50;

--Mostrar los empleados del departemento 1 cuyo salrio sea superior a $25000

SELECT 
 e.id_empleado,
 e.nombre,
 e.salario,
 e.id_departamento
FROM empleados AS e
WHERE e.id_departamento=1  AND e.salario> 25000;

--Mostrar los productos con existencia inferiro a 10 o superior a 190
 
 SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.existencia<10 OR p.existencia>190;

--Mostrar productos  que no tengan precio mayor a 400
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE NOT (p.precio>400);

--Seleccionar los empleados que pertenezcan al departamento 11,
-- al departamento 2 y con salario mayoor 2500
SELECT 
 e.id_empleado,
 e.nombre,
 e.salario,
 e.id_departamento
FROM empleados AS e
WHERE (e.id_departamento=1 or e.id_departamento=2) AND e.salario> 25000;

--OPERADOR BETWEEN
--BETWEEN permite comprobar si un valor se encuentra dentro de un rango
--inclusivo
/*================================
SINTAXIS

WHERE columna BETWEEN limite_inferior AND limite_superior;

=================================================*/

--Mostrar los empleados con salario entre $15,000 y $20,000,
--incluyendo ambos limites
SELECT 
 e.id_empleado,
 e.nombre,
 e.salario,
 e.id_departamento
FROM empleados AS e
WHERE e.salario BETWEEN 1500.0 AND 20000.0
ORDER BY 3 DESC;

SELECT 
 e.id_empleado,
 e.nombre,
 e.salario,
 e.id_departamento
FROM empleados AS e
WHERE e.salario>=15000
AND e.salario<=20000;

--seleccionar los productos donde el precio este entre $100 y $200
--Seleccionar las ventas realizadas de 1 de enero de 2025 al
--10 de enero de 2025
SELECT
	v.id_venta AS numero_venta,
	v.id_cliente AS cliente,
	v.id_empleado AS vendedor,
	v.fecha AS fecha_venta,
	UPPER(FORMAT(v.fecha,'MMMM','es-Es'))AS [mes_venta],
	UPPER(FORMAT(v.fecha,'dddd','es-ES')) AS [dia_venta],
	DATEPART(year, v.fecha) AS [año_venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10'
ORDER BY fecha_venta;

--NOT BETWEEM
--Recupera valores que se emcuentran fuera de rango

--SELECCIONAR  LOS PRODUCTOS QUE NO SE ENCUENTREN EN EL RANGO DE PRECIOS
--DE 100 Y 400

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio NOT BTWEEN 100 AND 400;S

--operador in
--permite comprobar una columna con una lista de valores

/*==================================================

WHERE columna IN (valor_1,valor_2,valor_n)
Es equivalente a varias condiciones conectadas con OR

==================================================*/
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	P.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)
order by P.ID_CATEGORIA;

--MOSTRAR LOS PRODUCTOS PERTENECIENTES ALAS CATEGORIAS 1,7,12
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	P.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)


SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	P.id_categoria
FROM productos AS p
WHERE p.id_categoria=1 or p.id_categoria=2 or p.id_categoria=12
ORDER BY p.id_categoria;


--seleccionar los departamentos de ventas, TI y Direccion
SELECT 
	d.id_departamento,
	d.nombre
FROM departamentos AS d
WHERE d.nombre IN('ventas','ti','direccion');


--seleccionar los departamentos de ventas, TI y Direccion
SELECT 
	d.id_departamento,
	d.nombre
FROM departamentos AS d
WHERE d.nombre IN('ventas','ti','direccion');


--not in
--Excluir os valores incluidos en la lista
--Mostrar los datos de los empelados que no pertenezcan ni al departamento q ni al 2
SELECT 
 e.id_empleado,
 e.nombre,
 e.salario,
 e.id_departamento
FROM empleados AS e
WHERE e.id_departamento NOT IN(1,2);

/*=====================================================
OPERADOR LIKE

like permite buscar patrones dentro de valores

SINTAXIS

WHERE columna LIKE 'patron'
los patrones pueden contener comodines

Los principaeks son:
comodin  significafo
%         cero, uno a varios caracteres
_         Exctamente un caracter
[abc]     Un caracter incluido en la lista
[a-f]     Un caracter incluido en el rango
[^abc]    Un caracter no incluido en la lista

================================================*/

--Commodin %
-- EL simbolo % representa cualquier cantidad de caracteres, incluyendo cero caracteres
--Comienza con 
--EHERE nombre LIKE 'Cliente%'
--Valores que comienzan con Cliente1

--TERMINA CON 
--WHERE correo LIKE %mail.com

--CONTIENE
--WHERE	nombre LIKE '%a%'
--Significa:valores que contienen el caracter a en cualquier posicion

--Mostrar los productos donde el codigo comience con P0001
SELECT 
	p.codigo,
	p.nombre,
	p.precio
FROM producto AS p
WHERE p.codigo LIKE 'P001%';

--Mostrar los datos de los clientes en donde su correo termine con  10@gmail.com
SELECT
c.id_cliente,
c.nombre,
c.correo
FROM clientes AS c
WHERE c.correo LIKE '%10@mail.com';

--Mostrar los datos de los productos donde el nombre contenga el caracter 1

SELECT
p.codigo,
p.nombre,
p.precio
FROM productos AS p
WHERE p.nombre LIKE '%1%'

--Comodin de un caracter
--El guion bajo _ representa exactamente un caracter

--SELECCIONAR LOS DATOS DE LOS PRODCUTOS DONDE EL CODICO COMIENCE P000 y despues exactamente
--un caracter adicional

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P00_';


SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P000%';


