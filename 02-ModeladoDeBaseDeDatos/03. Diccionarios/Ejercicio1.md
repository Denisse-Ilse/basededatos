# Diccionario de Datos de base de datos control escolar (Ejercicio 1)

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto| Sistema de control escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Denisse Ilse Ramírez Canuto |
| SGBD | SQLServer |

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Alumnos
- Materias
- Inscripciones (Incribe)

Permite controlar la relación y el registro de los estudiantes en sus respectivas materias asignadas.

## 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |

## 4. Diccionario de Datos

**Tabla:** Alumno

**Descripción:** *Almacena la información de los estudiantes*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | VARCHAR | 10 | PK, NN | Matrícula institucional e identificador único del alumno |
| semestre | INT | - | NN | Semestre académico actual del estudiante |
| nombre | VARCHAR | 50 | NN | Nombre o nombres del estudiante |
| apellido1 | VARCHAR | 50 | NN | Primer apellido del estudiante |

---

**Tabla:** Materia

**Descripción:** *Almacena las asignaturas ofertadas en la institución*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| clave_materia | VARCHAR | 10 | PK, NN | Código único que identifica la materia |
| nombre | VARCHAR | 100 | NN | Nombre oficial de la asignatura |
| credito | INT | - | NN, CK(>=0) | Créditos académicos que otorga la materia |

---

**Tabla:** Incribe

**Descripción:** *Almacena la inscripción y el registro de los alumnos en las materias*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| matricula | VARCHAR | 10 | PK, FK, NN | Matrícula del alumno; llave foránea que conecta con Alumno |
| clave_materia | VARCHAR | 10 | PK, FK, NN | Clave de la materia; llave foránea que conecta con Materia |
| fecha_incribe | DATETIME | - | NN, DF(GETDATE()) | Fecha y hora en la que se realizó la inscripción |

## 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno -> Incribe | 1:N | Un alumno puede tener muchas materias inscritas |
| Materia -> Incribe | 1:N | Una materia puede ser inscrita por muchos alumnos |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Incribe | matricula | Alumno(matricula) |
| Incribe | clave_materia | Materia(clave_materia) |

## 7. INTEGRIDAD REFERENCIAL

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede inscribir una matrícula que no exista en la tabla Alumno |
| IR-02 | No se puede inscribir una clave de materia que no exista en la tabla Materia |

## 8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede inscribirse en múltiples materias a la vez |
| RN-02 | Una materia puede contar con múltiples alumnos inscritos |

## 9. Diagrama Relacional  

![Diagrama relacional Ej1](/img/Relacional/Relacinal01.jpeg)