DELIMITER $$

CREATE PROCEDURE Calcular_Edad(
    IN nacimiento INT
)
BEGIN
    DECLARE actual INT DEFAULT 2026;
    DECLARE edad INT;
        
    SET edad=actual - nacimiento;
        
    SELECT edad;
END;$$

DELIMITER ;
