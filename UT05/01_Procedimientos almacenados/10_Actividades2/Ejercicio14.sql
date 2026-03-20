DELIMITER $$

CREATE TRIGGER descontar_saldo
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
    DECLARE saldoActual DECIMAL(10,2);

    SELECT saldo INTO saldoActual 
    FROM clientes
    WHERE id_cliente = NEW.id_cliente;

    IF saldoActual - NEW.total < 0 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='El saldo actual del cliente no es sufiente para realizar el pedido';
    END IF;

    UPDATE clientes
    SET saldo = saldo - NEW.total
    WHERE id_cliente=NEW.id_cliente;
END;$$

DELIMITER ;
