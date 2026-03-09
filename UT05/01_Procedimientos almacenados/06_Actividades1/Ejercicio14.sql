CREATE PROCEDURE PuedeMatricularse(
    IN idAlumno INT,
    IN idCurso INT,
    OUT mensaje VARCHAR(100)
)
BEGIN
    DECLARE saldoActual DECIMAL(10,2);
    DECLARE precioCurso DECIMAL(10,2);

    SELECT saldo INTO saldoActual
    FROM alumno
    WHERE id_alumno = idAlumno;

    SELECT precio INTO precioCurso
    FROM curso
    WHERE id_curso = idCurso;

    IF saldoActual >= precioCurso THEN
        SET mensaje = 'Puede matricularse';
    ELSE
        SET mensaje = 'Saldo insuficiente';
    END IF;
    
    SELECT mensaje;
END $$

DELIMITER ;