DELIMITER $$ 

CREATE PROCEDURE subir_precio()
BEGIN

    DECLARE fin_bucle INT DEFAULT 0;
    DECLARE v_id INT;
    DECLARE v_precio DECIMAL(10,2);

    DECLARE cursor_precio CURSOR FOR
        SELECT id_producto,precio FROM productos;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_bucle=1;

    OPEN cursor_precio;

    bucle: LOOP

        FETCH cursor_precio INTO v_id,v_precio;

        IF fin_bucle=1 THEN
            LEAVE bucle;
        END IF;

        IF v_precio < 20 THEN
            UPDATE productos
            SET precio = precio * 1.10
            WHERE id_producto=v_id;
        END IF;

    END LOOP bucle;

    CLOSE cursor_precio;

END;$$

DELIMITER ;