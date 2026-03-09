DELIMITER $$

CREATE PROCEDURE EliminarCurso(IN idCurso INT)
BEGIN
    START TRANSACTION;

    -- Eliminamos los pagos efectuados en las matriculas por el curso dado.
    DELETE pagos 
    FROM pago AS pagos
    JOIN matricula AS matr
    ON pagos.id_matricula = matr.id_matricula
    WHERE matr.id_curso = idCurso;

    DELETE FROM matricula WHERE id_curso = idCurso;

    DELETE FROM curso WHERE id_curso = idCurso;

    COMMIT;
END $$

DELIMITER ;