DELIMITER $$

CREATE FUNCTION TotalPagadoAlumno(idAlumno INT)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(p.importe)
    INTO total
    FROM pago p
    JOIN matricula m ON p.id_matricula = m.id_matricula
    WHERE m.id_alumno = idAlumno;

    RETURN total;
END;$$

DELIMITER ;