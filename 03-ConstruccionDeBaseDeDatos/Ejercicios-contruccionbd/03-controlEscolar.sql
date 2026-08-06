-- =========================================================
-- Base de datos: inscripciones_alumnos
-- ALUMNO N:N MATERIA a través de la tabla INSCRIBE
-- =========================================================

CREATE DATABASE controlEscolar;
USE controlEscolar;

CREATE TABLE ALUMNO (
    Matricula INT PRIMARY KEY,
    Semestre  INT NOT NULL,
    Nombre    VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL
);

CREATE TABLE MATERIA (
    ClaveMateria INT PRIMARY KEY,
    Nombre       VARCHAR(50) NOT NULL,
    Credito      INT NOT NULL
);

CREATE TABLE INSCRIBE (
    Matricula     INT NOT NULL,
    ClaveMateria  INT NOT NULL,
    FechaInscribe DATE,
    PRIMARY KEY (Matricula, ClaveMateria),
    FOREIGN KEY (Matricula)    REFERENCES ALUMNO(Matricula),
    FOREIGN KEY (ClaveMateria) REFERENCES MATERIA(ClaveMateria)
);