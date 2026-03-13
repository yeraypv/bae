DELIMITER $$

CREATE FUNCTION calcular_puntos_jugadores (
  tiempo BIGINT,
  penalizacion1 BIGINT,
  penalizacion2 BIGINT
) RETURNS BIGINT
BEGIN
  DECLARE puntos BIGINT;
 
  SET puntos = 1000 - tiempo - penalizacion1*5 - penalizacion2*3;
 
  RETURN puntos;
  
END$$

DELIMITER ;