DELIMITER $$

CREATE FUNCTION existeDetallePedido(_idProducto INT)
RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE idPedido INT;

    SELECT id_pedido INTO idPedido 
    FROM detalle_pedido 
    WHERE id_producto=_idProducto;

    RETURN idPedido IS NOT NULL;

END;$$

DELIMITER $$

CREATE TRIGGER evitar_borrado_producto
BEFORE DELETE ON productos
FOR EACH ROW
BEGIN

    IF existeDetallePedido(OLD.id_producto) = TRUE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Producto ya vendido, no se puede eliminar';
    END IF;

END;$$

DELIMITER ;