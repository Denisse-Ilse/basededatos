```sql
-- =========================================================
-- Base de datos: gestion_empresarial
-- =================================================

CREATE DATABASE gestion_empresarial;
USE gestion_empresarial;

CREATE TABLE puesto (
    ClavePuesto      INT PRIMARY KEY,
    Nombre           VARCHAR(50) NOT NULL,
    SalarioMax       DECIMAL(10,2),
    SalarioMin       DECIMAL(10,2),
    NivelJerarquico  VARCHAR(30)
);

CREATE TABLE sucursal (
    ClaveSucursal INT PRIMARY KEY,
    Nombre        VARCHAR(50) NOT NULL,
    Telefono      VARCHAR(15),
    Ciudad        VARCHAR(50),
    Estado        VARCHAR(50)
);

CREATE TABLE proyecto (
    ClaveProyecto INT PRIMARY KEY,
    Nombre        VARCHAR(50) NOT NULL,
    Presupuesto   DECIMAL(12,2) CHECK (Presupuesto >= 0),
    FechaInicio   DATE,
    FechaTermino  DATE
);

CREATE TABLE capacitacion (
    ClaveCapacitacion INT PRIMARY KEY,
    Nombre            VARCHAR(50) NOT NULL
);


CREATE TABLE departamento (
    ClaveDepto        INT PRIMARY KEY,
    Nombre            VARCHAR(50) NOT NULL,
    Presupuesto       DECIMAL(12,2),
    Ubicacion         VARCHAR(50),
    NumEmplAdministra INT
);

CREATE TABLE empleado (
    NumEmpl        INT PRIMARY KEY,
    Nombre         VARCHAR(50) NOT NULL,
    Ap1            VARCHAR(50) NOT NULL,
    Ap2            VARCHAR(50),
    FechaNac       DATE,
    CURP           VARCHAR(18) UNIQUE,
    Sueldo         DECIMAL(10,2) CHECK (Sueldo > 0),
    ClaveDepto     INT,   
    ClavePuesto    INT,   
    ClaveSucursal  INT,   
    NumEmplJefe    INT,   
    FOREIGN KEY (ClaveDepto)    REFERENCES DEPARTAMENTO(ClaveDepto),
    FOREIGN KEY (ClavePuesto)   REFERENCES PUESTO(ClavePuesto),
    FOREIGN KEY (ClaveSucursal) REFERENCES SUCURSAL(ClaveSucursal),
    FOREIGN KEY (NumEmplJefe)   REFERENCES EMPLEADO(NumEmpl)
);

ALTER TABLE departamento
    ADD FOREIGN KEY (NumEmplAdministra) REFERENCES empleado(NumEmpl);


CREATE TABLE participa (
    NumEmpl       INT NOT NULL,
    ClaveProyecto INT NOT NULL,
    Rol           VARCHAR(30),
    Horas         DECIMAL(6,2) DEFAULT 0,
    PRIMARY KEY (NumEmpl, ClaveProyecto),
    FOREIGN KEY (NumEmpl)       REFERENCES empleado(NumEmpl),
    FOREIGN KEY (ClaveProyecto) REFERENCES proyecto(ClaveProyecto)
);

CREATE TABLE asiste (
    NumEmpl           INT NOT NULL,
    ClaveCapacitacion INT NOT NULL,
     FechaInscripcion  DATE DEFAULT (GETDATE()),
    Calificacion      DECIMAL(4,2),
    Status            VARCHAR(20) DEFAULT 'Pendiente',
    PRIMARY KEY (NumEmpl, ClaveCapacitacion),
    FOREIGN KEY (NumEmpl)           REFERENCES empleado(NumEmpl),
    FOREIGN KEY (ClaveCapacitacion) REFERENCES capacitacion(ClaveCapacitacion)
);
```
![Diagrama de base de datos](/img/Construccion/construccion07.jpg)
