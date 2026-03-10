-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2021 a las 13:12:58
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `usuariosdb`
--
CREATE database usuariosdb;
use usuariosdb;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `trigger_usuarios_historico_after_delete` AFTER DELETE ON `usuarios` FOR EACH ROW BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (OLD.id,'Usuario Eliminado',NOW());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_usuarios_historico_after_insert` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (NEW.id,'Registro Completado',NOW());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_usuarios_historico_after_update` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (OLD.id,'Usuario Actualizado',NOW());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_usuarios_historico_before_delete` BEFORE DELETE ON `usuarios` FOR EACH ROW BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (OLD.id,'Intentando eliminar Usuario',NOW());

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_usuarios_historico_before_insert` BEFORE INSERT ON `usuarios` FOR EACH ROW BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (-1,'Intento de Registro de Usuario',NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_usuarios_historico_before_update` BEFORE UPDATE ON `usuarios` FOR EACH ROW BEGIN 
   INSERT INTO usuarios_historico(idusuario,accion,registro)
   VALUES (OLD.id,'Intentando actualizar Usuario',NOW());

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_historico`
--

CREATE TABLE `usuarios_historico` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_historico`
--
ALTER TABLE `usuarios_historico`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `usuarios_historico`
--
ALTER TABLE `usuarios_historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
