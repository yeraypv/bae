DROP DATABASE IF EXISTS alquileresdb;
CREATE DATABASE alquileresdb;
USE alquileresdb;

CREATE TABLE alquileres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(50),
    dias_retraso INT,
    recargo_total DECIMAL(10,2) DEFAULT 0
);

-- Datos de prueba
INSERT INTO alquileres (cliente, dias_retraso)
VALUES ('Ana', 3),
       ('Luis', 0),
       ('Marta', 5);

DELIMITER $$

CREATE PROCEDURE calcular_recargo(IN idAlquiler INT)
BEGIN
    DECLARE dias INT;
    DECLARE contador INT DEFAULT 0;
    DECLARE total DECIMAL(10,2) DEFAULT 0;

    -- Obtener días de retraso
    SELECT dias_retraso INTO dias
    FROM alquileres
    WHERE id = idAlquiler;

    mi_loop: LOOP

        IF contador >= dias THEN
            LEAVE mi_loop;
        END IF;

        SET total = total + 10;  -- 10€ por día
        SET contador = contador + 1;

    END LOOP;

    UPDATE alquileres
    SET recargo_total = total
    WHERE id = idAlquiler;

END $$

DELIMITER ;