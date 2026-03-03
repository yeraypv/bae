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
    DECLARE _existe INT DEFAULT 0;

    -- Verificamos que el usuario existe
    SELECT COUNT(*) INTO _existe
    FROM usuarios
    WHERE usuario = p_usuario;

    IF _existe = 0 THEN
        SELECT 'Credenciales incorrectas' AS mensaje;
    ELSE
        -- Obtenemos los datos del usuario que existe.
        SELECT clave, intentos_fallidos, bloqueado, activo
        INTO _clave, _intentos, _bloqueado, _activo
        FROM usuarios
        WHERE usuario = p_usuario;
        
        -- Verificamos el estado y si esta inactivo.
        IF _bloqueado = TRUE THEN
            SELECT 'Usuario bloqueado' AS mensaje;
        ELSE
            IF _activo = FALSE THEN
                SELECT 'Usuario inactivo' AS mensaje;
            ELSE
                -- Número de intentos permitidos son 3 como máximo, 
                -- si se superan debe bloquearse el usuario.
                IF _intentos >= 3 THEN 
                    -- Se han superado el número de intentos, se bloque el usuario.
                    UPDATE usuarios
                    SET bloqueado = TRUE
                    WHERE usuario = p_usuario;

                    SELECT 'Usuario bloqueado por superar 3 intentos' AS mensaje;
                ELSE
                    -- Verificamos la contraseña
                    IF _clave = p_clave THEN
                        -- Al tener éxito en el login resetamos la cuenta de los intentos.
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
                END IF;
            END IF;
        END IF;
    END IF;
END;$$

DELIMITER ;
