
DELIMITER $$

CREATE PROCEDURE listar_clientes()
BEGIN

    DECLARE fin_bucle INT DEFAULT 0;
    DECLARE v_nombre VARCHAR(50);
    DECLARE v_saldo DECIMAL(10,2);

    DECLARE cursor_clientes CURSOR FOR
        SELECT nombre,saldo FROM clientes;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_bucle=TRUE;

    OPEN cursor_clientes;

    bucle: LOOP
        FETCH cursor_clientes INTO v_nombre,v_saldo;

        IF fin_bucle = TRUE THEN
            LEAVE bucle;
        END IF;

        SELECT v_nombre,v_saldo;
    END LOOP bucle;

    CLOSE cursor_clientes;

END;$$

DELIMITER ;
