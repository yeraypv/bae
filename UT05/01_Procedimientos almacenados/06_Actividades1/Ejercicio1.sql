DELIMITER $$

CREATE PROCEDURE ListarAlumnos()
BEGIN
    SELECT *
    FROM alumno
    WHERE activo = TRUE;
END;$$

DELIMITER ;