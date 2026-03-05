DELIMITER $$

CREATE PROCEDURE PrecioCurso(
    IN idCurso INT,
    OUT precio DECIMAL(10,2)
)
BEGIN
    SELECT precio INTO precio
    FROM curso
    WHERE id_curso = idCurso;
END;$$

DELIMITER ;