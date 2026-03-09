
DELIMITER $$

CREATE PROCEDURE RegistrarPago(
    IN idMatricula INT,
    IN importe DECIMAL(10,2)
)
BEGIN
    INSERT INTO pago (id_matricula, importe, fecha_pago)
    VALUES (idMatricula, importe, CURDATE());

    UPDATE matricula
    SET pagado = TRUE
    WHERE id_matricula = idMatricula;
END $$

DELIMITER ;