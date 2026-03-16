SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION existeCliente(
    p_idcliente INT
) RETURNS BOOLEAN
BEGIN
    DECLARE existeId INT;

    SELECT COUNT(*) INTO existeId 
    FROM clientes 
    WHERE id_cliente = p_idcliente;

    RETURN (existeId > 0); 

END;$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE obtenerPrecioStock(
    IN p_producto INT,
    OUT v_precio DECIMAL(10,2),
    OUT v_stock INT
)
BEGIN
    SELECT precio,stock INTO v_precio,v_stock
    FROM productos
    WHERE id_producto=p_producto;
END;$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE obtenerSaldo(
    IN p_cliente INT,
    OUT v_saldo DECIMAL(10,2)
)
BEGIN
    SELECT saldo INTO v_saldo
    FROM clientes
    WHERE id_cliente=p_cliente;
END;$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE comprar_e3(
    IN p_cliente INT,
    IN p_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_stock INT;
    DECLARE v_saldo DECIMAL(10,2);
    DECLARE v_existeCliente BOOLEAN;

    IF (existeCliente(p_cliente) = TRUE) THEN

        CALL obtenerPrecioStock(p_producto, v_precio, v_stock);

        IF v_precio IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Producto no existe';
        END IF;

        IF v_stock < p_cantidad THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Stock insuficiente';
        END IF;

        CALL obtenerSaldo(p_cliente, v_saldo);

        IF v_saldo < (v_precio*p_cantidad) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT='Saldo insuficiente';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='El cliente no existe';
    END IF;

END;$$

DELIMITER ;
