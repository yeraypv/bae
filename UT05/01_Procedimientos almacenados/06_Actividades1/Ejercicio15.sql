SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE FUNCTION existeAlumno(idAlumno INT) RETURNS BOOLEAN
BEGIN
    DECLARE v_id_alumno INT;

    SELECT id_alumno INTO v_id_alumno
    FROM alumno
    WHERE id_alumno = idAlumno;

    IF v_id_alumno IS NOT NULL THEN 
        RETURN TRUE;
    END IF;

    RETURN FALSE;
END;$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION obtenerSaldoAlumno(idAlumno INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE saldoActual DECIMAL(10,2);

    SELECT saldo INTO saldoActual
    FROM alumno
    WHERE id_alumno = idAlumno;

    RETURN saldoActual;

END;$$

DELIMITER ;


DELIMITER $$

CREATE FUNCTION obtenerPrecioCurso(idCurso INT) RETURNS DECIMAL(10,2)
BEGIN
    DECLARE precioCurso DECIMAL(10,2);

    SELECT precio INTO precioCurso
    FROM curso
    WHERE id_curso = idCurso;

    RETURN precioCurso;
END;$$

DELIMITER ;


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

    IF  existeAlumno(idAlumno) = FALSE THEN
        SELECT 'El alumno no existe';
        ROLLBACK;
    ELSE
        -- Obtenemos el saldo del alumno
        SET saldoActual = obtenerSaldoAlumno(idAlumno);

        -- Obtenemos el precio del curso
        SET precioCurso = obtenerPrecioCurso(idCurso);

        SET plazasDisponibles = PlazasDisponiblesCurso(idCurso);

        -- Hay saldo y plazas disponibles para matricular.
        IF  saldoActual >= precioCurso AND plazasDisponibles > 0 THEN

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
    END IF;

END;$$

DELIMITER ;