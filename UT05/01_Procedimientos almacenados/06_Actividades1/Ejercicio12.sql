DELIMITER $$

CREATE PROCEDURE EstadoAlumno(IN idAlumno INT)
BEGIN
    DECLARE estado BOOLEAN;

    SELECT activo INTO estado
    FROM alumno
    WHERE id_alumno = idAlumno;

    IF estado IS NULL THEN
        SELECT 'No existe' AS estado;
    ELSEIF estado = TRUE THEN
        SELECT 'Alumno Activo' AS estado;
    ELSE
        SELECT 'Alumno Inactivo' AS estado;
    END IF;
END $$

DELIMITER ;
