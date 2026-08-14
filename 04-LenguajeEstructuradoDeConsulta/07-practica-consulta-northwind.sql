-- Mostrar las ventas realizadas en Francia, brazil y belgica
-- de 10 de julio e 1996 al 31 de Diciembre de 1998, que tenga Region de Envio,
-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de la mas
-- cercana a la mas antigua.

SELECT
	o.OrderID AS numero_orden,
	o.CustomerID AS cliente,
	o.ShipCountry AS lugar_envio,
	o.OrderDate AS fecha_orden,
	UPPER(FORMAT(o.OrderDate, 'MMM','es-ES')) as mes_orden,
	UPPER(FORMAT(o.OrderDate, 'dddd','es-ES')) AS dia_orden,
	DATEPART(YEAR, o.OrderDate)AS año_orden,
	o.ShipRegion AS region
FROM Orders AS o
WHERE o.ShipCountry IN('France','Brazil','Belgium')
AND 
o.CustomerID IN('VICTE','HANAR','SUPRD')
AND 
o.ShipRegion IS NOT NULL
AND 
o.OrderDate BETWEEN '1996-07-10' AND '1998-12-24'
ORDER BY fecha_orden


SELECT
OrderID,
OrderDate,
ShipRegion
FROM Orders
WHERE ShipRegion IS NOT NULL

SELECT
	OrderID,
	OrderDate,
	p.productoName,
		
ShipRegion
FROM Orders AS o
INNNER JOIN
[Order Details]AS od
ON o.OrderID=od.OrderID
INNER JOIN Products AS 
ON od.ProductoID=p.ProductoID
WHERE o.OrderDate BETWEEN '1996-07-10' AND '1998-12-24'
AND P.ProductName LIKE 'ch%';

SELECT
	OrderID,
	OrderDate,
	p.productoName,
		
ShipRegion
FROM Orders AS o
INNNER JOIN
[Order Details]AS od
ON o.OrderID=od.OrderID
INNER JOIN Products AS 
ON od.ProductoID=p.ProductoID
WHERE o.OrderDate BETWEEN '1996-07-10' AND '1998-12-24'
AND P.ProductName LIKE 'chan%';

SELECT
	c.CustomesID,
	c.Company

FROM Customers AS c
WHERE c.CompanyName LIKE '%ta%


