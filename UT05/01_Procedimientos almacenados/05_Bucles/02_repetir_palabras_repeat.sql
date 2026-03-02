DELIMITER $$

CREATE PROCEDURE repetir_palabras_repeat(
    IN numpal INT, 
    IN palabra VARCHAR(50)
)
BEGIN
    DECLARE counter INT DEFAULT 0;
    
    REPEAT
        SELECT palabra;
        SET counter = counter + 1;
    UNTIL counter >= 10
    END REPEAT;
END;$$

DELIMITER ;