-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 19-05-2026 a las 19:29:50
-- Versión del servidor: 8.4.7
-- Versión de PHP: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_logistica_pro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

DROP TABLE IF EXISTS `almacen`;
CREATE TABLE IF NOT EXISTS `almacen` (
  `id_almacen` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacidad_m3` decimal(10,2) DEFAULT NULL,
  `id_empresa` int DEFAULT NULL,
  `estado` enum('operativo','mantenimiento','cerrado') COLLATE utf8mb4_unicode_ci DEFAULT 'operativo',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_almacen`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id_almacen`, `nombre`, `direccion`, `ciudad`, `capacidad_m3`, `id_empresa`, `estado`, `fecha_registro`) VALUES
(1, 'Almacen Norte', 'Av 1', 'Quito', 1000.00, 1, 'operativo', '2026-04-28 18:11:24'),
(2, 'Almacen Sur', 'Av 2', 'Guayaquil', 1500.00, 2, 'operativo', '2026-04-28 18:11:24'),
(3, 'prueba', 'prueba', 'prueba', 1000.00, 5, 'mantenimiento', '2026-05-05 23:42:00'),
(4, 'Centro Dist. Guayaquil', 'Vía Perimetral Km 12', 'Guayaquil', 5000.00, 2, 'operativo', '2026-04-28 23:42:00'),
(5, 'Almacén Central Cuenca', 'Parque Industrial Uc-01', 'Cuenca', 1800.00, 3, 'operativo', '2026-04-28 23:42:00'),
(6, 'Bodega Integral Sur', 'Av. Simón Bolívar Km 5', 'Quito', 3200.00, 4, 'mantenimiento', '2026-04-28 23:42:00'),
(7, 'Depósito Loja', 'Av. Universitaria 340', 'Loja', 900.00, 5, 'cerrado', '2026-04-28 23:42:00'),
(8, 'Bodega Norte Ibarra', 'Panamericana Norte Km 2', 'Ibarra', 1200.00, 6, 'operativo', '2026-04-28 23:42:00'),
(9, 'Bodega Sur Q2', 'Av. Morán Valverde Km 4', 'Quito', 1800.00, 1, 'operativo', '2026-04-28 23:49:00'),
(10, 'Bodega Este Q3', 'Av. Simón Bolívar Km 12', 'Quito', 2200.00, 4, 'operativo', '2026-04-28 23:49:00'),
(11, 'Depósito Manta', 'Av. 4 de Noviembre 230', 'Manta', 1500.00, 2, 'operativo', '2026-04-28 23:49:00'),
(12, 'Centro Dist. Machala', 'Av. Las Palmeras Km 6', 'Machala', 2800.00, 2, 'operativo', '2026-04-28 23:49:00'),
(13, 'Bodega Esmeraldas', 'Av. Libertad 890', 'Esmeraldas', 1100.00, 6, 'operativo', '2026-04-28 23:49:00'),
(14, 'Almacén Riobamba', 'Parque Industrial Riobamba', 'Riobamba', 1600.00, 3, 'operativo', '2026-04-28 23:49:00'),
(15, 'Depósito Ambato', 'Av. El Cóndor 450', 'Ambato', 1400.00, 1, 'operativo', '2026-04-28 23:49:00'),
(16, 'Bodega Sto. Domingo', 'Av. Quito Km 2', 'Santo Domingo', 1900.00, 4, 'operativo', '2026-04-28 23:49:00'),
(17, 'Centro Dist. Portoviejo', 'Av. Universitaria 670', 'Portoviejo', 1300.00, 2, 'operativo', '2026-04-28 23:49:00'),
(18, 'Almacén Latacunga', 'Av. Amazonas 340', 'Latacunga', 950.00, 1, 'operativo', '2026-04-28 23:49:00'),
(19, 'Bodega Tulcán', 'Av. Manabí 120', 'Tulcán', 700.00, 6, 'mantenimiento', '2026-04-28 23:49:00'),
(20, 'Depósito Babahoyo', 'Av. 5 de Junio 560', 'Babahoyo', 1050.00, 2, 'operativo', '2026-04-28 23:49:00'),
(21, 'Centro Log. Quevedo', 'Av. Walter Andrade Km 3', 'Quevedo', 1750.00, 4, 'operativo', '2026-04-28 23:49:00'),
(22, 'Bodega Milagro', 'Av. Chirijos 234', 'Milagro', 880.00, 2, 'operativo', '2026-04-28 23:49:00'),
(23, 'Almacén Azogues', 'Vía Azogues-Cuenca Km 1', 'Azogues', 620.00, 3, 'operativo', '2026-04-28 23:49:00'),
(66, 'Almacén Central Norte', 'Av. Amazonas 1234', 'Quito', 1500.50, 1, 'operativo', '2026-04-29 00:04:32'),
(67, 'Depósito Sur', 'Calle 10 de Agosto 456', 'Guayaquil', 2000.00, 2, 'operativo', '2026-04-29 00:04:32'),
(68, 'Bodega El Carmen', 'Av. Manabí 789', 'El Carmen', 850.75, 3, 'mantenimiento', '2026-04-29 00:04:32'),
(69, 'Almacén Costa', 'Malecón 2000', 'Guayaquil', 3000.00, 2, 'operativo', '2026-04-29 00:04:32'),
(70, 'Bodega Sierra', 'Av. Los Shyris 321', 'Quito', 1200.00, 1, 'cerrado', '2026-04-29 00:04:32'),
(71, 'Depósito Oriente', 'Av. Amazonas y Colón', 'Quito', 950.25, 4, 'operativo', '2026-04-29 00:04:32'),
(72, 'Almacén Industrial', 'Parque Industrial Km 12', 'Manta', 5000.00, 5, 'operativo', '2026-04-29 00:04:32'),
(73, 'Bodega Portuaria', 'Puerto Marítimo', 'Guayaquil', 4200.00, 2, 'mantenimiento', '2026-04-29 00:04:32'),
(74, 'Depósito Andino', 'Av. Universitaria 456', 'Cuenca', 1100.00, 6, 'operativo', '2026-04-29 00:04:32'),
(75, 'Almacén Norte', 'Av. La Prensa 789', 'Quito', 1300.00, 1, 'operativo', '2026-04-29 00:04:32'),
(76, 'Bodega Sur', 'Av. Quito 654', 'Loja', 900.00, 7, 'cerrado', '2026-04-29 00:04:32'),
(77, 'Depósito Central', 'Av. América 111', 'Quito', 2500.00, 1, 'operativo', '2026-04-29 00:04:32'),
(78, 'Almacén Pacífico', 'Av. Flavio Reyes 222', 'Manta', 3100.00, 5, 'operativo', '2026-04-29 00:04:32'),
(79, 'Bodega Metropolitana', 'Av. Galo Plaza 333', 'Quito', 2800.00, 1, 'mantenimiento', '2026-04-29 00:04:32'),
(80, 'Depósito Amazónico', 'Av. Tarqui 444', 'Tena', 750.00, 8, 'operativo', '2026-04-29 00:04:32'),
(81, 'Almacén Regional', 'Av. Bolívar 555', 'Ambato', 1600.00, 9, 'operativo', '2026-04-29 00:04:32'),
(83, 'Depósito Urbano', 'Av. Kennedy 777', 'Guayaquil', 1400.00, 2, 'cerrado', '2026-04-29 00:04:32'),
(84, 'Almacén Logístico', 'Av. Eloy Alfaro 888', 'Quito', 3500.00, 1, 'operativo', '2026-04-29 00:04:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('persona','empresa') COLLATE utf8mb4_unicode_ci DEFAULT 'persona',
  `estado` enum('activo','inactivo') COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `telefono`, `email`, `direccion`, `tipo`, `estado`, `fecha_registro`) VALUES
(1, 'Juan Perez', '099000001', 'juan@mail.com', 'Quito', 'persona', 'activo', '2026-04-28 18:11:24'),
(2, 'Maria Lopez', '099000002', 'maria@mail.com', 'Guayaquil', 'persona', 'activo', '2026-04-28 18:11:24'),
(3, 'Carlos Mendoza', '+593-99-1234567', 'carlos.mendoza@gmail.com', 'Calle Los Cedros 12, Quito', 'persona', 'activo', '2026-04-28 23:42:00'),
(4, 'Supermercados MegaMart', '+593-2-8889001', 'logistica@megamart.ec', 'Av. Occidental Km 3, Quito', 'empresa', 'activo', '2026-04-28 23:42:00'),
(5, 'Ana Lucía Torres', '+593-98-2345678', 'ana.torres@hotmail.com', 'Urb. Los Pinos Mz. 4, Guayaquil', 'persona', 'activo', '2026-04-28 23:42:00'),
(6, 'Industrias Plásticas Andes', '+593-4-7770002', 'compras@ipandes.ec', 'Parque Industrial Norte, Guayaquil', 'empresa', 'activo', '2026-04-28 23:42:00'),
(7, 'Roberto Aguirre', '+593-97-3456789', 'roberto.aguirre@yahoo.com', 'Av. Solano 456, Cuenca', 'persona', 'inactivo', '2026-04-28 23:42:00'),
(8, 'Farmacéutica Nacional', '+593-2-6660003', 'despacho@farmanacional.ec', 'Av. Patria 234, Quito', 'empresa', 'activo', '2026-04-28 23:42:00'),
(9, 'María Fernanda Vega', '+593-96-4567890', 'mfvega@gmail.com', 'Cdla. Kennedy Norte, Guayaquil', 'persona', 'activo', '2026-04-28 23:42:00'),
(10, 'Textiles Cuenca S.A.', '+593-7-5550004', 'envios@textilescuenca.ec', 'Parque Industrial Chaullabamba, Cuenca', 'empresa', 'activo', '2026-04-28 23:42:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conductor`
--

DROP TABLE IF EXISTS `conductor`;
CREATE TABLE IF NOT EXISTS `conductor` (
  `id_conductor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documento` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licencia` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_vencimiento_licencia` date DEFAULT NULL,
  `id_empresa` int DEFAULT NULL,
  `estado` enum('activo','inactivo') COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  PRIMARY KEY (`id_conductor`),
  UNIQUE KEY `documento` (`documento`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `conductor`
--

INSERT INTO `conductor` (`id_conductor`, `nombre`, `documento`, `telefono`, `licencia`, `fecha_vencimiento_licencia`, `id_empresa`, `estado`) VALUES
(1, 'Carlos Ruiz', '0101', '099111222', 'LIC001', '2027-01-01', 1, 'activo'),
(2, 'Pedro Diaz', '0202', '099333444', 'LIC002', '2027-06-01', 2, 'activo'),
(3, 'Jorge Luis Pazmiño', '1712345678', '+593-99-8765432', 'E-TI-0012345', '2026-03-15', 1, 'activo'),
(4, 'Diego Armando Reyes', '0923456789', '+593-98-7654321', 'E-TI-0023456', '2025-11-20', 1, 'activo'),
(5, 'Luis Alberto Mora', '0134567890', '+593-97-6543210', 'E-TI-0034567', '2027-01-10', 2, 'activo'),
(6, 'Freddy Oswaldo Calle', '0145678901', '+593-96-5432109', 'D-TI-0045678', '2025-09-30', 2, 'inactivo'),
(7, 'Marco Vinicio Soto', '0156789012', '+593-95-4321098', 'E-TI-0056789', '2026-07-22', 3, 'activo'),
(8, 'Raúl Eduardo Navas', '1067890123', '+593-94-3210987', 'E-TI-0067890', '2028-02-14', 4, 'activo'),
(9, 'Hernán Rodrigo Loja', '1178901234', '+593-93-2109876', 'D-TI-0078901', '2026-05-05', 5, 'inactivo'),
(10, 'Iván Patricio Unda', '1089012345', '+593-92-1098765', 'E-TI-0089012', '2027-08-18', 6, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('transportista','logistica') COLLATE utf8mb4_unicode_ci DEFAULT 'transportista',
  `estado` enum('activo','inactivo') COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empresa`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre`, `telefono`, `email`, `password`, `direccion`, `tipo`, `estado`, `fecha_registro`) VALUES
(1, 'Transporte Pro', '099111111', 'pro@mail.com', '1234', 'Quito', 'transportista', 'activo', '2026-04-28 18:11:24'),
(2, 'Logistica Plus', '099222222', 'plus@mail.com', '1234', 'Guayaquil', 'logistica', 'activo', '2026-04-28 18:11:24'),
(3, 'david josue', '0984287976', 'tes_gamer425@proton.me', '$2a$12$rjC.TwUegnqFFk6eqbbL9OBkk6BKydso8y05rNAB8LW49NtD7EodO', 'manabi', 'logistica', 'activo', '2026-04-28 18:13:02'),
(4, 'TransAndina S.A.', '+593-2-2234567', 'contacto@transandina.ec', '$2a$04$JTau4HEIf36AptDxkzjN9OELMHLiVySWUw8CHfwGaLpPS/tgupYK.', 'Av. Amazonas 1234, Quito', 'transportista', 'activo', '2026-04-28 23:42:00'),
(5, 'LogiCarga Ecuador', '+593-4-3345678', 'info@logicarga.ec', '$2a$04$JTau4HEIf36AptDxkzjN9OELMHLiVySWUw8CHfwGaLpPS/tgupYK.', 'Av. 9 de Octubre 567, Guayaquil', 'logistica', 'activo', '2026-04-28 23:42:00'),
(6, 'FlotaExpress Cía.', '+593-7-4456789', 'ops@flotaexpress.ec', '$2a$04$JTau4HEIf36AptDxkzjN9OELMHLiVySWUw8CHfwGaLpPS/tgupYK.', 'Calle Bolívar 890, Cuenca', 'transportista', 'activo', '2026-04-28 23:42:00'),
(7, 'IntegralLog S.A.', '+593-2-5567890', 'ventas@integrallog.ec', '$2a$04$JTau4HEIf36AptDxkzjN9OELMHLiVySWUw8CHfwGaLpPS/tgupYK.', 'Av. República 456, Quito', 'logistica', 'activo', '2026-04-28 23:42:00'),
(8, 'CargaSur Ecuador', '+593-7-6678901', 'admin@cargasur.ec', '$2a$04$JTau4HEIf36AptDxkzjN9OELMHLiVySWUw8CHfwGaLpPS/tgupYK.', 'Av. Loja 321, Loja', 'transportista', 'inactivo', '2026-04-28 23:42:00'),
(9, 'NorteTransporte', '+593-6-7789012', 'info@nortetransporte.ec', '$2a$04$JTau4HEIf36AptDxkzjN9OELMHLiVySWUw8CHfwGaLpPS/tgupYK.', 'Av. Atahualpa 789, Ibarra', 'transportista', 'activo', '2026-04-28 23:42:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

DROP TABLE IF EXISTS `entrega`;
CREATE TABLE IF NOT EXISTS `entrega` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `id_envio` int DEFAULT NULL,
  `id_almacen_origen` int DEFAULT NULL,
  `id_almacen_destino` int DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `fecha_llegada` datetime DEFAULT NULL,
  `estado` enum('pendiente','en_transito','entregado') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  PRIMARY KEY (`id_entrega`),
  KEY `id_envio` (`id_envio`),
  KEY `id_almacen_origen` (`id_almacen_origen`),
  KEY `id_almacen_destino` (`id_almacen_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `entrega`
--

INSERT INTO `entrega` (`id_entrega`, `id_envio`, `id_almacen_origen`, `id_almacen_destino`, `fecha_salida`, `fecha_llegada`, `estado`) VALUES
(1, 1, 1, 2, '2026-04-28 13:11:24', NULL, 'en_transito'),
(2, 2, 2, 1, '2026-04-28 13:11:24', NULL, 'pendiente'),
(3, 1, 1, 2, '2025-01-05 08:30:00', '2025-01-05 15:10:00', 'entregado'),
(4, 2, 2, 3, '2025-01-10 10:00:00', '2025-01-10 14:05:00', 'entregado'),
(5, 3, 1, 3, '2025-01-18 07:30:00', '2025-01-18 15:20:00', 'entregado'),
(6, 4, 3, 5, '2025-02-03 10:30:00', '2025-02-03 14:10:00', 'entregado'),
(7, 5, 6, 1, '2025-02-14 09:00:00', '2025-02-14 11:05:00', 'entregado'),
(8, 6, 2, 2, '2025-02-28 11:30:00', '2025-02-28 14:35:00', 'entregado'),
(9, 7, 1, 2, '2025-03-07 08:00:00', NULL, 'en_transito'),
(10, 8, 2, 3, '2025-03-10 09:30:00', NULL, 'en_transito'),
(11, 9, 6, 1, NULL, NULL, 'pendiente'),
(12, 10, 3, 5, NULL, NULL, 'pendiente'),
(13, 11, 1, 2, '2025-01-08 07:30:00', '2025-01-08 14:00:00', 'entregado'),
(14, 12, 1, 3, '2025-01-15 09:00:00', '2025-01-15 16:45:00', 'entregado'),
(15, 13, 2, 3, '2025-01-22 09:30:00', '2025-01-22 13:40:00', 'entregado'),
(16, 13, 3, 14, '2025-01-28 10:30:00', '2025-01-28 14:05:00', 'entregado'),
(17, 15, 2, 9, '2025-02-05 08:00:00', '2025-02-05 11:10:00', 'entregado'),
(18, 16, 6, 1, '2025-02-09 08:30:00', '2025-02-09 10:35:00', 'entregado'),
(19, 17, 1, 2, '2025-02-17 10:00:00', '2025-02-17 16:30:00', 'entregado'),
(20, 18, 2, 3, '2025-02-20 10:30:00', '2025-02-20 14:40:00', 'entregado'),
(21, 19, 1, 3, '2025-02-25 07:30:00', '2025-02-25 15:10:00', 'entregado'),
(22, 20, 3, 5, '2025-03-01 09:15:00', '2025-03-01 12:50:00', 'entregado'),
(23, 21, 2, 9, '2025-03-04 08:00:00', '2025-03-04 11:05:00', 'entregado'),
(24, 22, 6, 1, '2025-03-06 09:30:00', '2025-03-06 11:40:00', 'entregado'),
(25, 23, 1, 2, '2025-03-08 08:30:00', NULL, 'en_transito'),
(26, 24, 2, 3, '2025-03-09 11:00:00', NULL, 'en_transito'),
(27, 25, 1, 3, '2025-03-11 07:30:00', NULL, 'en_transito'),
(28, 26, 2, 9, '2025-03-11 09:30:00', NULL, 'en_transito'),
(29, 27, 3, 5, NULL, NULL, 'pendiente'),
(30, 28, 6, 1, NULL, NULL, 'pendiente'),
(31, 29, 1, 2, NULL, NULL, 'pendiente'),
(32, 30, 2, 3, NULL, NULL, 'pendiente'),
(33, 1, 7, 8, '2025-01-06 07:00:00', '2025-01-06 09:10:00', 'entregado'),
(34, 2, 9, 10, '2025-01-11 08:00:00', '2025-01-11 09:30:00', 'entregado'),
(35, 3, 8, 11, '2025-01-19 07:00:00', '2025-01-19 10:20:00', 'entregado'),
(36, 4, 12, 15, '2025-02-04 09:00:00', '2025-02-04 12:15:00', 'entregado'),
(37, 5, 13, 7, '2025-02-15 08:00:00', '2025-02-15 11:05:00', 'entregado'),
(38, 6, 12, 16, '2025-03-01 10:00:00', '2025-03-01 13:20:00', 'entregado'),
(39, 11, 4, 12, '2025-01-09 07:00:00', '2025-01-09 09:45:00', 'entregado'),
(40, 12, 10, 17, '2025-01-16 08:00:00', '2025-01-16 11:30:00', 'entregado'),
(41, 17, 5, 13, '2025-02-18 07:30:00', '2025-02-18 10:50:00', 'entregado'),
(42, 19, 6, 14, '2025-02-26 08:00:00', '2025-02-26 11:15:00', 'entregado'),
(44, 3, 2, NULL, NULL, NULL, 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

DROP TABLE IF EXISTS `envio`;
CREATE TABLE IF NOT EXISTS `envio` (
  `id_envio` int NOT NULL AUTO_INCREMENT,
  `fecha_envio` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_cliente` int DEFAULT NULL,
  `id_ruta` int DEFAULT NULL,
  `id_vehiculo` int DEFAULT NULL,
  `id_conductor` int DEFAULT NULL,
  `peso_kg` decimal(10,2) DEFAULT NULL,
  `volumen_m3` decimal(10,2) DEFAULT NULL,
  `costo_envio` decimal(10,2) DEFAULT NULL,
  `estado` enum('pendiente','en_transito','entregado') COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  PRIMARY KEY (`id_envio`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_ruta` (`id_ruta`),
  KEY `id_vehiculo` (`id_vehiculo`),
  KEY `id_conductor` (`id_conductor`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `envio`
--

INSERT INTO `envio` (`id_envio`, `fecha_envio`, `id_cliente`, `id_ruta`, `id_vehiculo`, `id_conductor`, `peso_kg`, `volumen_m3`, `costo_envio`, `estado`) VALUES
(1, '2026-04-28 13:11:24', 1, 1, 1, 1, 1000.00, 5.00, 500.00, 'pendiente'),
(2, '2026-04-28 13:11:24', 2, 2, 2, 2, 800.00, 4.00, 300.00, 'pendiente'),
(3, '2025-01-05 08:00:00', 2, 1, 2, 1, 8500.00, 24.00, 1250.00, 'entregado'),
(4, '2025-01-10 09:30:00', 4, 2, 3, 3, 1200.00, 4.50, 320.00, 'entregado'),
(5, '2025-01-18 07:00:00', 6, 3, 1, 2, 5400.00, 15.00, 890.00, 'entregado'),
(6, '2025-02-03 10:00:00', 8, 4, 5, 5, 3200.00, 9.00, 540.00, 'entregado'),
(7, '2025-02-14 08:45:00', 1, 5, 6, 6, 800.00, 1.80, 115.00, 'entregado'),
(8, '2025-02-28 11:00:00', 2, 6, 4, 4, 2100.00, 7.20, 410.00, 'entregado'),
(9, '2025-03-07 07:30:00', 3, 1, 2, 1, 9200.00, 28.00, 1380.00, 'en_transito'),
(10, '2025-03-10 09:00:00', 7, 2, 3, 3, 950.00, 3.10, 275.00, 'en_transito'),
(11, '2025-03-12 08:00:00', 5, 5, 6, 6, 620.00, 1.40, 98.00, 'pendiente'),
(12, '2025-03-13 10:30:00', 8, 4, 5, 5, 2800.00, 8.50, 490.00, 'pendiente'),
(13, '2025-01-08 07:00:00', 4, 1, 2, 1, 7800.00, 22.00, 1140.00, 'entregado'),
(14, '2025-01-15 08:30:00', 6, 3, 1, 2, 4900.00, 14.00, 810.00, 'entregado'),
(15, '2025-01-22 09:00:00', 2, 2, 3, 3, 1500.00, 5.00, 360.00, 'entregado'),
(16, '2025-01-28 10:00:00', 8, 4, 5, 5, 2900.00, 8.00, 500.00, 'entregado'),
(17, '2025-02-05 07:30:00', 1, 6, 4, 4, 1900.00, 6.50, 390.00, 'entregado'),
(18, '2025-02-09 08:00:00', 3, 5, 6, 6, 700.00, 1.60, 105.00, 'entregado'),
(19, '2025-02-17 09:30:00', 7, 1, 2, 1, 9000.00, 26.00, 1320.00, 'entregado'),
(20, '2025-02-20 10:00:00', 5, 2, 3, 3, 1100.00, 3.80, 295.00, 'entregado'),
(21, '2025-02-25 07:00:00', 2, 3, 1, 2, 6200.00, 18.00, 970.00, 'entregado'),
(22, '2025-03-01 08:45:00', 6, 4, 5, 5, 3400.00, 9.50, 580.00, 'entregado'),
(23, '2025-03-04 07:30:00', 4, 6, 4, 4, 2300.00, 7.80, 430.00, 'entregado'),
(24, '2025-03-06 09:00:00', 8, 5, 6, 6, 850.00, 2.00, 120.00, 'entregado'),
(25, '2025-03-08 08:00:00', 1, 1, 2, 1, 8100.00, 23.50, 1190.00, 'en_transito'),
(26, '2025-03-09 10:30:00', 3, 2, 3, 3, 1300.00, 4.20, 310.00, 'en_transito'),
(27, '2025-03-11 07:00:00', 7, 3, 1, 2, 5700.00, 16.50, 920.00, 'en_transito'),
(28, '2025-03-11 09:00:00', 5, 6, 4, 4, 2000.00, 6.80, 400.00, 'en_transito'),
(29, '2025-03-12 08:30:00', 6, 4, 5, 5, 3100.00, 8.80, 530.00, 'pendiente'),
(30, '2025-03-12 11:00:00', 2, 5, 6, 6, 550.00, 1.20, 85.00, 'pendiente'),
(31, '2025-03-13 07:30:00', 4, 1, 2, 1, 9500.00, 27.50, 1410.00, 'pendiente'),
(32, '2025-03-13 09:30:00', 8, 2, 3, 3, 1700.00, 5.60, 380.00, 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

DROP TABLE IF EXISTS `ruta`;
CREATE TABLE IF NOT EXISTS `ruta` (
  `id_ruta` int NOT NULL AUTO_INCREMENT,
  `origen` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `destino` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distancia_km` decimal(8,2) DEFAULT NULL,
  `tiempo_estimado_horas` decimal(5,2) DEFAULT NULL,
  `id_empresa` int DEFAULT NULL,
  `estado` enum('activa','inactiva') COLLATE utf8mb4_unicode_ci DEFAULT 'activa',
  PRIMARY KEY (`id_ruta`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`id_ruta`, `origen`, `destino`, `distancia_km`, `tiempo_estimado_horas`, `id_empresa`, `estado`) VALUES
(1, 'Quito', 'Guayaquil', 400.00, 8.00, 1, 'activa'),
(2, 'Guayaquil', 'Cuenca', 200.00, 4.00, 2, 'activa'),
(3, 'Quito', 'Guayaquil', 420.50, 6.50, 1, 'activa'),
(4, 'Guayaquil', 'Cuenca', 248.00, 4.00, 2, 'activa'),
(5, 'Quito', 'Cuenca', 472.00, 7.50, 1, 'activa'),
(6, 'Cuenca', 'Loja', 210.30, 3.50, 3, 'activa'),
(7, 'Quito', 'Ibarra', 115.00, 2.00, 6, 'activa'),
(8, 'Guayaquil', 'Manta', 188.00, 3.00, 2, 'activa'),
(9, 'Quito', 'Loja', 682.00, 10.00, 4, 'inactiva'),
(10, 'Ibarra', 'Quito', 115.00, 2.00, 6, 'activa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
CREATE TABLE IF NOT EXISTS `vehiculo` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` enum('camion','bus','furgoneta','pick_up') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacidad_kg` decimal(10,2) DEFAULT NULL,
  `capacidad_m3` decimal(10,2) DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `id_empresa` int DEFAULT NULL,
  `estado` enum('disponible','en_ruta','mantenimiento') COLLATE utf8mb4_unicode_ci DEFAULT 'disponible',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_vehiculo`),
  UNIQUE KEY `placa` (`placa`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `placa`, `modelo`, `tipo`, `capacidad_kg`, `capacidad_m3`, `anio`, `id_empresa`, `estado`, `fecha_registro`) VALUES
(1, 'AAA111', 'Hino 500', 'camion', 5000.00, 20.00, 2020, 1, 'disponible', '2026-04-28 18:11:24'),
(2, 'BBB222', 'Ford Transit', 'furgoneta', 2000.00, 10.00, 2021, 2, 'en_ruta', '2026-04-28 18:11:24'),
(3, 'PCA-1234', 'Hino 500 Series', 'camion', 15000.00, 42.00, 2020, 1, 'disponible', '2026-04-28 23:42:00'),
(4, 'GBZ-5678', 'Mercedes-Benz Actros', 'camion', 25000.00, 75.00, 2019, 1, 'en_ruta', '2026-04-28 23:42:00'),
(5, 'AZC-9101', 'Volkswagen Delivery', 'furgoneta', 3500.00, 12.00, 2021, 2, 'disponible', '2026-04-28 23:42:00'),
(6, 'GBW-1121', 'Ford Transit', 'furgoneta', 2800.00, 9.50, 2022, 2, 'disponible', '2026-04-28 23:42:00'),
(7, 'CAA-3141', 'Hino 300 Series', 'camion', 8000.00, 28.00, 2018, 3, 'mantenimiento', '2026-04-28 23:42:00'),
(8, 'PBX-5161', 'Toyota Hilux', 'pick_up', 1200.00, 2.80, 2023, 4, 'disponible', '2026-04-28 23:42:00'),
(9, 'GBT-7181', 'Chevrolet NHR', 'camion', 5500.00, 18.00, 2020, 5, 'disponible', '2026-04-28 23:42:00'),
(10, 'IBM-9201', 'Hyundai H350', 'furgoneta', 3200.00, 11.00, 2021, 6, 'en_ruta', '2026-04-28 23:42:00');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);

--
-- Filtros para la tabla `conductor`
--
ALTER TABLE `conductor`
  ADD CONSTRAINT `conductor_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_envio`) REFERENCES `envio` (`id_envio`),
  ADD CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`id_almacen_origen`) REFERENCES `almacen` (`id_almacen`),
  ADD CONSTRAINT `entrega_ibfk_3` FOREIGN KEY (`id_almacen_destino`) REFERENCES `almacen` (`id_almacen`);

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`id_ruta`) REFERENCES `ruta` (`id_ruta`),
  ADD CONSTRAINT `envio_ibfk_3` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`),
  ADD CONSTRAINT `envio_ibfk_4` FOREIGN KEY (`id_conductor`) REFERENCES `conductor` (`id_conductor`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `vehiculo_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
