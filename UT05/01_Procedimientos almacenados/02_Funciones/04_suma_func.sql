SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION suma_func(a INT,b INT) RETURNS INT
BEGIN
	DECLARE suma INT;
    SET suma = a + b;
    RETURN suma;
END;$$

DELIMITER ;
