-- =========================================================
-- Base de datos: paciente_expediente
-- Relación 1:1 entre PACIENTE y EXPEDIENTE
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
    NumPaciente    INT NOT NULL UNIQUE,   -- UNIQUE asegura la relación 1:1
    FOREIGN KEY (NumPaciente) REFERENCES PACIENTE(NumPaciente)
);
 