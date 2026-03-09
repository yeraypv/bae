DROP DATABASE IF EXISTS Academia;
CREATE DATABASE Academia;
USE Academia;

CREATE TABLE alumno (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_registro DATE NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    saldo DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE profesor (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50),
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    plazas_max INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT,
    id_curso INT,
    fecha_matricula DATE NOT NULL,
    pagado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_alumno) REFERENCES alumno(id_alumno),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE pago (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT,
    importe DECIMAL(10,2),
    fecha_pago DATE,
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula)
);

USE Academia;

-- =========================
-- ALUMNOS
-- =========================

INSERT INTO alumno (nombre, email, fecha_registro, activo, saldo) VALUES
('Ana Torres', 'ana@correo.com', '2025-01-10', TRUE, 300.00),
('Luis Pérez', 'luis@correo.com', '2025-01-15', TRUE, 80.00),
('Marta Ruiz', 'marta@correo.com', '2025-02-01', TRUE, 40.00),
('Carlos López', 'carlos@correo.com', '2025-02-10', FALSE, 150.00),
('Elena Gómez', 'elena@correo.com', '2025-02-15', TRUE, 500.00);

-- =========================
-- PROFESORES
-- =========================

INSERT INTO profesor (nombre, especialidad, activo) VALUES
('Dr. Romero', 'Bases de Datos', TRUE),
('Laura Sánchez', 'Programación Java', TRUE),
('Miguel Castro', 'DevOps', FALSE);

-- =========================
-- CURSOS
-- =========================

INSERT INTO curso (nombre, precio, plazas_max, activo) VALUES
('SQL Básico', 40.00, 3, TRUE),
('Java Intermedio', 90.00, 2, TRUE),
('Arquitectura Avanzada', 150.00, 2, TRUE),
('Docker y Kubernetes', 120.00, 1, TRUE),
('Curso Antiguo', 60.00, 5, FALSE);

-- =========================
-- MATRICULAS
-- =========================

-- Ana (saldo alto)
INSERT INTO matricula (id_alumno, id_curso, fecha_matricula, pagado)
VALUES (1, 1, '2025-03-01', TRUE);

INSERT INTO matricula (id_alumno, id_curso, fecha_matricula, pagado)
VALUES (1, 2, '2025-03-02', TRUE);

-- Luis (saldo medio)
INSERT INTO matricula (id_alumno, id_curso, fecha_matricula, pagado)
VALUES (2, 1, '2025-03-03', TRUE);

-- Marta (saldo bajo, sin pagar)
INSERT INTO matricula (id_alumno, id_curso, fecha_matricula, pagado)
VALUES (3, 2, '2025-03-05', FALSE);

-- Elena (varias matrículas)
INSERT INTO matricula (id_alumno, id_curso, fecha_matricula, pagado)
VALUES (5, 3, '2025-03-06', TRUE);

INSERT INTO matricula (id_alumno, id_curso, fecha_matricula, pagado)
VALUES (5, 4, '2025-03-07', FALSE);

-- =========================
-- PAGOS
-- =========================

-- Pagos Ana
INSERT INTO pago (id_matricula, importe, fecha_pago)
VALUES (1, 40.00, '2025-03-01');

INSERT INTO pago (id_matricula, importe, fecha_pago)
VALUES (2, 90.00, '2025-03-02');

-- Pago Luis
INSERT INTO pago (id_matricula, importe, fecha_pago)
VALUES (3, 40.00, '2025-03-03');

-- Pago Elena (solo uno pagado)
INSERT INTO pago (id_matricula, importe, fecha_pago)
VALUES (5, 150.00, '2025-03-06');
