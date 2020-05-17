-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2020 a las 06:47:57
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webcalendario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendarios`
--

CREATE TABLE `calendarios` (
  `idcalendario` int(20) NOT NULL,
  `usuario` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calendarios`
--

INSERT INTO `calendarios` (`idcalendario`, `usuario`, `nombre`, `color`) VALUES
(1, 1, 'clases', '255,200,200'),
(2, 1, 'vacaciones', '200,250,200'),
(3, 3, 'practica', '200,200,255');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `idevento` int(30) NOT NULL,
  `calendario` int(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `anio` int(4) NOT NULL,
  `mes` int(2) NOT NULL,
  `dia` int(2) NOT NULL,
  `hora` int(2) NOT NULL,
  `minuto` int(2) NOT NULL,
  `segundos` int(2) NOT NULL,
  `duracion` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`idevento`, `calendario`, `nombre`, `anio`, `mes`, `dia`, `hora`, `minuto`, `segundos`, `duracion`) VALUES
(1, 1, 'clase', 2014, 5, 5, 4, 20, 20, 300),
(8, 1, '34', 2014, 9, 4, 1, 2, 0, 30),
(9, 1, '455', 2014, 9, 3, 1, 5, 0, 240),
(10, 3, '4548', 2014, 9, 10, 2, 6, 0, 210),
(11, 3, '4548', 2014, 9, 10, 2, 6, 0, 210),
(12, 2, '45', 2014, 9, 13, 3, 10, 0, 300),
(13, 2, '45', 2014, 9, 13, 3, 10, 0, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ideusuario`
--

CREATE TABLE `ideusuario` (
  `idusuario` int(10) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regstros`
--

CREATE TABLE `regstros` (
  `idregistro` int(255) NOT NULL,
  `utc` int(255) NOT NULL,
  `anio` int(4) NOT NULL,
  `mes` int(2) NOT NULL,
  `dia` int(2) NOT NULL,
  `diassemana` int(2) NOT NULL,
  `hora` int(2) NOT NULL,
  `minuto` int(2) NOT NULL,
  `segundo` int(2) NOT NULL,
  `ip` int(255) NOT NULL,
  `navegador` int(255) NOT NULL,
  `resolucion` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(10) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `usuario`, `contrasena`, `nombre`, `apellido`, `email`) VALUES
(1, 'jhon', 'jhon', 'jhon', 'monroy', 'jhoedmon@gmail.com'),
(2, 'jhon', 'jhon', 'jhon', 'monroy', 'jhoedmon@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calendarios`
--
ALTER TABLE `calendarios`
  ADD PRIMARY KEY (`idcalendario`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`idevento`);

--
-- Indices de la tabla `ideusuario`
--
ALTER TABLE `ideusuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `regstros`
--
ALTER TABLE `regstros`
  ADD PRIMARY KEY (`idregistro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calendarios`
--
ALTER TABLE `calendarios`
  MODIFY `idcalendario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `idevento` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ideusuario`
--
ALTER TABLE `ideusuario`
  MODIFY `idusuario` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `regstros`
--
ALTER TABLE `regstros`
  MODIFY `idregistro` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
