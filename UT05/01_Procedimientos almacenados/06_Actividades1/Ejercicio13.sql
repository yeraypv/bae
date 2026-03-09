DELIMITER $$

CREATE PROCEDURE TipoCurso(IN idCurso INT)
BEGIN
    DECLARE precioCurso DECIMAL(10,2);

    SELECT precio INTO precioCurso
    FROM curso
    WHERE id_curso = idCurso;

    IF precioCurso > 0 AND precioCurso < 50 THEN
        SELECT 'Básico' AS tipo;
    ELSEIF precioCurso BETWEEN 50 AND 100 THEN
        SELECT 'Intermedio' AS tipo;
    ELSE
        SELECT 'Avanzado' AS tipo;
    END IF;
END $$

DELIMITER ;