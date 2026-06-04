CREATE DATABASE pruebabd;

CREATE TABLE tbl1(
 id INT,
 nombre VARCHAR(30)
);

INSERT INTO tbl1
values(1,'pepito'),
(2,'Luis'),
(3,'Luar');

SELECT* FROM tbl1


##Ejemplo en maria D
# Crea una base de datos
CREATE DATABASE prueba_atributos;

# Utiliza la base de datos
USE prueba_atributos;

# Crea una tabla
CREATE TABLE empleado(
	id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_1 VARCHAR(15),
    apellido_2 VARCHAR(15) NULL,
    fecha_ingreso DATE NOT NULL
);

# Inserta un valor
INSERT INTO empleado VALUES (1, "Reberiano", "Robles", "De la Torre", '1983-04-06'); 

# Agrega un nuevo campo
ALTER TABLE empleado ADD COLUMN
fecha_nacimiento DATE NOT NULL;

# Inserta un nuevo valor
INSERT INTO empleado VALUES (2, "Rómulo", "Robles", "Esparza", '1984-07-12', '1976-06-07');

# Muestra los datos en la tabla y separa la feha en año, mes y día
SELECT *, YEAR(fecha_ingreso) AS anio, MONTH(fecha_ingreso) AS mes, DAY(fecha_ingreso) AS dia
FROM empleado;

# Muestra todos los registros
SELECT * FROM empleado;

# Modifica la fecha de nacimiento
UPDATE empleado SET fecha_nacimiento = '1983-04-06' WHERE id = 1;

select
	nombre,
	apellido_1,
	apellido_2,
	fecha_ingreso,
	fecha_nacimiento,
	timestamp(year, fecha_nacimiento,CURDATE())AS Edad
from empleado;

