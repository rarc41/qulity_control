DROP DATABASE IF EXISTS quality_control; -- CUIDADO!! esta lines verifica si existe un base de datos creada con  el nombre qualiyty_control, si exista la borrara

CREATE DATABASE quality_control;

CREATE TABLE `analysts` (
  `id_analyst` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_analyst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
