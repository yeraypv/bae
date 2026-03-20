DELIMITER $$ 

CREATE PROCEDURE reponer_stock()
BEGIN
    DECLARE fin_bucle INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_stock INT;

    DECLARE cursor_stock CURSOR FOR
        SELECT id_producto,stock FROM productos;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_bucle=1;

    OPEN cursor_stock;

    bucle: LOOP

        FETCH cursor_stock INTO v_id,v_stock;

        IF fin_bucle=1 THEN
            LEAVE bucle;
        END IF;

        IF v_stock < 5 THEN
            UPDATE productos
            SET stock = 20
            WHERE id_producto=v_id;
        END IF;

    END LOOP;

    CLOSE cursor_stock;

END;$$

DELIMITER ;