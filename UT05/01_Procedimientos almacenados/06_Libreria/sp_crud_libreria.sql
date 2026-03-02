DELIMITER $$

CREATE PROCEDURE sp_crud_libros(
    IN isbn INT, 
    IN titulo VARCHAR(255), 
    IN escritores VARCHAR(255), 
    IN genero INT, 
    IN numpaginas INT, 
    IN imagen VARCHAR(255), 
    IN opcion VARCHAR(50)
)
BEGIN
	CASE
    	WHEN opcion='seleccion' THEN
        	SELECT * FROM libros;
        WHEN opcion='concreto' THEN
        	SELECT * FROM libros WHERE libros.isbn=isbn;
        WHEN opcion='insertar' THEN
        	INSERT INTO libros VALUES(isbn,titulo,escritores,genero,numpaginas,imagen);
        WHEN opcion='actualizar' THEN
        	UPDATE libros SET titulo=titulo,escritores=escritores,genero=genero,numpaginas=numpaginas,imagen=imagen WHERE libros.isbn=isbn;
        WHEN opcion='eliminar' THEN
        	DELETE FROM libros WHERE libros.isbn=isbn;
    ELSE
    	SELECT 'Error: Opción no válida' AS Error;
    END CASE;
END;$$

DELIMITER ;
