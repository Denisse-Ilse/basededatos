# Construccion de Base de Datos con Lenguaje SQL
El lenguaje SQL(Structure Query Language), se divide en cinco grandes categorias:

1. DDL( Data Definition Language)
2. DML(Data Manipulation Language)
3. DQL (Data Query Language)
4. DCL(Data Control Language -Controla permisos) - GRANT,REVOKE
5. TCL(Transaction Control Language - Controla Transacciones) -BEGIN TRANSACTION, COMMIT, ROLLBACK,SAVEPOINT

## SQL-DDL

**Lenguaje de Definicion de Datos**

Se utilizas para **crear y modificar la estructura** de una base de datos

Con DDL tabajamos sobre los objetos de la base de dtos:

- _Base de datos_
- _Tablas_
- _Restricciones_
- Vistas
- Esquemas
- Store Procedures
- Funciones
- Triggers

**Comando Principales**

 Comando | Funcion |
| :--- | :--- |
| CREATE| Crea objetos de la base de datos |
| ALTER| Modifica objestos de la base de datos|
| DROP | Elimina objetos de la base de datos |
| TRUNCATE | Vacia una tabla |
| RENAME | Renombra Objrtos (Segun el SGBD) |

## SQL-DML

**Lenguaje de Manipulacion de Datos**

Sireve para **trabajar con la informacion almacenada**

Con este lenguaje no se cambia la estructur, si no los registros

**Comando Principales**

 Comando | Funcion |
| :--- | :--- |
| INSERT| Inserta Registros |
| UpDATE| Actualiza Registros|
| DELETE| Elimina Registros|


## SQL-DQL

**Lenguaje de COnsulta de Datos**

Su funcion es **consultar informacion**


Este es probablemente el grupo mas utilizado

**Comando Principal**

**Comando Principales**

 Comando | Funcion |
| :--- | :--- |
| SELECT| Consultar Innformacion |

Generalmente se combina con:
 - WHERE
 - ORDER BY
 - GROUP BY
 - HAVING
 - JOIN (LEFT, RIGHT, INNER, FULL, CROSS)
 - DISTINCT
 - TOP/LIMIT
 - Funciones de AGREGADO (SUM, AVG, MIN, MAX, COUNT)
 - Window Functions( Funciones de ventana).

 ## Nomenclatura para la construccion de las Bases de Datos( Snake case)
La nomenclatura o convencion que mas se recomienda hoy su se busca una nomenclatura mdoerna, 
protable y alineada con buenas parcticas en disstintos motores de base de datos

La razon es que funciona de forma consistente en **SQL SERVER, MYSQL o MARIADB** y especialmente es **POSTGRESQL**, donde los identificadores sin comillas se convierten automaticamente a 
minusculas, Con **snake_case** evitas problemas de mayusculas y haces que las consultas sean mas
legibles.



 | Objeto | Convencion | Ejemplo |
| :--- | :---: | :--- |
| Base de Datos | snake_case| control_escolar |
| Esquema | snake_case| ventas, rh, seguridad |
| Tabla | Singular en snake_case| Cliente, pedido, etalle_pedido |
| Columna | snake_case| cliente_id, fecha_registro, correo_electronico |
| PK | <tabla>_id| cliente_id, producto_id|
| FK | Igual que la PK referenciada| cliente_id, categoria_id |
| Tabla Puente | <tabla1>_<tabla2>| alumno_curso, producto_proveedor |


## Nombrar las Restricciones

- pk_cliente
- fk_pedido_cliente
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo
- ix_pedido_fecha

**Prefijos**

- pk(Primary key)
- fk(Foreing Key)
- uq(Unique)
- ck(check)
- df(default)
- ix(index)


## ALTER TABBLE

Permite modificar una tabla existente

puede:
 - Agregar columnas
 - Eliminar coolumnas
 - Modificar columnas
 - Agregar restricciones
 - Eliminar restriccionestelefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'