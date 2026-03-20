DELIMITER $$

CREATE PROCEDURE suma_saldos()
BEGIN

    DECLARE fin_bucle INT DEFAULT 0;
    DECLARE v_saldo DECIMAL(10,2);
    DECLARE total DECIMAL(10,2) DEFAULT 0;

    DECLARE cursor_saldo CURSOR FOR
    SELECT saldo FROM clientes;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin_bucle=1;

    OPEN cursor_saldo;

    bucle: LOOP

        FETCH cursor_saldo INTO v_saldo;

        IF fin_bucle=1 THEN
            LEAVE bucle;
        END IF;

        SET total = total + v_saldo;

    END LOOP;

    CLOSE cursor_saldo;

    SELECT total;

END;$$

DELIMITER ;