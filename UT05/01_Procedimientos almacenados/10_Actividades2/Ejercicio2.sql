DELIMITER $$

CREATE PROCEDURE comprar(
    IN p_cliente INT,
    IN p_producto INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_precio DECIMAL(10,2);
    DECLARE v_saldo DECIMAL(10,2);

    SELECT precio INTO v_precio
    FROM productos
    WHERE id_producto=p_producto;

    IF v_precio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Producto no existe';
    END IF;

    SELECT saldo INTO v_saldo
    FROM clientes
    WHERE id_cliente=p_cliente;

    IF v_saldo < (v_precio*p_cantidad) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Saldo insuficiente';
    END IF;
END;$$

DELIMITER ;

