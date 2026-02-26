DELIMITER $$

CREATE PROCEDURE nota_examen(IN nota INT)
BEGIN 
	CASE
    	WHEN nota in(1,2) THEN
        	SELECT 'MUY DEFICIENTE';
        WHEN  nota in(3,4) THEN
        	SELECT 'INSUFICIENTE';
        WHEN nota in(5) THEN
        	SELECT 'SUFICIENTE';
        WHEN nota in(6) THEN
        	SELECT 'BIEN';
        WHEN nota  in(7,8) THEN
        	SELECT 'NOTABLE';
        WHEN nota in(9,10) THEN
        	SELECT 'SOBRESALIENTE';
    ELSE
    	SELECT 'ERROR NO ES UNA NOTA';
    END CASE;
END;$$

DELIMITER ;