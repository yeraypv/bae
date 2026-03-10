DELIMITER $$

CREATE PROCEDURE sp_errores_varios2()
BEGIN -- bloque externo
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02'
      SELECT 'SQLSTATE tabla no existe' AS error;
  BEGIN -- bloque interno
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
      SELECT 'SQLEXCEPTION tabla no existe' AS error;

    DROP TABLE test.t; -- acción que ocurre en bloque interno
  END;
END;$$

DELIMITER ;