DELIMITER $$

CREATE TRIGGER comprobar_stock
BEFORE INSERT ON detalle_pedido
FOR EACH ROW
BEGIN

    DECLARE _stock INT;

    SELECT stock INTO _stock
    FROM productos
    WHERE id_producto = NEW.id_producto;

    IF _stock < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Stock insuficiente';
    END IF;

END;$$

DELIMITER ;