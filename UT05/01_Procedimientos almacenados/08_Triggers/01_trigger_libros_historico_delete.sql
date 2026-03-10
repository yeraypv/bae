-- Vamos a resolver un TRIGGER que nos permita mantener una copia de todos los libros
-- que se inserten en una base de datos. Para esto tendremos dos tablas: libro y 
-- libro_historico. Así, el trigger se insertará un estado en otra tabla después 
-- de la eliminación del registro.

DELIMITER $$

CREATE TRIGGER trigger_libros_historico_delete 
AFTER DELETE ON libros
FOR EACH ROW
BEGIN 
   INSERT INTO libros_historico(isbn, titulo, escritores, genero, imagen, fecha_registro, estado)
   VALUES (OLD.isbn, OLD.titulo, OLD.escritores, OLD.genero, OLD.imagen, CURDATE(), 'Eliminado');
END; $$

DELIMITER ;