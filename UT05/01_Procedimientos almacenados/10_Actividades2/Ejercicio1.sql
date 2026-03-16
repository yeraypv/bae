DELIMITER $$

CREATE PROCEDURE precio_producto(IN pid INT)
BEGIN
    DECLARE _precio DECIMAL(10,2);

    SELECT precio INTO _precio
    FROM productos
    WHERE id_producto = pid;

    IF _precio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Producto no encontrado';
    ELSE
        SELECT _precio AS precio;
    END IF;
END;$$

DELIMITER ;
