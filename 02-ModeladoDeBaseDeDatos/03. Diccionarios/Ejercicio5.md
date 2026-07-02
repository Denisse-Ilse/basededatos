# Diccionario de Datos de base de datos control empresarial

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto| Sistema de Gestión Empresarial (Company) |
| Versión | 1.0 |
| Fecha | Julio 2026 |
| Elaboró | Denisse Ilse Ramírez Canuto |
| SGBD | SQLServer |

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Employe (Empleados y supervisores)
- Department (Departamentos)
- Locations (Ubicaciones de los departamentos)
- Proyects (Proyectos organizacionales)
- Dependent (Dependientes familiares para seguros)
- Works-on (Asignación de horas trabajadas en proyectos)

Permite controlar la estructura corporativa global, los esquemas de supervisión interna, la planeación de proyectos por departamento y el registro de los beneficiarios del seguro de cada empleado.

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

**Tabla:** EMPLOYE

**Descripción:** *Almacena la información de identidad, salario y adscripción de los empleados*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Ssn | VARCHAR | 11 | PK, NN | Número de Seguro Social; identificador único del empleado |
| Firstaname | VARCHAR | 50 | NN | Primer nombre del empleado |
| Last_name | VARCHAR | 50 | NN | Apellido del empleado |
| Address | VARCHAR | 100 | NN | Dirección de residencia |
| Bdote | DATE | - | NN | Fecha de nacimiento del empleado |
| Salary | DECIMAL | 10,2 | NN, CK(>0) | Salario asignado |
| sex | CHAR | 1 | NN, CK('M', 'F') | Género o sexo biológico |
| jef_fk | VARCHAR | 11 | FK, NULL | SSN del supervisor directo (autorreferencial) |
| Number_Dep | INT | - | FK, NN | Número del departamento al que pertenece el empleado |
| Name_Dep_FK | VARCHAR | 100 | FK, NN | Nombre del departamento al que pertenece el empleado |

---

**Tabla:** DEPARTMENT

**Descripción:** *Almacena los datos principales de las áreas o departamentos corporativos*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, NN | Número único de identificación del departamento |
| Name | VARCHAR | 100 | UQ, NN | Nombre oficial y único del departamento |
| Manager_FK | VARCHAR | 11 | FK, UQ, NN | SSN del empleado que funge como gerente actual |
| Stardate | DATE | - | NN | Fecha de inicio del gerente en el cargo |
| SSn_FK | VARCHAR | 11 | FK, NN | Clave foránea de control que conecta con la tabla Employe |
| Stardate_alt | DATE | - | NN | Campo complementario de fecha de control |

---

**Tabla:** LOCATIONS

**Descripción:** *Registra los múltiples sitios o sedes de los departamentos*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numlocation | INT | - | PK, NN | Identificador o código secuencial de la ubicación |
| NumberDep_FK_PK | INT | - | PK, FK, NN | Número del departamento asociado; parte de la clave compuesta |
| NameDep_FK_PK | VARCHAR | 100 | FK, NN | Nombre del departamento asociado como referencia |
| Localhost | VARCHAR | 100 | NN | Dirección física o nombre de la sede |

---

**Tabla:** PROYECTS

**Descripción:** *Registra los proyectos de desarrollo que controla la organización*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Number | INT | - | PK, NN | Número identificador único del proyecto |
| Name | VARCHAR | 100 | UQ, NN | Nombre único del proyecto corporativo |
| Location | VARCHAR | 100 | NN | Sede o lugar donde se ejecuta el proyecto |
| NumberDop_Fk | INT | - | FK, NN | Número del departamento encargado de controlarlo |
| Name_def_FK | VARCHAR | 100 | FK, NN | Nombre del departamento que administra el proyecto |

---

**Tabla:** DEPENDENT

**Descripción:** *Almacena los beneficiarios familiares a cargo de los empleados para el seguro*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Name | VARCHAR | 50 | PK, NN | Primer nombre del dependiente; parte de la clave compuesta |
| Sex_FX_PX_NOT_NULL | CHAR | 1 | PK, FK, NN | Sexo del dependiente y enlace de integridad con el empleado |
| Relationship | VARCHAR | 50 | NN | Tipo de relación o parentesco familiar (Hijo, Hija, Cónyuge, etc.) |
| Bdate | DATE | - | NN | Fecha de nacimiento del dependiente |

---

**Tabla:** Works-on

**Descripción:** *Tabla de rompimiento que registra las horas dedicadas por los empleados a los proyectos*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| SSN_FK | VARCHAR | 11 | PK, FK1, NN | SSN del empleado asignado al proyecto |
| Number_Pros_FK_PK | INT | - | PK, FK2, NN | Número del proyecto asignado |
| Name_Pros | VARCHAR | 100 | NN | Nombre del proyecto como referencia complementaria |
| Hours | DECIMAL | 4,1 | NN, CK(>=0) | Horas semanales trabajadas actualmente en el proyecto |

## 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| DEPARTMENT -> EMPLOYE | 1:N | Un departamento cuenta con muchos empleados integrados |
| EMPLOYE -> EMPLOYE (jef_fk) | 1:N | Un empleado supervisa de forma directa a muchos empleados |
| EMPLOYE -> DEPARTMENT | 1:1 | Un empleado administra como mánager un único departamento |
| DEPARTMENT -> LOCATIONS | 1:N | Un departamento puede tener asignadas varias ubicaciones físicas |
| DEPARTMENT -> PROYECTS | 1:N | Un departamento controla y administra una cantidad de proyectos |
| EMPLOYE -> DEPENDENT | 1:N | Un empleado puede registrar múltiples dependientes para su seguro |
| EMPLOYE -> Works-on | 1:N | Un empleado puede trabajar en varios proyectos simultáneamente |
| PROYECTS -> Works-on | 1:N | Un proyecto puede contar con muchos empleados trabajando en él |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| EMPLOYE | jef_fk | EMPLOYE(Ssn) |
| EMPLOYE | Number_Dep | DEPARTMENT(Number) |
| DEPARTMENT | Manager_FK | EMPLOYE(Ssn) |
| LOCATIONS | NumberDep_FK_PK | DEPARTMENT(Number) |
| PROYECTS | NumberDop_Fk | DEPARTMENT(Number) |
| DEPENDENT | Sex_FX_PX_NOT_NULL| EMPLOYE(Ssn) |
| Works-on | SSN_FK | EMPLOYE(Ssn) |
| Works-on | Number_Pros_FK_PK | PROYECTS(Number) |

## 7. INTEGRIDAD REFERENCIAL

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede registrar un empleado asignado a un Number_Dep (departamento) inexistente |
| IR-02 | El supervisor (jef_fk) de un empleado debe corresponder a un Ssn existente en la tabla EMPLOYE |
| IR-03 | El mánager asignado a un departamento debe contar con un Ssn válido registrado con anterioridad |
| IR-04 | No se pueden definir ubicaciones para un departamento que no esté registrado |
| IR-05 | Cada proyecto debe asociarse obligatoriamente a un departamento vigente |
| IR-06 | No se permiten registros de horas de trabajo si el empleado o el proyecto no existen |

## 8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Cada departamento tiene un nombre único, un número único y un empleado particular que lo dirige |
| RN-02 | Un departamento puede tener asociadas varias ubicaciones físicas distintas |
| RN-03 | Un departamento controla una cantidad de proyectos, cada uno de los cuales tiene un nombre y número únicos |
| RN-04 | Un empleado está asignado exactamente a un solo departamento, pero puede trabajar en varios proyectos |
| RN-05 | Los proyectos en los que trabaja un empleado no están necesariamente controlados por el mismo departamento donde este labora |
| RN-06 | Se debe llevar el control del número actual de horas por semana que un empleado trabaja en cada proyecto |
| RN-07 | Se debe registrar el supervisor directo de cada empleado, el cual es otro empleado de la empresa |
| RN-08 | Los dependientes no pueden existir en el sistema sin su correspondiente empleado responsable (fines de seguro) |

## 9. Diagrama Relacional  

![Diagrama relacional Ej5](/img/Relacional/Relacional05.png)

**Version 2:**  


![Diagrama relacional Ej5](/img/Relacional/Relacional06.jpg)