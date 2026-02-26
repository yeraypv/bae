DELIMITER $$

CREATE PROCEDURE acceso_premium(
    IN nivel VARCHAR(20),
    IN puntos INT,
    IN bloqueado BOOLEAN
)
BEGIN

    IF nivel = 'gold' OR puntos >= 500 THEN
        
        IF bloqueado = FALSE THEN
            SELECT 'Acceso premium concedido' AS mensaje;
        ELSE
            SELECT 'Usuario bloqueado' AS mensaje;
        END IF;

    ELSE
        SELECT 'No tiene permisos premium' AS mensaje;
    END IF;

END;$$

DELIMITER ;