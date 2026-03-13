DELIMITER $$

CREATE PROCEDURE sp_calcular_todos_puntos () 
BEGIN

-- Variables donde almacenar lo que nos traemos desde el SELECT
  DECLARE vnombre VARCHAR(120);
  DECLARE vtiempo BIGINT;
  DECLARE vpenalizacion1 BIGINT;
  DECLARE vpenalizacion2 BIGINT;
  DECLARE vjugador_id BIGINT;

-- Variable para controlar el fin del bucle
  DECLARE final INTEGER DEFAULT 0;

-- El SELECT que vamos a ejecutar
  DECLARE jugadores_cursor CURSOR FOR
    SELECT Jugador_id, Nombre, Tiempo, Penalizacion1, Penalizacion2 FROM Jugadores;

-- Condición de salida
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET final=1;

  OPEN jugadores_cursor;
  
  get_jugadores: LOOP
    FETCH jugadores_cursor INTO vjugador_id, vnombre, vtiempo, vpenalizacion1,
vpenalizacion2;
    IF final = 1 THEN
       LEAVE get_jugadores;
    END IF;

  UPDATE Jugadores SET Puntos=calcular_puntos_jugadores(vtiempo, vpenalizacion1,
vpenalizacion2) WHERE Jugador_id=vjugador_id;

  END LOOP get_jugadores;

  CLOSE jugadores_cursor;
END$$

DELIMITER ;