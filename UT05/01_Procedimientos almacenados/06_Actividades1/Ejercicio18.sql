
DELIMITER $$

CREATE PROCEDURE ResumenAlumno(IN idAlumno INT)
BEGIN
    SELECT 
        a.nombre,
        COUNT(m.id_matricula) AS total_matriculas,
        SUM(p.importe) AS total_pagado,
        a.saldo
    FROM alumno a
    LEFT JOIN matricula m ON a.id_alumno = m.id_alumno
    LEFT JOIN pago p ON m.id_matricula = p.id_matricula
    WHERE a.id_alumno = idAlumno
    GROUP BY a.id_alumno;
END $$

DELIMITER ;