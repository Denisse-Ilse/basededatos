-- =========================================================
-- Base de datos: company_en
-- Esquema clásico de empresa (EMPLOYEE - DEPARTMENT - LOCATIONS -
-- PROJECTS - WORKS_ON - DEPENDENT), versión en inglés
-- =========================================================

CREATE DATABASE Compania;
USE Compania;

CREATE TABLE DEPARTMENT (
    Number      INT PRIMARY KEY,
    Name        VARCHAR(50) NOT NULL,
    ManagerSsn  CHAR(11) UNIQUE,      -- relación 1:1 con EMPLOYEE (manager)
    MgrStartDate DATE,
    StartDate   DATE
);

CREATE TABLE EMPLOYEE (
    Ssn        CHAR(11) PRIMARY KEY,
    FirstName  VARCHAR(30) NOT NULL,
    LastName   VARCHAR(30) NOT NULL,
    Address    VARCHAR(100),
    Bdate      DATE,
    Salary     DECIMAL(10,2),
    Sex        CHAR(1),
    SuperSsn   CHAR(11),                       -- jefe (autorreferencia)
    NumberDep  INT,
    FOREIGN KEY (SuperSsn)  REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY (NumberDep) REFERENCES DEPARTMENT(Number)
);

ALTER TABLE DEPARTMENT
    ADD FOREIGN KEY (ManagerSsn) REFERENCES EMPLOYEE(Ssn);

CREATE TABLE LOCATIONS (
    NumLocation INT NOT NULL,
    NumberDep   INT NOT NULL,
    Localhost   VARCHAR(50) NOT NULL,
    PRIMARY KEY (NumLocation, NumberDep),
    FOREIGN KEY (NumberDep) REFERENCES DEPARTMENT(Number)
);

CREATE TABLE PROJECTS (
    Number    INT PRIMARY KEY,
    Name      VARCHAR(50) NOT NULL,
    Location  VARCHAR(50),
    NumberDep INT NOT NULL,
    FOREIGN KEY (NumberDep) REFERENCES DEPARTMENT(Number)
);

CREATE TABLE WORKS_ON (
    Ssn         CHAR(11) NOT NULL,
    NumberPros  INT NOT NULL,
    Hours       DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (Ssn, NumberPros),
    FOREIGN KEY (Ssn)        REFERENCES EMPLOYEE(Ssn),
    FOREIGN KEY (NumberPros) REFERENCES PROJECTS(Number)
);

CREATE TABLE DEPENDENT (
    Ssn          CHAR(11) NOT NULL,
    Name         VARCHAR(50) NOT NULL,
    Sex          CHAR(1) NOT NULL,
    Relationship VARCHAR(20),
    Bdate        DATE,
    PRIMARY KEY (Ssn, Name),
    FOREIGN KEY (Ssn) REFERENCES EMPLOYEE(Ssn)
);