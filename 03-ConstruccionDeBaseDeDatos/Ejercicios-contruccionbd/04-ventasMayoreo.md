```sql
-- =========================================================
-- Base de datos: vnetasMayoreo
-- =========================================================

CREATE DATABASE ventasMayoreo;
USE ventasMayoreo;

CREATE TABLE CLIENTE (
    ID_Cliente INT PRIMARY KEY,
    Nombre     VARCHAR(50) NOT NULL
);

CREATE TABLE PEDIDO (
    NumeroPedido INT PRIMARY KEY,
    FechaPedido  DATE NOT NULL,
    ID_Cliente   INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente)
);


CREATE TABLE DETALLE_PEDIDO (
    NumPedido   INT NOT NULL,
    NumProducto INT NOT NULL,
    Cantidad    INT NOT NULL,
    Precio      DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (NumPedido, NumProducto),
    FOREIGN KEY (NumPedido) REFERENCES PEDIDO(NumeroPedido)
);
```
![Diagrama de base de datos](/img/Construccion/construccion04.jpg)