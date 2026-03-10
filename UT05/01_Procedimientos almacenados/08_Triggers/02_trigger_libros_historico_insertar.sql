-- Vamos a resolver un TRIGGER que nos permita mantener una copia de todos los libros
-- que se inserten en una base de datos. Para esto tendremos dos tablas: libro y 
-- libro_historico. Así, el siguiente TRIGGER insertará antes de insertar un libro.

DELIMITER $$

CREATE TRIGGER trigger_libros_insertar 
AFTER INSERT ON libros
FOR EACH ROW
BEGIN 
   INSERT INTO libros_historico(isbn, titulo, escritores, genero, imagen, fecha_registro, estado)
   VALUES (NEW.isbn, NEW.titulo, NEW.escritores, NEW.genero, NEW.imagen, CURDATE(), 'Nuevo');
END; $$

DELIMITER ;