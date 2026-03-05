SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION EliminarAlumno(idAlumno INT)
RETURNS BOOLEAN
BEGIN
    DECLARE totalMatriculas INT;

    SELECT COUNT(*) INTO totalMatriculas
    FROM matricula
    WHERE id_alumno = idAlumno;

    IF totalMatriculas = 0 THEN
        DELETE FROM alumno WHERE id_alumno = idAlumno;
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;$$

DELIMITER ;