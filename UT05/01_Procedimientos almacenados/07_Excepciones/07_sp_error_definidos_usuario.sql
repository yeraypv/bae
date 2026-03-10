DELIMITER $$

CREATE PROCEDURE sp_libreria_libros_error_definido_usuario(
    IN ISBN INT
)
BEGIN
    -- Excepción pesonalizadas mediante Signal
    IF ISBN = 0 OR ISBN=-1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "ISBN no válido";
    END IF;
        
    SELECT * FROM libros WHERE libros.isbn = isbn;

END;$$

DELIMITER ;