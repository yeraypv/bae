-- Dependiendo del servidor de MySQL, tendrá activado una protección de seguridad,
-- podemos desactivarlo añadiendo esta línea.
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION mostrar_variable_funcion() RETURNS INT
BEGIN
    DECLARE variable INT;
    SET variable = 7;
    RETURN variable;
END;$$

DELIMITER ;
