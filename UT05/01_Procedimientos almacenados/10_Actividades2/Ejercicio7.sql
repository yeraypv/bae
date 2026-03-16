SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION existePedidosCliente(
    p_idcliente INT
) RETURNS BOOLEAN
BEGIN 

    DECLARE id INT;

    SELECT id_cliente INTO id FROM pedidos
    WHERE id_cliente=p_idcliente;

    return (id IS NOT NULL);

END;$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE eliminar_cliente(
    IN pid INT
)
BEGIN

    IF existePedidosCliente(pid) = TRUE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='El cliente tiene pedidos';
    END IF;

    -- En el caso de que no haya pedidos eliminamos los registros.
    DELETE FROM clientes
    WHERE id_cliente=pid;

END;$$

DELIMITER ;
