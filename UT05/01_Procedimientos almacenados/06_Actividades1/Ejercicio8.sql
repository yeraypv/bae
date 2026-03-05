DELIMITER $$

CREATE PROCEDURE ActualizarSaldo(
    IN idAlumno INT,
    IN cantidad DECIMAL(10,2)
)
BEGIN

    SELECT COUNT(*) INTO existe FROM alumno WHERE id_alumno = idAlumno;

    IF existe = 0 THEN
        SELECT 'El alumno no existe, el saldo no se puede actualizar';
    ELSE
        IF cantidad >= 0 THEN
            UPDATE alumno
            SET saldo = saldo + cantidad
            WHERE id_alumno = idAlumno;
        ELSE
            SELECT 'La cantidad no puede ser negativa.';
        END IF;
    END IF;

END;$$

DELIMITER ;