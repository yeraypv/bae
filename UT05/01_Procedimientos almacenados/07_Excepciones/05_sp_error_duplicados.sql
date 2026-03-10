DELIMITER $$

CREATE PROCEDURE sp_libreria_libros_duplicados(
    OUT err_status VARCHAR(255)
)
BEGIN
    -- SQLSTATE [VALUE] sqlstate_value
    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
    BEGIN
        SELECT 'Error: Datos duplicados' INTO err_status;
    END;

    CALL sp_libreria_libros_insertar(10,'titulo','escritores',3,1234,'img/Ejemplo.jpg');
    
    -- el error se produce al volver a intentar introducir el mismo ISBN.
    CALL sp_libreria_libros_insertar(10,'titulo','escritores',3,1234,'img/Ejemplo.jpg');

    SELECT * FROM libros;
END;$$

DELIMITER ;