DELIMITER $$

CREATE PROCEDURE total_vendido()
BEGIN

    DECLARE fin_bucle INT DEFAULT 0;
    DECLARE v_id INT;

    DECLARE cursor_pedido CURSOR FOR
    SELECT id_producto FROM productos;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_bucle=1;

    OPEN cursor_pedido;

    bucle: LOOP

        FETCH cursor_pedido INTO v_id;

        IF fin_bucle=1 THEN
            LEAVE bucle;
        END IF;

        SELECT id_producto, SUM(cantidad) AS cantidad_vendida
        FROM detalle_pedido
        WHERE id_producto=v_id;

    END LOOP bucle;

    CLOSE cursor_pedido;

END $$

DELIMITER ;