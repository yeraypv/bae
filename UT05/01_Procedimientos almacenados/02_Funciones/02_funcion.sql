DELIMITER $$

CREATE FUNCTION mostrar_variable_funcion() RETURNS INT
BEGIN
	DECLARE variable INT;
    SET variable = 7;
    RETURN variable;
END$$

DELIMITER ;