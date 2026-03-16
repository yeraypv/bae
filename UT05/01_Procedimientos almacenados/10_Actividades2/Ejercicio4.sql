USE tienda;

CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

DELIMITER $$

CREATE PROCEDURE insertar_usuario(
    IN p_email VARCHAR(100)
)
BEGIN

    -- 1062: Message: Duplicate entry '%s' for key %d 
    DECLARE EXIT HANDLER FOR 1062
    SELECT 'Email ya registrado' AS mensaje;

    INSERT INTO usuarios(email) VALUES(p_email);

END;$$

DELIMITER ;