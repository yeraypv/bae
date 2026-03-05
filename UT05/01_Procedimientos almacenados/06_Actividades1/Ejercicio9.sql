DELIMITER $$

CREATE PROCEDURE ContarMatriculasAlumno(
    IN idAlumno INT,
    OUT total INT
)
BEGIN
    SELECT COUNT(*) INTO total
    FROM matricula
    WHERE id_alumno = idAlumno;
END;$$

DELIMITER ;