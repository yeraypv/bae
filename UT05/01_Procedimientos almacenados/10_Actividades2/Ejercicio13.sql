USE tienda;

CREATE TABLE registro_clientes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE
);

DELIMITER $$

CREATE TRIGGER registrar_cliente
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN

    INSERT INTO registro_clientes(id_cliente,fecha)
    VALUES(NEW.id_cliente,CURDATE());

END $$

DELIMITER ;