-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-07-2020 a las 18:48:14
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `academico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE IF NOT EXISTS `carrera` (
  `idcarrera` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(12) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`idcarrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idcarrera`, `codigo`, `nombre`, `estado`) VALUES
(1, 'CA001', 'Ing. de Sistemas', 'A'),
(2, 'CA002', 'Administracion', 'A'),
(3, 'CA003', 'Ing. Mecánica', 'A'),
(4, 'CA004', 'Ing. Electrónica', 'A'),
(5, 'CA005', 'Contabilidad', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `idcurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(12) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `horas` int(11) NOT NULL,
  `creditos` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`idcurso`, `codigo`, `nombre`, `horas`, `creditos`, `estado`) VALUES
(1, 'C1011', 'Fundamento de programación', 7, 5, 'D'),
(4, 'C1040', 'Sistemas digitales', 5, 4, 'A'),
(8, 'C1015', 'Lenguaje de programación II', 6, 3, 'A'),
(9, 'C1045', 'Diseño de Sistemas', 4, 2, 'A'),
(12, 'C1036', 'Diseño de base de datos', 4, 6, 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
  `idestudiante` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `codigo` varchar(12) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`idestudiante`),
  UNIQUE KEY `dni` (`dni`,`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idestudiante`, `nombre`, `apellidos`, `dni`, `codigo`, `estado`) VALUES
(4, 'jean', 'Jara Solis', '99885252', '1813011518', 'A'),
(8, 'ernesto carlos', 'diaz sanchez', '55883391', '1813011511', 'D'),
(9, 'jose elias', 'padilla mattos', '88550022', '1813011519', 'A'),
(14, 'Alex', 'Palacios Gutierrez', '77216800', '1813011517', 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE IF NOT EXISTS `matricula` (
  `idmatricula` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `semestre` varchar(10) NOT NULL,
  `ciclo` varchar(2) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `idestudiante` int(10) unsigned NOT NULL,
  `idcurso` int(10) unsigned NOT NULL,
  `idcarrera` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idmatricula`),
  KEY `idestudiante` (`idestudiante`),
  KEY `idcurso` (`idcurso`),
  KEY `idcarrera` (`idcarrera`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`idmatricula`, `semestre`, `ciclo`, `estado`, `idestudiante`, `idcurso`, `idcarrera`) VALUES
(8, '2020-2', '5', 'A', 4, 8, 1),
(9, '2017-2', '2', 'A', 8, 1, 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_5` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_6` FOREIGN KEY (`idcurso`) REFERENCES `curso` (`idcurso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_7` FOREIGN KEY (`idcarrera`) REFERENCES `carrera` (`idcarrera`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
