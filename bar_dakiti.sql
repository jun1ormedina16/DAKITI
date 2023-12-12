-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-12-2023 a las 05:05:24
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
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `precio`) VALUES
(1, 'Botella Smirnoff XI', 140000),
(2, 'Media Smirnoff XI', 90000),
(3, 'Botella Smirnoff sin azucar', 145000),
(4, 'Media Smirnoff sin azucar', 95000),
(5, 'Aguardiente Amarillo', 140000),
(6, 'Botella Nectar', 140000),
(7, 'Media Nectar', 95000),
(8, 'Botella Antioqueño', 150000),
(9, 'Media Antioqueño', 95000),
(10, 'Zacapa 23 años', 390000),
(11, 'Botella Bacardi', 170000),
(12, 'Media Bacardi', 99000),
(13, 'Botella Viejo de Caldas', 159000),
(14, 'Media Viejo de Caldas', 95000),
(16, 'Botella Santa fe', 159000),
(17, 'Media Santa fe', 95000),
(18, 'Botella Medellin', 159000),
(19, 'Media Medellin', 95000),
(20, 'Botella Absolut', 210000),
(21, 'Media Absolut', 129000),
(22, 'Botella Smirnoff', 210000),
(23, 'Media Smirnoff', 129000),
(24, 'Tanqueray', 300000),
(25, 'Don Julio', 430000),
(26, 'Don Julio Reposado', 390000),
(27, 'Don Julio Blanco', 360000),
(28, 'Jimador', 249000),
(29, 'Botella Jose cuervo', 210000),
(30, 'Media Jose Cuervo', 119000),
(31, 'Champaña', 179000),
(32, 'Johnie Walker Blue Label', 1300000),
(33, 'Buchanan\'s Master', 349000),
(34, 'Buchanan\'s 18 Años', 430000),
(35, 'Old Parr 18 Años', 430000),
(36, 'Botella Buchanan\'s 12 Años', 315000),
(37, 'Media Buchanan\'s 12 Años', 179000),
(38, 'Botella Old Parr 12 Años', 305000),
(39, 'Media Old Parr 12 Años', 229000),
(40, 'Botella Johnie Walker Black Label', 305000),
(41, 'Media Johnie Walker Black Label', 179000),
(42, 'Botella Chivas 12 Años', 305000),
(43, 'Media Chivas 12 Años', 179000),
(44, 'Botella Jack Daniel\'s', 299000),
(45, 'Media Jack Daniel\'s', 169000),
(46, 'Botella Johnie Walker Red Label', 179000),
(47, 'Media Johnie Walker Red Label', 119000),
(48, 'Jagermeister', 225000),
(49, 'Bailey\'s', 165000),
(50, 'Heineken', 12000),
(51, 'Corona 330ML', 12000),
(52, 'Smirnoff ICE', 16000),
(53, 'Red Bull', 13000),
(54, 'Gatorade', 8000),
(55, 'Agua', 6000),
(56, 'Gaseosa', 6000),
(57, 'Chiclets', 5000),
(58, 'Cigarrillo 1/2', 10000),
(59, 'Encendedores', 2500),
(60, 'Bom Bom Bum', 1500),
(61, 'Grants', 100000),
(62, 'Piña Colada', 165000),
(63, 'Nequi', 0);

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
(1, 1, 'Jose Medina ', 'juniormedinabuitrago672@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '3012830581', '2005-02-04'),
(2, 1, 'Jose Cuevas', 'jjcuevas0805@gmail.com', '25d55ad283aa400af464c76d713c07ad', '3183036901', '2005-10-08'),
(3, 1, 'Juan Tovar', 'pp4335162@gmail.com', 'fcea920f7412b5da7be0cf42b8c93759', '3223872435', '2005-05-06'),
(4, 1, 'Brandon Rodriguez', 'rodriguezpabonbrandonsteven@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '3112061611', '2005-03-14'),
(5, 2, 'German Sanchez', 'germanasg2004@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '3124099640', '2004-12-12');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'numero del usuario', AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
