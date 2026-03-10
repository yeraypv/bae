DELIMITER $$

CREATE TRIGGER trigger_usuarios_historico_before_insert
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (-1,'Intento de Registro de Usuario',NOW());
END;$$

CREATE TRIGGER trigger_usuarios_historico_after_insert
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (NEW.id,'Registro Completado',NOW());

END; $$

CREATE TRIGGER trigger_usuarios_historico_before_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (OLD.id,'Intentando eliminar Usuario',NOW());

END; $$

CREATE TRIGGER trigger_usuarios_historico_after_delete
AFTER DELETE ON usuarios
FOR EACH ROW
BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (OLD.id,'Usuario Eliminado',NOW());

END; $$

CREATE TRIGGER trigger_usuarios_historico_before_update
BEFORE UPDATE ON usuarios
FOR EACH ROW
BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (OLD.id,'Intentando actualizar Usuario',NOW());

END; $$

CREATE TRIGGER trigger_usuarios_historico_after_update
AFTER UPDATE ON usuarios
FOR EACH ROW
BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (OLD.id,'Usuario Actualizado',NOW());

END; $$

DELIMITER ;