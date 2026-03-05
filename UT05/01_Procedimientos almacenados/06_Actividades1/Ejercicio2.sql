DELIMITER $$

CREATE PROCEDURE CursosActivos()
BEGIN
    SELECT nombre, precio
    FROM curso
    WHERE activo = TRUE;
END;$$

DELIMITER ;