DELIMITER $$

CREATE PROCEDURE poco_stock()
BEGIN

    DECLARE fin_bucle INT DEFAULT 0;
    DECLARE v_nombre VARCHAR(50);
    DECLARE v_stock INT;

    DECLARE cursor_stock CURSOR FOR
        SELECT nombre,stock FROM productos;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_bucle=1;

    OPEN cursor_stock;

    bucle: LOOP

        FETCH cursor_stock INTO v_nombre,v_stock;

        IF fin_bucle=1 THEN
            LEAVE bucle;
        END IF;

        IF v_stock < 10 THEN
            SELECT v_nombre,v_stock;
        END IF;

    END LOOP;

    CLOSE cursor_stock;

END;$$

DELIMITER ;