
DELIMITER $$

CREATE PROCEDURE MatricularAlumno(
    IN idAlumno INT,
    IN idCurso INT
)
BEGIN
    DECLARE saldoActual DECIMAL(10,2);
    DECLARE precioCurso DECIMAL(10,2);
    DECLARE plazasDisponibles INT;

    START TRANSACTION;

    SELECT saldo INTO saldoActual
    FROM alumno
    WHERE id_alumno = idAlumno;

    SELECT precio INTO precioCurso
    FROM curso
    WHERE id_curso = idCurso;

    SET plazasDisponibles = PlazasDisponiblesCurso(idCurso);

    -- Hay saldo y plazas disponibles para matricular.
    IF saldoActual >= precioCurso AND plazasDisponibles > 0 THEN

        INSERT INTO matricula (id_alumno, id_curso, fecha_matricula, pagado)
        VALUES (idAlumno, idCurso, CURDATE(), FALSE);

        UPDATE alumno
        SET saldo = saldo - precioCurso
        WHERE id_alumno = idAlumno;

        COMMIT;
    ELSE
        -- Si no se cumplen las condiciones deshacemos la transacción.
        ROLLBACK;
    END IF;

END $$

DELIMITER ;