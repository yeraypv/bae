DELIMITER $$
CREATE PROCEDURE mayor_numero(
    IN a INT, 
    IN b INT
)
BEGIN

    IF (a>b) THEN
    	SELECT 'a es mayor b';
    ELSEIF (a = b) THEN
    	SELECT 'a y b son iguales';
    ELSE
    	SELECT 'b es mayor que a';
    END IF;

END$$

DELIMITER ;