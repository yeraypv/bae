DELIMITER $$

CREATE PROCEDURE ActualizarSaldo(
    IN idAlumno INT,
    IN cantidad DECIMAL(10,2)
)
BEGIN
    UPDATE alumno
    SET saldo = saldo + cantidad
    WHERE id_alumno = idAlumno;
END;$$

DELIMITER ;