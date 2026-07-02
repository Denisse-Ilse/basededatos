CREATE DATABASE EJEMPLOBD;

GO

USE EJEMPLOBD;
GO

--SQL-LDD
CREATE TABLE categoria(
	categoria_id INT NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id)
);

CREATE TABLE producto(
	prodcuto_id INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	precio MONEY NOT NULL,
	existencia INT NOT NULL,
	categoria_id INT not null,
	constraint fk_producto_categoria
	FOREIGN KEY (categoria_id)
	REFERENCES categoria(categoria_id)
);


\\\\\
CREATE TABLE ALUMNO(
	id_alumno INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido_1 VARCHAR(15) NOT NULL,
	apellido_2 VARCHAR(15) NULL,
	telefono VARCHAR(13),
	calle VARCHAR(50) NOT NULL,
	numero_interior INT,
	numero_exterios INT,
	fecha_naci DATE NOT NULL);

INSERT INTO ALUMNO
VALUES (1,'Kevin','Kosner',null,'+527731458723','INFIERNO',666,NULL,'2007-02-18');

INSERT INTO ALUMNO(id_alumno,nombre, apellido_1,calle,fecha_naci)
VALUES (2,'Jose Luis','Gallardo','Angel','1983-04-06');

INSERT INTO ALUMNO(id_alumno,nombre, apellido_1,apellido_2,calle,fecha_naci)
VALUES (3,'JIMENA','VALDEZ','DELGADILLO','FLOR DE MAYO','2007-06-12');

SELECT *, DATEDIFF(YEAR,fecha_naci,GETDATE()) AS edad
FROM ALUMNO

CREATE TABle categoria2(
	catrgoria_id int not null primary key,
	nombre varchar(20) not null,);

create table productos2(
	producto_id int not null primary key,
	nombre varchar(30) not null,
	precio money not null,
	existencia int not null,
	categoria_id int null,
	constraint fk_producto2_categoria2
	foreign key(categoria_id)
	references categoria2(categoria_id)
);

