# Diccionario de Datos de base de datos control escolar

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto| Sistema de Control Escolar (Inscripciones) |
| Versión | 1.0 |
| Fecha | Julio 2026 |
| Elaboró | Denisse Ilse Ramírez Canuto |
| SGBD | SQLServer |

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Alumnos
- Materias
- Inscripciones (Incribe)

Permite controlar el registro oficial de los estudiantes en sus asignaturas correspondientes, manteniendo un historial de la fecha de inscripción y la calificación obtenida.

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

**Descripción:** *Almacena la información académica y de identidad de los estudiantes*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 10 | PK, NN | Matrícula institucional única asignada al alumno |
| Semestre | INT | - | NN | Semestre académico actual del estudiante |
| Nombre | VARCHAR | 50 | NN | Nombre o nombres del alumno |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido del alumno |

---

**Tabla:** Materia

**Descripción:** *Almacena el catálogo de asignaturas disponibles en la institución*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Clave_materia | VARCHAR | 10 | PK, NN | Código alfanumérico único identificador de la materia |
| Nombre | VARCHAR | 100 | NN | Nombre completo de la asignatura |
| Credito | INT | - | NN, CK(>=0) | Créditos asignados que otorga la materia |

---

**Tabla:** Incribe

**Descripción:** *Tabla intermedia que registra los detalles de las materias inscritas por los alumnos*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 10 | PK, FK1, NN | Matrícula del alumno; llave foránea ligada a la tabla Alumno |
| Clave_materia | VARCHAR | 10 | PK, FK2, NN | Clave de la materia; llave foránea ligada a la tabla Materia |
| Fecha_Incribe | DATE | - | NN | Fecha exacta en la que se realizó la inscripción |
| Calificacion_Final| DECIMAL | 4,2 | NULL, CK(>=0 AND <=10) | Calificación definitiva obtenida por el alumno al finalizar el periodo |

## 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno -> Incribe | 1:N | Un alumno puede registrarse en múltiples inscripciones |
| Materia -> Incribe | 1:N | Una materia puede estar presente en múltiples inscripciones |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Incribe | Matricula | Alumno(Matricula) |
| Incribe | Clave_materia | Materia(Clave_materia) |

## 7. INTEGRIDAD REFERENCIAL

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede asentar una inscripción para una Matrícula que no exista en la tabla Alumno |
| IR-02 | No se puede registrar una inscripción con una Clave_materia que no exista en la tabla Materia |

## 8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede inscribirse en varias materias simultáneamente |
| RN-02 | Una materia puede tener muchos alumnos inscritos al mismo tiempo |
| RN-03 | Puede existir una materia creada en el catálogo que actualmente no tenga alumnos inscritos (Participación parcial de Materia) |
| RN-04 | Todo alumno registrado debe estar inscrito obligatoriamente en al menos una materia (Participación total de Alumno) |

## 9. Diagrama Relacional  
![Diagrama relacional Ej3](/img/Relacional/Relacional03.jpg)