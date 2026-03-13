DELIMITER $$
CREATE PROCEDURE `sp_numero_libros_genero_cursor`(
  IN `genero` INT
)
BEGIN

-- Se declara variable donde se va a guardar el valor total y final del listado
DECLARE TOTAL INT;
DECLARE final BOOL DEFAULT FALSE;

-- Se declara el cursor con el select con cuyos datos se va a iterar
DECLARE libros_categoria_cursor CURSOR FOR
  SELECT isbn FROM libros WHERE libros.genero = genero;

-- Definimos mediante un manejador de excepciones para obtener la condición de fin de listado
DECLARE CONTINUE HANDLER FOR NOT FOUND SET final = TRUE;

-- Se abre el cursor. Al abrir el cursor este sitúa un puntero a la primera fila del resultado de la consulta.
OPEN libros_categoria_cursor;

-- Empieza el bucle de lectura
loop_libros: LOOP

  -- Se guarda el resultado en la variable, hay una variable y un campo en el SELECT de la declaración del cursor
  FETCH libros_categoria_cursor INTO TOTAL;

  -- Se sale del bucle cuando no hay elementos por recorrer
  IF final THEN
      LEAVE loop_libros;
  END IF;

END LOOP loop_libros;

-- Se cierra el cursor
CLOSE libros_categoria_cursor;

-- Se muestra el resultado final obtenido
SELECT TOTAL;

END$$
DELIMITER ;