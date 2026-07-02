# Diccionario de Datos de base de datos control escolar institucional

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto| Sistema de Control Escolar y Académico Integrado |
| Versión | 2.0 (Actualizado) |
| Fecha | Julio 2026 |
| Elaboró | Denisse Ilse Ramírez Canuto |
| SGBD | SQLServer |

## 2. Descripción del Sistema de Base de Datos

El sistema administra la información de la comunidad universitaria: los alumnos (junto a sus datos de contacto y credenciales), las asignaturas académicas que cursan, la plantilla de profesores adscrita a sus departamentos correspondientes, sus familiares dependientes y el control de los proyectos institucionales en los que colaboran de manera activa.

## 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key (Llave Primaria) |
| FK | Foreign Key (Llave Foránea) |
| NN | Not Null (No Nulo) |
| UQ | Unique (Único) |
| CK | Check (Validación) |
| DF | Default (Por Defecto) |

## 4. Diccionario de Datos

**Tabla:** Alumno

**Descripción:** *Almacena los datos personales e identificadores principales de los estudiantes*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 15 | PK, NN | Identificador único del alumno |
| Nom Alumno | VARCHAR | 50 | NN | Nombre o nombres del estudiante |
| Ap 1 Alumno | VARCHAR | 30 | NN | Primer apellido del alumno |
| Ap2 Alumno | VARCHAR | 30 | NULL | Segundo apellido del alumno |
| Fecha Naci | DATE | - | NN | Fecha de nacimiento del alumno |
| Correo | VARCHAR | 100 | UQ, NN | Correo electrónico institucional |

---

**Tabla:** Telefono

**Descripción:** *Almacena los números telefónicos asociados a los alumnos (Atributo multivalorado)*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Clave Tel | INT | - | PK, NN | Identificador único del registro telefónico |
| Matricula | VARCHAR | 15 | FK, NN | Matrícula del alumno dueño de la línea telefónica |
| Telefono | VARCHAR | 15 | NN | Número telefónico |

---

**Tabla:** Credencial

**Descripción:** *Registra los documentos de identificación vigentes asignados a cada alumno*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num Credencial PK | VARCHAR | 20 | PK, NN | Número único de la credencial física |
| Fecha Expediente | DATE | - | NN | Fecha en la que se emitió el documento |
| Vigencia | DATE | - | NN | Fecha de vencimiento de la credencial |
| Matricula | VARCHAR | 15 | FK, UQ, NN | Matrícula del alumno al que pertenece (Relación 1:1) |

---

**Tabla:** Materia

**Descripción:** *Catálogo general de las asignaturas impartidas en la institución*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Clave materia | VARCHAR | 10 | PK, NN | Código único identificador de la asignatura |
| Nombre Materia | VARCHAR | 80 | NN | Nombre representativo de la materia |
| Creditos | INT | - | NN, CK(>=0) | Cantidad de créditos académicos que aporta |

---

**Tabla:** Cursa

**Descripción:** *Tabla intermedia que registra la inscripción e historial de materias por alumno*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula FK | VARCHAR | 15 | PK, FK1, NN | Matrícula del alumno inscrito |
| Clave Materia FK | VARCHAR | 10 | PK, FK2, NN | Clave de la materia que está cursando |
| Fecha Inscri | DATE | - | NN, DF(GETDATE()) | Fecha oficial del registro a la asignatura |
| Cali Final | DECIMAL | 4,2 | NULL, CK(>=0 AND <=10) | Calificación definitiva del periodo |

---

**Tabla:** Profesor

**Descripción:** *Registra el personal docente y de investigación de la institución*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num Prof | INT | - | PK, NN | Número de empleado único del docente |
| Nombre | VARCHAR | 50 | NN | Nombre o nombres del profesor |
| Ap 1 | VARCHAR | 30 | NN | Primer apellido |
| Ap 2 | VARCHAR | 30 | NULL | Segundo apellido |

---

**Tabla:** Departamento

**Descripción:** *Divisiones organizacionales y académicas de la institución*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num Departamento | INT | - | PK, NN | Identificador único del departamento |
| Nombre Departa | VARCHAR | 60 | UQ, NN | Nombre oficial de la división académica |
| Edificio | VARCHAR | 30 | NN | Nombre o sigla del bloque donde se ubica |

---

**Tabla:** Dependent

**Descripción:** *Almacena los datos de los familiares a cargo del profesorado*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Nonbre Depen | VARCHAR | 50 | PK, NN | Nombre del dependiente; parte de la clave compuesta |
| Fecha Naci | DATE | - | NN | Fecha de nacimiento del dependiente |
| Parentesco | VARCHAR | 30 | NN | Tipo de relación familiar (Hijo, Cónyuge, etc.) |

---

**Tabla:** Proyecto

**Descripción:** *Catálogo de proyectos institucionales financiados*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num Proy | INT | - | PK, NN | Número de folio identificador único del proyecto |
| Nombre | VARCHAR | 100 | NN | Título u objeto del proyecto |
| Presupuesto | DECIMAL | 14,2 | NN, CK(>=0) | Recursos económicos asignados |

---

**Tabla:** Participa

**Descripción:** *Tabla intermedia para desglosar la colaboración de profesores en proyectos*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Num Prot FK | INT | - | PK, FK1, NN | Número de empleado del profesor (Apuntando a Num Prof) |
| Num Proy FK | INT | - | PK, FK2, NN | Número de folio del proyecto asignado |
| Rol | VARCHAR | 50 | NN | Puesto o función desempeñada en la investigación |

## 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Alumno -> Telefono | 1:N | Un alumno puede tener registrados varios teléfonos |
| Alumno -> Credencial | 1:1 | Un alumno posee una única credencial oficial |
| Alumno -> Cursa | 1:N | Un estudiante puede cursar múltiples asignaturas |
| Materia -> Cursa | 1:N | Una materia puede ser cursada por muchos alumnos |
| Materia -> Profesor | N:1 | Un profesor puede dictar múltiples materias en el ciclo |
| Departamento -> Profesor | 1:N | Un departamento coordina a muchos profesores |
| Profesor -> Dependent | 1:N | Un profesor puede reportar múltiples dependientes económicos |
| Profesor -> Participa | 1:N | Un profesor colabora en uno o varios proyectos institucionales |
| Proyecto -> Participa | 1:N | Análogamente, un proyecto vincula a múltiples profesores |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Telefono | Matricula | Alumno(Matricula) |
| Credencial | Matricula | Alumno(Matricula) |
| Cursa | Matricula FK | Alumno(Matricula) |
| Cursa | Clave Materia FK | Materia(Clave materia) |
| Participa | Num Prot FK | Profesor(Num Prof) |
| Participa | Num Proy FK | Proyecto(Num Proy) |

*Nota aclaratoria sobre el diagrama:* Para mantener la coherencia semántica estricta del modelo físico, la tabla `Dependent` requiere una FK hacia `Profesor(Num Prof)`, y la tabla `Profesor` requiere una FK hacia `Departamento(Num Departamento)`.

## 7. INTEGRIDAD REFERENCIAL

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar un teléfono si la `Matricula` no existe previamente en `Alumno` |
| IR-02 | Cualquier línea añadida en `Cursa` será rechazada si la combinación de alumno o materia es inválida |
| IR-03 | Un profesor no puede ser asignado a un departamento inexistente corporativamente |
| IR-04 | Si un profesor es removido, sus relaciones en cascada para dependientes y participaciones vigentes deben limpiarse según las políticas del SGBD |

## 8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | La subdivisión del nombre completo del alumno se realiza de forma atómica en los atributos `Nom Alumno`, `Ap 1 Alumno` y `Ap2 Alumno` |
| RN-02 | Un alumno puede inscribirse a muchas materias, y cada materia acumula a múltiples alumnos inscritos por ciclo |
| RN-03 | La credencial posee una relación uno a uno estricta, lo que imposibilita duplicar la matrícula en diferentes plásticos activos |
| RN-04 | Las asignaciones monetarias registradas en el campo `Presupuesto` de los proyectos no admiten valores negativos |
| RN-05 | La tabla `Participa` detalla explícitamente el `Rol` operativo de cada profesor durante su estancia en un proyecto |