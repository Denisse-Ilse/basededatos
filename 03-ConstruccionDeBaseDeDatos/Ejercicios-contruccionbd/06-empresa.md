```sql
-- =========================================================
-- Base de datos: empresa
-- =========================================================

CREATE DATABASE empresa;
USE empresa;

CREATE TABLE Departamento (
    NumeroDepartamento INT PRIMARY KEY,
    Nombre             VARCHAR(50) NOT NULL,
    GerenteSSN         CHAR(11) UNIQUE,   
    FechaInicio        DATE
);

CREATE TABLE Empleado (
    SSN         CHAR(11) PRIMARY KEY,
    Nombre      VARCHAR(30) NOT NULL,
    Apellido    VARCHAR(30) NOT NULL,
    FechaNacimiento DATE,
    Sexo        CHAR(1),
    NumDepto    INT,
    GerenteSSN  CHAR(11),
    Salario     DECIMAL(10,2),
    FOREIGN KEY (NumDepto)   REFERENCES Departamento(NumeroDepartamento),
    FOREIGN KEY (GerenteSSN) REFERENCES Empleado(SSN)
);

ALTER TABLE Departamento
    ADD FOREIGN KEY (GerenteSSN) REFERENCES Empleado(SSN);

CREATE TABLE Ubicacion (
    Ubicacion           VARCHAR(50) NOT NULL,
    NumDepartamento     INT NOT NULL,
    PRIMARY KEY (Ubicacion, NumDepartamento),
    FOREIGN KEY (NumDepartamento) REFERENCES Departamento(NumeroDepartamento)
);

CREATE TABLE Proyecto (
    NumProyecto         INT PRIMARY KEY,
    Nombre              VARCHAR(50) NOT NULL,
    Ubicacion           VARCHAR(50),
    NumeroDepartamento  INT NOT NULL,
    FOREIGN KEY (NumeroDepartamento) REFERENCES Departamento(NumeroDepartamento)
);

CREATE TABLE Trabaja_en (
    SSNEmpleado CHAR(11) NOT NULL,
    NumProyecto INT NOT NULL,
    Horas       DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (SSNEmpleado, NumProyecto),
    FOREIGN KEY (SSNEmpleado) REFERENCES Empleado(SSN),
    FOREIGN KEY (NumProyecto) REFERENCES Proyecto(NumProyecto)
);

CREATE TABLE Dependiente (
    EmpleadoSSN CHAR(11) NOT NULL,
    Nombre      VARCHAR(50) NOT NULL,
    Sexo        CHAR(1),
    Relacion    VARCHAR(20),
    PRIMARY KEY (EmpleadoSSN, Nombre),
    FOREIGN KEY (EmpleadoSSN) REFERENCES Empleado(SSN)
);
```
![Diagrama de base de datos](/img/Construccion/construccion06.jpg)
