
DELIMITER $$

CREATE PROCEDURE DescontarSaldo(
    IN idAlumno INT,
    IN cantidad DECIMAL(10,2),
    OUT resultado VARCHAR(50)
)
BEGIN
    DECLARE saldoActual DECIMAL(10,2);

    SELECT saldo INTO saldoActual
    FROM alumno
    WHERE id_alumno = idAlumno;

    IF saldoActual >= cantidad THEN
        UPDATE alumno
        SET saldo = saldo - cantidad
        WHERE id_alumno = idAlumno;

        SET resultado = 'Descuento realizado';
    ELSE
        SET resultado = 'Saldo insuficiente';
    END IF;
END $$

DELIMITER ;