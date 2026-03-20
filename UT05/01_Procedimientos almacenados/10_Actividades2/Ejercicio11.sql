USE tienda;

CREATE TABLE historial_precios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    precio_antiguo DECIMAL(10,2),
    precio_nuevo DECIMAL(10,2),
    fecha DATETIME
);

DELIMITER $$

CREATE TRIGGER historial_precio
BEFORE UPDATE ON productos
FOR EACH ROW
BEGIN
    -- Si los precios son distintos.
    IF OLD.precio <> NEW.precio THEN
        INSERT INTO historial_precios(id_producto,precio_antiguo,precio_nuevo,fecha)
        VALUES (OLD.id_producto,OLD.precio,NEW.precio, NOW());
    END IF;

END;$$

DELIMITER ;