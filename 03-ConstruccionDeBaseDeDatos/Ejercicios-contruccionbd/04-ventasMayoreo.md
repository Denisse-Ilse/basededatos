```sql
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

-- La llave primaria compuesta (NumPedido, NumProducto) es necesaria
-- para poder tener varios productos por pedido (relación M:N real).
CREATE TABLE DETALLE_PEDIDO (
    NumPedido   INT NOT NULL,
    NumProducto INT NOT NULL,
    Cantidad    INT NOT NULL,
    Precio      DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (NumPedido, NumProducto),
    FOREIGN KEY (NumPedido) REFERENCES PEDIDO(NumeroPedido)
);
```