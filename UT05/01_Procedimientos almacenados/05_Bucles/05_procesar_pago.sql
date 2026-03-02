DROP DATABASE IF EXISTS pagosdb;
CREATE DATABASE pagosdb;
USE pagosdb;

CREATE TABLE pagos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    intentos_realizados INT DEFAULT 0,
    estado VARCHAR(20) DEFAULT 'PENDIENTE'
);


-- DATOS DE PRUEBA
INSERT INTO pagos (intentos_realizados, estado)
VALUES (0, 'PENDIENTE');


DELIMITER $$

CREATE PROCEDURE procesar_pago(
    IN idPago INT
)
BEGIN
    DECLARE intentos INT DEFAULT 0;
    DECLARE pagado BOOLEAN DEFAULT FALSE;

    REPEAT

        -- Simulación intento de cobro
        SET intentos = intentos + 1;

        UPDATE pagos
        SET intentos_realizados = intentos
        WHERE id = idPago;

        -- Simulación: si intentos >= 2 se cobra correctamente
        IF intentos >= 2 THEN
            SET pagado = TRUE;
            UPDATE pagos SET estado = 'PAGADO' WHERE id = idPago;
        END IF;

    UNTIL pagado = TRUE OR intentos >= 3
    END REPEAT;

    IF pagado = FALSE THEN
        UPDATE pagos SET estado = 'FALLIDO' WHERE id = idPago;
    END IF;

END;$$

DELIMITER ;