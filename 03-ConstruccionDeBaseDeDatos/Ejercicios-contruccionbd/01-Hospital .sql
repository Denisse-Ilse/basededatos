-- =========================================================
-- Base de datos: Hospital
-- =========================================================
 
CREATE DATABASE Hospital;
USE Hospital;
 
CREATE TABLE PACIENTE (
    NumPaciente INT PRIMARY KEY,
    Nombre      VARCHAR(50) NOT NULL,
    Ape1        VARCHAR(50) NOT NULL,
    Ape2        VARCHAR(50),
    FechaNaci   DATE
);
 
CREATE TABLE EXPEDIENTE (
    NoExpediente   INT PRIMARY KEY,
    FechaApertura  DATE NOT NULL,
    TipoDeSangre   VARCHAR(5),
    NumPaciente    INT NOT NULL UNIQUE,   
    FOREIGN KEY (NumPaciente) REFERENCES PACIENTE(NumPaciente)
);
 