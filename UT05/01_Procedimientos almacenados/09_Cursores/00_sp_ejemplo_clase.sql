
DELIMITER $$

CREATE PROCEDURE `actualizar_tipos_libros`()
BEGIN

	-- 1. DECLARAR VARIABLES LOCALES 
    DECLARE isbn_libro INT;
    DECLARE num_paginas INT;
    DECLARE final BOOLEAN DEFAULT false;
    DECLARE tipo_libro VARCHAR(100);
    
    -- 2. DECLARAR CURSOR
    DECLARE libros_cursor cursor for 
		SELECT isbn, numpaginas FROM libros;
        
	-- 3. DECLARAR MANEJADOR DE EXCEPCIONES NOT FOUND 
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET final = TRUE;
	
    -- 4. OPEN cursor
    OPEN libros_cursor;
    
    -- 5. BUCLE
    bucle : loop
		-- 6. FETCH obtiene los valores de los registros 1 a 1
        FETCH libros_cursor INTO isbn_libro, num_paginas; 
        
        -- 7. Condicion de salida del bucle
		IF final = TRUE THEN
			LEAVE bucle;
		END IF;
        
        -- 8. logica del procedimiento
        IF num_paginas < 500 THEN
			SET tipo_libro = 'Novela corta';
		ELSEIF num_paginas < 1000 THEN
			SET tipo_libro = 'Novela larga';
		ELSE 
			SET tipo_libro = 'Novela extensa';
		END IF;
        
        UPDATE libros SET tipo = tipo_libro WHERE isbn = isbn_libro;
        
    end loop bucle;
    
    -- 9. Close cursor
    CLOSE libros_cursor;

END;$$

DELIMITER ;