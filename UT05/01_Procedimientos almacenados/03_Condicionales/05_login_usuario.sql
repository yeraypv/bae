-- Tabla de ejemplo usuarios:
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) UNIQUE,
    clave VARCHAR(100),
    intentos_fallidos INT DEFAULT 0,
    bloqueado BOOLEAN DEFAULT FALSE,
    activo BOOLEAN DEFAULT TRUE
);

DELIMITER $$

CREATE PROCEDURE login_usuario(
    IN p_usuario VARCHAR(50),
    IN p_clave VARCHAR(100)
)
BEGIN
    DECLARE _clave VARCHAR(100);
    DECLARE _intentos INT;
    DECLARE _bloqueado BOOLEAN;
    DECLARE _activo BOOLEAN;

    -- Obtener datos del usuario
    SELECT clave, intentos_fallidos, bloqueado, activo
    INTO _clave, _intentos, _bloqueado, _activo
    FROM usuarios
    WHERE usuario = p_usuario;

    -- Verificar que exista y esté activo
    IF _activo = TRUE AND _bloqueado = FALSE THEN

        -- Verificar contraseña
        IF _clave = p_clave THEN
            
            UPDATE usuarios
            SET intentos_fallidos = 0
            WHERE usuario = p_usuario;

            SELECT 'Login correcto' AS mensaje;

        ELSE
            
            UPDATE usuarios
            SET intentos_fallidos = intentos_fallidos + 1
            WHERE usuario = p_usuario;

            SELECT 'Password incorrecto' AS mensaje;

        END IF;

    ELSE
        SELECT 'Usuario bloqueado o inactivo' AS mensaje;
    END IF;

END;$$

DELIMITER ;
