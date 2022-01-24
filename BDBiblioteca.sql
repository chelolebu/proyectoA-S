-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-01-2022 a las 02:15:09
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `BDBiblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Autor`
--

CREATE TABLE `Autor` (
  `id_Autor` varchar(10) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Pais` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Autor`
--

INSERT INTO `Autor` (`id_Autor`, `Nombre`, `Pais`) VALUES
('4579', 'Pedro Garcia Marquez', 'Colombia'),
('6754', 'Juan Gomez Carreño', 'Chileno'),
('PO-87346', 'Pablo Neruda', 'Chile'),
('RT-90123', 'Gabriela Mistral', 'Chile'),
('TR-9087', 'Gabriel Garcia Marquez', 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Detalle_prestamo`
--

CREATE TABLE `Detalle_prestamo` (
  `Numero_Ejemplar` varchar(10) NOT NULL,
  `Fecha_Devolucion` date NOT NULL,
  `Prestamo_id_Prestamo` varchar(10) NOT NULL,
  `Libro_id_Libros` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Editorial`
--

CREATE TABLE `Editorial` (
  `id_Edtorial` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Pais` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Detalle_Editorial` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Editorial_has_Libro`
--

CREATE TABLE `Editorial_has_Libro` (
  `Editorial_id_Edtorial` int(11) NOT NULL,
  `Libro_id_Libros` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Libro`
--

CREATE TABLE `Libro` (
  `id_Libros` varchar(10) NOT NULL,
  `Titulo` varchar(25) NOT NULL,
  `Tema` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Libro`
--

INSERT INTO `Libro` (`id_Libros`, `Titulo`, `Tema`) VALUES
('12345AS', 'El Principito', 'Infantil'),
('19072YT', 'El Señor de los Anillo', 'Ficcion'),
('45320JK', 'Harry Potter ', 'Ficcional'),
('67545KP', '50 sombas ', 'Romantico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Libro_has_Autor`
--

CREATE TABLE `Libro_has_Autor` (
  `Libro_id_Libros` varchar(10) NOT NULL,
  `Autor_id_Autor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Libro_has_Autor`
--

INSERT INTO `Libro_has_Autor` (`Libro_id_Libros`, `Autor_id_Autor`) VALUES
('12345AS', '4579'),
('19072YT', '6754');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Multa`
--

CREATE TABLE `Multa` (
  `id_Multa` int(11) NOT NULL,
  `Valor_Multa` varchar(45) NOT NULL,
  `Dias_Multa` varchar(45) NOT NULL,
  `Prestamo_id_Prestamo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Prestamo`
--

CREATE TABLE `Prestamo` (
  `id_Prestamo` varchar(10) NOT NULL,
  `Fecha_Prestamo` date NOT NULL,
  `Usuario_Identificacion` int(11) NOT NULL,
  `Socio_id_Socio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Socio`
--

CREATE TABLE `Socio` (
  `id_Socio` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `Identificacion` int(11) NOT NULL,
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Apellido_Usuario` varchar(50) NOT NULL,
  `Telefono_Usuario` varchar(50) NOT NULL,
  `Login` varchar(10) NOT NULL,
  `Password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Autor`
--
ALTER TABLE `Autor`
  ADD PRIMARY KEY (`id_Autor`);

--
-- Indices de la tabla `Detalle_prestamo`
--
ALTER TABLE `Detalle_prestamo`
  ADD PRIMARY KEY (`Prestamo_id_Prestamo`,`Libro_id_Libros`),
  ADD KEY `fk_Prestamo_has_Libro_Libro1_idx` (`Libro_id_Libros`);

--
-- Indices de la tabla `Editorial`
--
ALTER TABLE `Editorial`
  ADD PRIMARY KEY (`id_Edtorial`);

--
-- Indices de la tabla `Editorial_has_Libro`
--
ALTER TABLE `Editorial_has_Libro`
  ADD PRIMARY KEY (`Editorial_id_Edtorial`,`Libro_id_Libros`),
  ADD KEY `fk_Editorial_has_Libro_Libro1_idx` (`Libro_id_Libros`),
  ADD KEY `fk_Editorial_has_Libro_Editorial1_idx` (`Editorial_id_Edtorial`);

--
-- Indices de la tabla `Libro`
--
ALTER TABLE `Libro`
  ADD PRIMARY KEY (`id_Libros`);

--
-- Indices de la tabla `Libro_has_Autor`
--
ALTER TABLE `Libro_has_Autor`
  ADD PRIMARY KEY (`Libro_id_Libros`,`Autor_id_Autor`),
  ADD KEY `fk_Libro_has_Autor_Autor1_idx` (`Autor_id_Autor`),
  ADD KEY `fk_Libro_has_Autor_Libro_idx` (`Libro_id_Libros`);

--
-- Indices de la tabla `Multa`
--
ALTER TABLE `Multa`
  ADD PRIMARY KEY (`id_Multa`,`Prestamo_id_Prestamo`),
  ADD KEY `fk_Multa_Prestamo1_idx` (`Prestamo_id_Prestamo`);

--
-- Indices de la tabla `Prestamo`
--
ALTER TABLE `Prestamo`
  ADD PRIMARY KEY (`id_Prestamo`,`Usuario_Identificacion`,`Socio_id_Socio`),
  ADD KEY `fk_Prestamo_Usuario1_idx` (`Usuario_Identificacion`),
  ADD KEY `fk_Prestamo_Socio1_idx` (`Socio_id_Socio`);

--
-- Indices de la tabla `Socio`
--
ALTER TABLE `Socio`
  ADD PRIMARY KEY (`id_Socio`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`Identificacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Detalle_prestamo`
--
ALTER TABLE `Detalle_prestamo`
  ADD CONSTRAINT `fk_Prestamo_has_Libro_Libro1` FOREIGN KEY (`Libro_id_Libros`) REFERENCES `Libro` (`id_Libros`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Prestamo_has_Libro_Prestamo1` FOREIGN KEY (`Prestamo_id_Prestamo`) REFERENCES `Prestamo` (`id_Prestamo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Editorial_has_Libro`
--
ALTER TABLE `Editorial_has_Libro`
  ADD CONSTRAINT `fk_Editorial_has_Libro_Editorial1` FOREIGN KEY (`Editorial_id_Edtorial`) REFERENCES `Editorial` (`id_Edtorial`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Editorial_has_Libro_Libro1` FOREIGN KEY (`Libro_id_Libros`) REFERENCES `Libro` (`id_Libros`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Libro_has_Autor`
--
ALTER TABLE `Libro_has_Autor`
  ADD CONSTRAINT `fk_Libro_has_Autor_Autor1` FOREIGN KEY (`Autor_id_Autor`) REFERENCES `Autor` (`id_Autor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Libro_has_Autor_Libro` FOREIGN KEY (`Libro_id_Libros`) REFERENCES `Libro` (`id_Libros`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Multa`
--
ALTER TABLE `Multa`
  ADD CONSTRAINT `fk_Multa_Prestamo1` FOREIGN KEY (`Prestamo_id_Prestamo`) REFERENCES `Prestamo` (`id_Prestamo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Prestamo`
--
ALTER TABLE `Prestamo`
  ADD CONSTRAINT `fk_Prestamo_Socio1` FOREIGN KEY (`Socio_id_Socio`) REFERENCES `Socio` (`id_Socio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Prestamo_Usuario1` FOREIGN KEY (`Usuario_Identificacion`) REFERENCES `Usuario` (`Identificacion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
