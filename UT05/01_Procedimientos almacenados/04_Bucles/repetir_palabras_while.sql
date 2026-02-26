DELIMITER $$
CREATE PROCEDURE repetir_palabras_while (
    IN numpal INT, 
    IN palabra VARCHAR(50)
)
BEGIN
    DECLARE x INT;
    SET x = 0;
    WHILE x < numpal DO
        SELECT palabra;
        SET x = x + 1;
    END WHILE;
END;$$
DELIMITER ;