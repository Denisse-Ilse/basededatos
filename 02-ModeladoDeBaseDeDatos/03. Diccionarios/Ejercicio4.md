# Diccionario de Datos de base de datos control comercial

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto| Sistema de Gestión de Ventas al por Mayor |
| Versión | 1.0 |
| Fecha | Julio 2026 |
| Elaboró | Denisse Ilse Ramírez Canuto |
| SGBD | SQLServer |

## 2. Descripción del Sistema de Base de Datos

El sistema administra:

- Clientes (Personas morales)
- Pedidos de ventas
- Detalles de cada pedido (Detalle_Pedido)
- Catálogo de productos

Permite controlar el flujo comercial de la empresa, desde la asignación de un pedido a un cliente hasta el desglose pormenorizado de los artículos y cantidades vendidas.

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

**Tabla:** CLIENTE

**Descripción:** *Almacena la información de las personas morales que compran al por mayor*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| ID_Cliente | INT | - | PK, NN | Identificador único y exclusivo del cliente |
| Nombre | VARCHAR | 150 | NN | Razón social o nombre de la persona moral |

---

**Tabla:** PEDIDO

**Descripción:** *Registra las órdenes de venta generales generadas en el sistema*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumeroPedido | INT | - | PK, NN | Código numérico correlativo único del pedido |
| FechaPedido | DATE | - | NN, DF(GETDATE()) | Fecha exacta en la que se levantó el pedido |
| ID_Cliente | INT | - | FK, NN | Identificador del cliente que realizó la compra |

---

**Tabla:** DETALLE_PEDIDO

**Descripción:** *Tabla intermedia encargada de desglosar los productos incluidos en cada pedido*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumPedido | INT | - | PK, FK1, NN | Número del pedido; parte de la clave compuesta |
| NumProducto | INT | - | PK, FK2, NN | Número del producto; parte de la clave compuesta |
| Cantidad | INT | - | NN, CK(>0) | Cantidad total de unidades vendidas de ese producto |
| Precio | DECIMAL | 10,2 | NN, CK(>=0) | Precio unitario acordado para la venta en este pedido |

---

**Tabla:** PRODUCTO (Entidad implícita en reglas del negocio)

**Descripción:** *Catálogo general de los productos ofertados por la distribuidora*

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NumProducto | INT | - | PK, NN | Código único asignado al producto de forma interna |
| Nombre | VARCHAR | 100 | NN | Nombre representativo o comercial del producto |
| Precio_Base | DECIMAL | 10,2 | NN, CK(>=0) | Precio de lista o catálogo sugerido para el producto |

## 5. Relaciones

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| CLIENTE -> PEDIDO | 1:N | Un cliente puede efectuar múltiples pedidos de compra |
| PEDIDO -> DETALLE_PEDIDO | 1:N | Un pedido contiene una o muchas líneas de detalle |
| PRODUCTO -> DETALLE_PEDIDO | 1:N | Un producto puede estar presente en diversos detalles de pedidos |

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| PEDIDO | ID_Cliente | CLIENTE(ID_Cliente) |
| DETALLE_PEDIDO | NumPedido | PEDIDO(NumeroPedido) |
| DETALLE_PEDIDO | NumProducto | PRODUCTO(NumProducto) |

## 7. INTEGRIDAD REFERENCIAL

| Regla | Descripción |
| :--- | :--- |
| IR-01 | No se puede asentar un pedido vinculándolo a un ID_Cliente inexistente |
| IR-02 | El registro de un desglose en DETALLE_PEDIDO se rechaza si NumPedido no es válido |
| IR-03 | No se puede incorporar un producto a un detalle de pedido si NumProducto no existe en el catálogo |

## 8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar muchos pedidos |
| RN-02 | Cada pedido pertenece única y estrictamente a un cliente |
| RN-03 | Un pedido contiene obligatoriamente uno o varios productos (Participación total de Pedido en el detalle) |
| RN-04 | Un producto puede aparecer listado en muchos pedidos a lo largo del tiempo |
| RN-05 | Un producto puede estar dado de alta y no registrar ninguna venta actual (Participación parcial de Producto) |
| RN-06 | La existencia de una línea en DETALLE_PEDIDO depende estrictamente de la presencia previa del pedido y del producto relacionados |

## 9. Diagrama Relacional  

![Diagrama relacional Ej4](/img/Relacional/Relacional04.jpeg)