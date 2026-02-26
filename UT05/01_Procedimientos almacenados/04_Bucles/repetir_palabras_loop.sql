DELIMITER $$
CREATE PROCEDURE repetir_palabras_loop(
    IN numpal INT, 
    IN palabra VARCHAR(50)
)
BEGIN
    declare x INT;
    set x = 0;

    miloop: LOOP
        if(x > numpal) THEN
            LEAVE miloop;
        END IF;
        set x = x + 1;
        select palabra;
    END LOOP miloop;

END;$$

DELIMITER ;