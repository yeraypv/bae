CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    saldo DECIMAL(10,2)
);

CREATE TABLE productos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    precio DECIMAL(10,2),
    stock INT
);

INSERT INTO clientes (nombre, saldo) VALUES
('Ana', 500),
('Luis', 50);

INSERT INTO productos (nombre, precio, stock) VALUES
('Portátil', 400, 5),
('Ratón', 20, 10);

DELIMITER $$

CREATE PROCEDURE ComprarProducto(
    IN id_cliente INT,
    IN id_producto INT,
    IN num_productos INT
)
BEGIN
    DECLARE _precio DECIMAL(10,2);
    DECLARE _stock INT;
    DECLARE _saldo DECIMAL(10,2);

    START TRANSACTION;

    -- Obtener datos del producto y del cliente
    SELECT precio, stock INTO _precio, _stock
    FROM productos
    WHERE id = id_producto;

    SELECT saldo INTO _saldo
    FROM clientes
    WHERE id = id_cliente;

    -- Validaciones
    IF _stock >= num_productos AND _saldo >= (_precio * num_productos) THEN

        -- Descontar saldo del cliente
        UPDATE clientes
        SET saldo = saldo - (_precio * num_productos)
        WHERE id = id_cliente;

        -- Descontar stock de productos
        UPDATE productos
        SET stock = stock - num_productos
        WHERE id = id_producto;

        COMMIT;
        SELECT 'Compra realizada correctamente' AS mensaje;

    ELSE
        -- Deshacemos la operación ya que no hay stock o el saldo es insuficiente.
        ROLLBACK;
        SELECT 'No se pudo realizar la compra' AS mensaje;
    END IF;

END$$

DELIMITER ;