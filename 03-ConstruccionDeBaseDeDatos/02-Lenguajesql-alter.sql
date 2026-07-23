-- ALTER TABLE
CREATE DATABASE bdejemplo;
GO

USE bdejemplo;

 CREATE TABLE alummno(
 alumno_id INT NOT NULL IDENTITY(1,1),
 nombre VARCHAR(20) NOT NULL,
 apellido_paterno VARCHAR(15) NOT NULL,
 apellido_materno VARCHAR(15)
 );

 -- Agregar una columna

 ALTER TABLE alummno
 ADD telefono VARCHAR(20);


 -- Agrgar varias columnas

 ALTER TABLE alummno
 ADD
 curp CHAR(18),
 rfc CHAR NOT NULL;
 GO

 -- Modificar un campo y su tipo de dato
 ALTER TABLE alummno
 ALTER COLUMN
 telefono VARCHAR(30);
 GO

 -- rESTRICCIONES
 -- PRIMARY KEY

 ALTER TABLE alummno
 ADD CONSTRAINT pk_alumno
 PRIMARY KEY (alumno_id);

 -- Foreing key
 CREATE TABLE carrera(
 carrera_id INT NOT NULL IDENTITY(1,1),
 nombre VARCHAR(30) NOT NULL
 );
 GO

 ALTER TABLE carrera
 ADD CONSTRAINT pk_carrera
 PRIMARY KEY(carrera_id);

 ALTER TABLE ALUMMNO
 ADD carrera_id INT NOT NULL;
 GO

 ALTER TABLE alummno
 ADD CONSTRAINT fk_alumno_carrera
 FOREIGN KEY(carrera_id)
 REFERENCES carrera(carrera_id)
 ON DELETE CASCADE
 ON UPDATE NO ACTION;

 --chech
 ALTER TABLE alummno
 ADD edad INT NOT NULL;
 
 -- Restriccion check

 ALTER TABLE alummno
ADD CONsTRAINt ck_alumno_edad
CHECK (edad>0);

ALTER TABLE alummno
ADD CONSTRAINT ck_alumno_telefono
CHECK (telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

INSERT INTO carrera
VALUES( 'Tecnologias de Informacion');


INSERT INTO alummno
VALUES('Monico Toribio', 'Cervantes','Chimbo','773-146-2476','JGJGJGJ','sdfafdf',1,18);

SELECT * FROM alummno;

delete from alummno;
-- RESTRICCION DEFAULT

alter table alumno
ADD activo BIT NOT NULL;


alter table alummno
ADD CONSTRAINT df_alumno_activo
DEFAULT 1
FOR activo;





 ALTER TABLE alumno
 ADD CONSTRAINT pk_alumno
 PRIMARY KEY (alumno_id);


 -- unique

 ALTER TABLE carrera
 ADD CONSTRAINT uq_carrera_nombre
 UNIQUE(nombre);


 --Eliminar Restricciones

 -- Restriccion FK
 ALTER TABLE alumno
 DROP CONSTRAINT fk_alumno_carrera;

 -- Elimminar PK
 Alter table alumno
 DROP CONSTRAINT pk_alumno;

 ALTER TABLE carrera
 DROP CONSTRAINT pk_carrera;


 --Eliminar check

 Alter table alumno
 DROP CONSTRAINT ck_alumno_edad;

 ALTER TABLE alumno
 DROP CONSTRAINT ck_alumno_telefonio;

 -- Eliminar Unique
 ALTER TABLE carrera
 DROP CONSTRAINT uq_carrera_nombre;

 --ELiminar columna
 ALTER TABLE alummno
 DROP COLUMN carrera_id;

 -- DROP (Elimina objetos de la bd completos(tables, views, stored procedures, trigger, bd))

 DROP TABLE carrera;

  DROP TABLE alummno;

  --Eliminar la base de datos

  USE master;
  GO

  IF DB_ID('bdejemplo') IS NOT NULL
  BEGIN
	DROP DATABASE bdejemplo;
  END
