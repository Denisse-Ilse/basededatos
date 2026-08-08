-- =========================================================
-- Base de datos: universidad_pro
-- =========================================================
CREATE DATABASE universidad_pro;
USE universidad_pro;

CREATE TABLE profesor (
    NumProf   INT PRIMARY KEY,
    Nombre    VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(20) NOT NULL,
    Apellido2 VARCHAR(20)
);

CREATE TABLE curso (
    NumCursa    INT PRIMARY KEY,
    NombreCurso VARCHAR(20) NOT NULL,
    Creditos    INT NOT NULL,
    NumProf     INT,
    FOREIGN KEY (NumProf) REFERENCES profesor(NumProf)
);

CREATE TABLE especialidad (
    NombreEsp INT NOT NULL,
    NumProf   INT NOT NULL,
    Nombre    VARCHAR(30) NOT NULL,
    PRIMARY KEY (NombreEsp, NumProf),
    FOREIGN KEY (NumProf) REFERENCES profesor(NumProf)
);