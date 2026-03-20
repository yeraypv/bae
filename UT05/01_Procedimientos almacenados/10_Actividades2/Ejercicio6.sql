DELIMITER $$

CREATE PROCEDURE crear_pedido(
    IN p_cliente INT
)
BEGIN

    -- Obtenemos una excepcion genérica al intentar crear el pedido.
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    SELECT 'Error al crear el pedido' AS Mensaje;

    INSERT INTO pedidos(id_cliente,fecha,total)
    VALUES(p_cliente,CURDATE(),0);

END;$$

DELIMITER ;
