CREATE TABLE cuentas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titular VARCHAR(50),
    saldo DECIMAL(10,2)
);

INSERT INTO cuentas (titular, saldo) VALUES
('Ana', 1000.00),
('Luis', 500.00);

DELIMITER $$

CREATE PROCEDURE Transferencia(
    IN id_cuenta_origen INT,
    IN id_cuenta_destino INT,
    IN importe_transferencia DECIMAL(10,2)
)
BEGIN
    DECLARE saldo_origen DECIMAL(10,2);

    START TRANSACTION;

    -- Obtener saldo
    SELECT saldo INTO saldo_origen
    FROM cuentas
    WHERE id = id_cuenta_origen;

    IF saldo_origen >= importe_transferencia THEN

        -- Resta saldo cuenta origen
        UPDATE cuentas
        SET saldo = saldo - importe_transferencia
        WHERE id = id_cuenta_origen;

        -- Añade saldo cuenta destino
        UPDATE cuentas
        SET saldo = saldo + importe_transferencia
        WHERE id = id_cuenta_destino;

        COMMIT;
        SELECT 'Transferencia realizada' AS mensaje;

    ELSE
        -- Si no hay saldo sufiente deshacemos al operación
        ROLLBACK;
        SELECT 'Saldo insuficiente' AS mensaje;
    END IF;

END$$

DELIMITER ;


