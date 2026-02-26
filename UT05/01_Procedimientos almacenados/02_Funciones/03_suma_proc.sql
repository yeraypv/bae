DELIMITER $$

CREATE PROCEDURE suma_proc(
    IN a INT,
    IN b INT
)
BEGIN
	DECLARE suma INT;
    SET suma = a + b;
    SELECT suma;
END;$$

DELIMITER ;