DROP DATABASE IF EXISTS prestamodb;
CREATE DATABASE prestamodb;
USE prestamodb;

CREATE TABLE cuotas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT NOT NULL,
    importe DECIMAL(10,2) NOT NULL
);


DELIMITER $$

CREATE PROCEDURE generar_cuotas_prestamo(
    IN capital DECIMAL(10,2),
    IN interes DECIMAL(5,2),
    IN meses INT
)
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE cuota DECIMAL(10,2);

    WHILE contador <= meses DO
        SET cuota = (capital * interes / 100);

        INSERT INTO cuotas(numero, importe)
        VALUES(contador, cuota);

        SET contador = contador + 1;
    END WHILE;

END;$$

DELIMITER ;
