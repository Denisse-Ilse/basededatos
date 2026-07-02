# Diccionario de Datos de base de datos control escolar

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto| Sistema de Control Escolar (Profesores y Cursos) |
| Versión | 1.0 |
| Fecha | Julio 2026 |
| Elaboró | Denisse Ilse Ramírez Canuto |
| SGBD | SQLServer |

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Profesores
- Cursos
- Especialidades de los profesores

Permite controlar la asignación de materias (cursos) a la plantilla docente de la universidad, así como las áreas de especialización de cada profesor.

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

**Tabla:** PROFESOR

**Descripción:** *Almacena los datos de identificación del personal docente*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProf | INT | - | PK, NN | Número de empleado único del profesor |
| Nombre | VARCHAR | 50 | NN | Nombre o nombres del profesor |
| Apellido_1 | VARCHAR | 20 | NN | Primer apellido del profesor |
| Apellido_2 | VARCHAR | 20 | NULL | Segundo apellido del profesor |

---

**Tabla:** Curso

**Descripción:** *Almacena el catálogo de materias o cursos ofertados*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num_Cursa | INT | - | PK, NN | Número o código único identificador del curso |
| Nombre_Curso | VARCHAR | 20 | NN | Nombre representativo de la materia |
| Creditos | INT | - | NN, CK(>0) | Créditos académicos asignados al curso |
| Num_Prof | INT | - | FK, NULL | Número del profesor asignado a impartir el curso |

---

**Tabla:** ESPECIALIDAD

**Descripción:** *Registra las diferentes especialidades técnicas o académicas de los profesores*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Nombre_Esp | INT | - | PK, NN | Código o identificador numérico de la especialidad |
| NumProf | INT | - | PK, FK, NN | Número del profesor asociado; parte de la clave compuesta |
| Nombre | VARCHAR | 30 | NN | Nombre de la especialidad (texto descriptivo) |

## 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| PROFESOR -> Curso | 1:N | Un profesor puede impartir varios cursos |
| PROFESOR -> ESPECIALIDAD | 1:N | Un profesor puede poseer múltiples especialidades |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Curso | Num_Prof | PROFESOR(NumProf) |
| ESPECIALIDAD | NumProf | PROFESOR(NumProf) |

## 7. INTEGRIDAD REFERENCIAL

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede asignar a un curso un Num_Prof que no exista en la tabla PROFESOR |
| IR-02 | No se puede registrar una especialidad ligada a un profesor inexistente |

## 8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un profesor puede impartir varios cursos |
| RN-02 | Un curso solamente puede ser impartido por un profesor |
| RN-03 | Puede existir un profesor que actualmente no imparta cursos (Participación parcial de Profesor en Imparte) |
| RN-04 | Todo curso activo debe tener asignado un profesor obligatoriamente (Participación total de Curso en Imparte) |

## 9. Diagrama Relacional  
![Diagrama relacional Ej2](/img/Relacional/Relacional02.png)