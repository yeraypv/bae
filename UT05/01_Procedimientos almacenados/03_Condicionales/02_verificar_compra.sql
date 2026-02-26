DELIMITER $$

CREATE PROCEDURE verificar_compra(
    IN activo BOOLEAN,
    IN saldo DECIMAL(10,2),
    IN total DECIMAL(10,2)
)
BEGIN

    IF activo = TRUE AND saldo >= total THEN
        
        IF total >= 100 THEN
            SELECT 'Compra permitida con posible descuento' AS mensaje;
        ELSE
            SELECT 'Compra permitida sin descuento' AS mensaje;
        END IF;

    ELSE
        SELECT 'No puede realizar la compra' AS mensaje;
    END IF;

END;$$

DELIMITER ;