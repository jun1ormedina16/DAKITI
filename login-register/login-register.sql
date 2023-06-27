-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2023 a las 15:42:27
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `login-register`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_de_compras`
--

CREATE TABLE `carrito_de_compras` (
  `id` int(111) NOT NULL,
  `resumen_compra` varchar(250) NOT NULL COMMENT 'resumen total de productos y costo',
  `metodo_de_pago` int(100) NOT NULL COMMENT 'metodo a pagar'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `fecha_de_emision` date NOT NULL COMMENT 'fecha en la que se realiza el pedido',
  `nombre_cliente` varchar(50) NOT NULL COMMENT 'nombre del cliente que hace el pedido',
  `descripcion_productos` varchar(250) NOT NULL COMMENT 'resumen de productos seleccionados por el cliente',
  `costo_productos` int(100) NOT NULL COMMENT 'resumen del total a pagar '
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID` int(100) NOT NULL,
  `Nombre_del_producto` varchar(100) NOT NULL COMMENT 'productos existentes',
  `Codigo_producto` varchar(10) NOT NULL COMMENT 'clasificación de los productos por codigo',
  `Categoria` text NOT NULL COMMENT 'clasificación de los producto por categoria',
  `Precio` int(100) NOT NULL COMMENT 'cantidad a pagar por producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID`, `Nombre_del_producto`, `Codigo_producto`, `Categoria`, `Precio`) VALUES
(1, 'Smirnoff XI', 'a1b1', 'aguardiente', 140000),
(2, 'Smirnoff sin azucar', 'a1b2', 'aguardiente', 145000),
(3, 'Amarillo', 'a1b3', 'aguardiente', 140000),
(4, 'Nectar', 'a1b4', 'aguardiente', 140000),
(5, 'Antioqueño', 'a1b5', 'aguardiente', 150000),
(6, 'Zacapa 23 años', 'a2b1', 'ron', 390000),
(7, 'Bacardi', 'a2b2', 'ron', 179000),
(8, 'Viejo de caldas', 'a2b3', 'ron', 159000),
(9, 'Santa fe', 'a2b4', 'ron', 159000),
(10, 'Medellin', 'a2b5', 'ron', 159000),
(11, 'Absolut', 'a3b1', 'Vodka', 210000),
(12, 'Smirnoff', 'a3b2', 'Vodka', 210000),
(13, 'Tanqueray', 'a4b1', 'Ginebra', 300000),
(14, 'Don Julio añejo', 'a5b1', 'Tequila', 430000),
(15, 'Don Julio reposado', 'a5b2', 'Tequila', 399000),
(16, 'Don Julio blanco', 'a5b3', 'Tequila', 360000),
(17, 'Jimador', 'a5b4', 'Tequila', 249000),
(18, 'Jose Cuervo', 'a5b5', 'Tequila', 210000),
(19, 'Champaña', 'a6b1', 'Champaña', 179000),
(20, 'Jhonnie Walker Blue Label', 'a7b1', 'Whisky', 1300000),
(21, 'Buchanan´s master', 'a7b2', 'Whisky', 349000),
(22, 'Buchanan´s 18 años', 'a7b3', 'Whisky', 430000),
(23, 'Old Parr 18 años', 'a7b4', 'Whisky', 430000),
(24, 'Buchanan´s 12 años', 'a7b5', 'Whisky', 315000),
(25, 'Old Parr 12 años', 'a7b6', 'Whisky', 305000),
(26, 'Jhonnie Walker Black Label', 'a7b7', 'Whisky', 305000),
(27, 'Chivas 12 años', 'a7b8', 'Whisky', 305000),
(28, 'Jack Daniel´s', 'a7b9', 'Whisky', 299000),
(29, 'Jhonnie Walker Red Label', 'a7b10', 'Whisky', 179000),
(30, 'Jagermeister', 'a7b11', 'Whisky', 225000),
(31, 'Bailey´s', 'a7b12', 'Whisky', 165000),
(32, 'Heineken', 'a8b1', 'Cerveza', 12000),
(33, 'Corona 330 ml', 'a8b2', 'Cerveza', 12000),
(34, 'Smirnoff ICE', 'a9b1', 'Otros', 16000),
(35, 'Red Bull', 'a9b2', 'Otros', 13000),
(36, 'Gatorade', 'a9b3', 'Otros', 8000),
(37, 'Agua / gaseosa', 'a9b4', 'Otros', 6000),
(38, 'Chiclet´s', 'a9b5', 'Otros', 5000),
(39, 'Cigarrillo 1/2 paquete', 'a9b6', 'Otros', 10000),
(40, 'Encendedores', 'a9b7', 'Otros', 25000),
(41, 'Bom bom bun', 'a9b8', 'Otros', 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(111) NOT NULL,
  `descripcion` varchar(250) NOT NULL COMMENT 'aqui se observan los roles que hay en DAKITI'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_1` text NOT NULL COMMENT 'primer nombre',
  `nombre_2` text NOT NULL COMMENT 'segundo nombre',
  `apellido_1` text NOT NULL COMMENT 'primer apellido',
  `apellido_2` text NOT NULL COMMENT 'segundo apellido',
  `correo` varchar(50) NOT NULL COMMENT 'para registrarse, iniciar sesion y recuperar contraseña',
  `contrasena` varchar(50) NOT NULL COMMENT 'para acceder a la cuenta',
  `rol` varchar(50) NOT NULL COMMENT 'para clasificar el acceso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito_de_compras`
--
ALTER TABLE `carrito_de_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito_de_compras`
--
ALTER TABLE `carrito_de_compras`
  MODIFY `id` int(111) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
