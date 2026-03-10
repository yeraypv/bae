DELIMITER $$

CREATE PROCEDURE sp_libreria_libros_tabla_error1()
BEGIN
    -- MYSQL error_code
    DECLARE CONTINUE HANDLER FOR 1146 -- ERROR DE TABLA NO EXISTE
    BEGIN
        -- código del manejador de errores
        SELECT 'Error: Tabla no existe';
       
    END;
     
    SELECT * FROM tabla_no_existe;
    SELECT * FROM libros;
END;$$


DELIMITER ;