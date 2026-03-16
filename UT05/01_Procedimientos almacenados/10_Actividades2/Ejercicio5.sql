DELIMITER $$

CREATE PROCEDURE actualizar_stock(
    IN pid INT,
    IN cantidad INT
)
BEGIN

    IF cantidad < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Cantidad negativa no permitida';
    END IF;

    UPDATE productos
    SET stock = stock + cantidad
    WHERE id_producto=pid;

END;$$

DELIMITER ;