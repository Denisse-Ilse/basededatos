```sql
-- =========================================================
-- Base de datos: compania
-- =========================================================

CREATE DATABASE Compania;
USE Compania;

CREATE TABLE department (
    Number      INT PRIMARY KEY,
    Name        VARCHAR(50) NOT NULL,
    ManagerSsn  CHAR(11) UNIQUE,     
    MgrStartDate DATE,
    StartDate   DATE
);

CREATE TABLE employee (
    Ssn        CHAR(11) PRIMARY KEY,
    FirstName  VARCHAR(30) NOT NULL,
    LastName   VARCHAR(30) NOT NULL,
    Address    VARCHAR(100),
    Bdate      DATE,
    Salary     DECIMAL(10,2),
    Sex        CHAR(1),
    SuperSsn   CHAR(11),                      
    NumberDep  INT,
    FOREIGN KEY (SuperSsn)  REFERENCES employee(Ssn),
    FOREIGN KEY (NumberDep) REFERENCES department(Number)
);

ALTER TABLE department
    ADD FOREIGN KEY (ManagerSsn) REFERENCES employee(Ssn);

CREATE TABLE locations (
    NumLocation INT NOT NULL,
    NumberDep   INT NOT NULL,
    Localhost   VARCHAR(50) NOT NULL,
    PRIMARY KEY (NumLocation, NumberDep),
    FOREIGN KEY (NumberDep) REFERENCES department(Number)
);

CREATE TABLE projects (
    Number    INT PRIMARY KEY,
    Name      VARCHAR(50) NOT NULL,
    Location  VARCHAR(50),
    NumberDep INT NOT NULL,
    FOREIGN KEY (NumberDep) REFERENCES department(Number)
);

CREATE TABLE works (
    Ssn         CHAR(11) NOT NULL,
    NumberPros  INT NOT NULL,
    Hours       DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (Ssn, NumberPros),
    FOREIGN KEY (Ssn)        REFERENCES employee(Ssn),
    FOREIGN KEY (NumberPros) REFERENCES projects(Number)
);

CREATE TABLE dependiente (
    Ssn          CHAR(11) NOT NULL,
    Name         VARCHAR(50) NOT NULL,
    Sex          CHAR(1) NOT NULL,
    Relationship VARCHAR(20),
    Bdate        DATE,
    PRIMARY KEY (Ssn, Name),
    FOREIGN KEY (Ssn) REFERENCES employee(Ssn)
);
```
![Diagrama de base de datos](/img/Construccion/construccion05.jpg)
