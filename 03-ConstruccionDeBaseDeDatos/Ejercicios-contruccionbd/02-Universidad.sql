-- =========================================================
-- Base de datos: universidad_profesores
-- PROFESOR 1:N CURSO
-- PROFESOR 1:N ESPECIALIDAD
-- =========================================================
 
CREATE DATABASE universidad_cursos;
USE universidad_cursos;
 
CREATE TABLE profesor (
    NumProf   INT PRIMARY KEY,
    Nombre    VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20)
);
 
CREATE TABLE CURSO (
    NumCursa    INT PRIMARY KEY,
    NombreCurso VARCHAR(20) NOT NULL,
    Creditos    INT NOT NULL,
    NumProf     INT,
    FOREIGN KEY (NumProf) REFERENCES profesor(NumProf)
);
 
-- Nota: en el diagrama "NombreEsp" aparece como INT NOT NULL y forma,
-- junto con NumProf, la llave primaria compuesta de la especialidad.
CREATE TABLE ESPECIALIDAD (
    NombreEsp INT NOT NULL,
    NumProf   INT NOT NULL,
    Nombre    VARCHAR(30) NOT NULL,
    PRIMARY KEY (NombreEsp, NumProf),
    FOREIGN KEY (NumProf) REFERENCES profesor(NumProf)
);
 