DELIMITER $$

CREATE PROCEDURE SaldoAlumno(IN idAlumno INT)
BEGIN
    SELECT saldo
    FROM alumno
    WHERE id_alumno = idAlumno;
END;$$

DELIMITER ;
