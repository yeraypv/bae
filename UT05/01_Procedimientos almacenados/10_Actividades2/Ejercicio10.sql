DELIMITER $$ 

CREATE TRIGGER actualizar_total
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN

    UPDATE pedidos
    SET total = total + (
        SELECT precio FROM productos
        WHERE id_producto=NEW.id_producto
    ) * NEW.cantidad
    WHERE id_pedido=NEW.id_pedido;

END;$$

DELIMITER ;