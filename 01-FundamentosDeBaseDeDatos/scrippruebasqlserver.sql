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