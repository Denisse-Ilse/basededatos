```sql
-- =========================================================
-- Base de datos: escuela
-- =========================================================

CREATE DATABASE escuela;
USE escuela;
GO

CREATE TABLE alumno (
    Matricula INT PRIMARY KEY,
    Nombre    VARCHAR(50) NOT NULL,
    Ap1       VARCHAR(50) NOT NULL,
    Ap2       VARCHAR(50),
    Telefono  VARCHAR(15),
    Correo    VARCHAR(100)
);
GO


CREATE TABLE credencial (
    NumCredencial   INT PRIMARY KEY,
    FechaExpedicion DATE,
    Vigencia        DATE,
    Matricula       INT NOT NULL UNIQUE,
    FOREIGN KEY (Matricula) REFERENCES alumno(Matricula)
);
GO


CREATE TABLE profesor (
    NumProf INT PRIMARY KEY,
    Nombre  VARCHAR(50) NOT NULL,
    Ap1     VARCHAR(50) NOT NULL,
    Ap2     VARCHAR(50)
);
GO


CREATE TABLE materia (
    NombreMate VARCHAR(50) PRIMARY KEY,
    CalifMate  DECIMAL(4,2),
    Creditos   INT NOT NULL,
    NumProf    INT,
    FOREIGN KEY (NumProf) REFERENCES profesor(NumProf)
);
GO


CREATE TABLE proyecto (
    NumProyecto INT PRIMARY KEY,
    Nombre      VARCHAR(50) NOT NULL,
    Presupuesto DECIMAL(12,2) CHECK (Presupuesto >= 0)
);
GO

CREATE TABLE departamento (
    NumDepto INT PRIMARY KEY,
    Nombre   VARCHAR(50) NOT NULL,
    Edificio VARCHAR(50)
);
GO


CREATE TABLE cursa (
    Matricula        INT NOT NULL,
    NombreMate       VARCHAR(50) NOT NULL,
    FechaInscripcion DATE DEFAULT (GETDATE()),
    CalFinal         DECIMAL(4,2),
    PRIMARY KEY (Matricula, NombreMate),
    FOREIGN KEY (Matricula)  REFERENCES alumno(Matricula),
    FOREIGN KEY (NombreMate) REFERENCES materia(NombreMate)
);
GO

CREATE TABLE participa (
    NumProf          INT NOT NULL,
    NumProyecto      INT NOT NULL,
    FechaInscripcion DATE,
    Rol              VARCHAR(30),
    PRIMARY KEY (NumProf, NumProyecto),
    FOREIGN KEY (NumProf)     REFERENCES profesor(NumProf),
    FOREIGN KEY (NumProyecto) REFERENCES proyecto(NumProyecto)
);
GO


CREATE TABLE pertenece(
    NumProf  INT NOT NULL,
    NumDepto INT NOT NULL,
    PRIMARY KEY (NumProf, NumDepto),
    FOREIGN KEY (NumProf)  REFERENCES profesor(NumProf),
    FOREIGN KEY (NumDepto) REFERENCES departamento(NumDepto)
);
GO

CREATE TABLE depende (
    NumProf           INT NOT NULL,
    NombreDependiente VARCHAR(50) NOT NULL,
    FechaNacimiento   DATE,
    Parentesco        VARCHAR(20),
    PRIMARY KEY (NumProf, NombreDependiente),
    FOREIGN KEY (NumProf) REFERENCES profesor(NumProf)
);
GO
```
![Diagrama de base de datos](/img/Construccion/construccion09.jpg)