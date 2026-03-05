SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION PlazasDisponiblesCurso(idCurso INT)
RETURNS INT
BEGIN
    DECLARE maximas INT;
    DECLARE ocupadas INT;

    SELECT plazas_max INTO maximas
    FROM curso
    WHERE id_curso = idCurso;

    SELECT COUNT(*) INTO ocupadas
    FROM matricula
    WHERE id_curso = idCurso;

    RETURN maximas - ocupadas;
END;$$

DELIMITER ;
