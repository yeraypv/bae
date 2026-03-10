DELIMITER $$

CREATE PROCEDURE sp_sql_exception_warning()
BEGIN

    -- error genericos sqlWarning
    DECLARE CONTINUE HANDLER FOR SQLWARNING
        SELECT 'WARNING genéricos' AS Warnings;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT 'Excepciones genéricas' AS Errors;

    CALL sp_libreria_libros_insertar(10,'titulo','escritores',3,1234,'img/Ejemplo.jpg');
    -- el error se produce al volver a intentar introducir el mismo ISBN.
    CALL sp_libreria_libros_insertar(10,'titulo','escritores',3,1234,'img/Ejemplo.jpg');
END;$$