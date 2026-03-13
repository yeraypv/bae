DELIMITER $$
CREATE PROCEDURE `sp_juego_jugadores_cursor`()
BEGIN

-- Variables donde almacenar lo que nos traemos desde el SELECT
  DECLARE v_nombre VARCHAR(120);
  DECLARE v_tiempo BIGINT;
  DECLARE v_penalizacion1 BIGINT;
  DECLARE v_penalizacion2 BIGINT;
  
-- Variable para controlar el fin del bucle
  DECLARE fin INTEGER DEFAULT FALSE;

-- El SELECT que vamos a ejecutar
  DECLARE jugadores_cursor CURSOR FOR
    SELECT nombre, tiempo, penalizacion1, penalizacion2 FROM jugadores;

-- Condición de salida
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=TRUE;

  OPEN jugadores_cursor;
  get_jugadores: LOOP
    FETCH jugadores_cursor INTO v_nombre, v_tiempo, v_penalizacion1, v_penalizacion2;
    IF fin = 1 THEN
       LEAVE get_jugadores;
    END IF;
 
  	SELECT v_nombre AS Nombre, v_tiempo AS Tiempo, v_penalizacion1 AS Penalizacion1, v_penalizacion2 AS Penalizacion2;

  END LOOP get_jugadores;

  CLOSE jugadores_cursor;
END$$
DELIMITER ;