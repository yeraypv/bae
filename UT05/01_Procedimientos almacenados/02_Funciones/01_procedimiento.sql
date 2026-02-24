DELIMITER $$

CREATE PROCEDURE mostrar_variable()
BEGIN
	DECLARE variable INT;
    SET variable = 7;
    SELECT variable;
END$$

DELIMITER ;
