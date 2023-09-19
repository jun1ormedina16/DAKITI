-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2023 a las 17:40:36
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bar_dakiti`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--

CREATE TABLE `carrito_compras` (
  `Id_carrito` varchar(50) NOT NULL COMMENT 'numero del carrito',
  `id_usuario` int(11) NOT NULL COMMENT 'numero identificador del usuario',
  `Id_producto` varchar(50) NOT NULL COMMENT 'numero identificador del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `Id_factura` varchar(50) NOT NULL COMMENT 'numero de la factura',
  `id_usuario` int(11) NOT NULL COMMENT 'numero identificador del usuario',
  `Id_carrito` varchar(50) NOT NULL COMMENT 'numero identificador del carrito',
  `Id_producto` varchar(50) NOT NULL COMMENT 'numero identificador del producto',
  `Id_metodo` varchar(50) NOT NULL COMMENT 'numero identificador del metodo de pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `Id_metodo` varchar(50) NOT NULL COMMENT 'numero del metodo de pago',
  `Nombre` varchar(50) NOT NULL COMMENT 'nombre del metodo de pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` varchar(50) NOT NULL COMMENT 'numero del producto',
  `precio` float NOT NULL COMMENT 'precio del producto',
  `id_usuario` int(11) NOT NULL COMMENT 'numero identificador del usuario',
  `categoria` varchar(50) NOT NULL COMMENT 'categoria del producto',
  `nombre` varchar(50) NOT NULL COMMENT 'nombre del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(2) NOT NULL COMMENT 'numero del rol',
  `nombre` varchar(8) NOT NULL COMMENT 'nombre del rol'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'admin'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL COMMENT 'numero del usuario',
  `id_rol` int(2) DEFAULT NULL COMMENT 'numero identificador del rol',
  `nombre` varchar(80) NOT NULL COMMENT 'nombre del usuario',
  `correo` varchar(50) NOT NULL COMMENT 'correo del usuario\r\n',
  `contrasena` varchar(255) NOT NULL COMMENT 'contraseña del usuario',
  `telefono` varchar(10) NOT NULL COMMENT 'telefono del usuario\r\n',
  `fecha_nacimiento` date NOT NULL COMMENT 'fecha de nacimiento del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `nombre`, `correo`, `contrasena`, `telefono`, `fecha_nacimiento`) VALUES
(1, 1, 'junior medina', 'juniormedinabuitrago672@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '3012830581', '2005-02-04'),
(2, 1, 'german sanchez', 'germanasg2004@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '3124099640', '2004-02-14'),
(3, 1, 'Brandon Rodriguez', 'rodriguezpabonbrandonsteven@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', '3112061611', '2005-04-13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`Id_carrito`),
  ADD KEY `Id_producto` (`Id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id_factura`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `Id_carrito` (`Id_carrito`),
  ADD KEY `Id_producto` (`Id_producto`),
  ADD KEY `Id_metodo` (`Id_metodo`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`Id_metodo`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_producto`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'numero del usuario', AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD CONSTRAINT `carrito_compras_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`),
  ADD CONSTRAINT `carrito_compras_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`Id_carrito`) REFERENCES `carrito_compras` (`Id_carrito`),
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id_producto`),
  ADD CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`Id_metodo`) REFERENCES `metodo_pago` (`Id_metodo`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
