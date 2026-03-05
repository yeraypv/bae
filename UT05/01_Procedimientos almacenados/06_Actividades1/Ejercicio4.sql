SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION TotalAlumnos()
RETURNS INT
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM alumno;

    RETURN total;
END;$$

DELIMITER ;