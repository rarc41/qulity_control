DROP DATABASE IF EXISTS quality_control;

CREATE DATABASE quality_control;

CREATE TABLE `analysts` (
  `id_analyst` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_analyst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `samples` (
  `id_sample` int NOT NULL,
  `source` int NOT NULL COMMENT 'foreing_key',
  `analyst` int NOT NULL COMMENT 'foreing-key',
  `sampling_time` datetime DEFAULT NULL,
  `reception_time` datetime DEFAULT NULL,
  `sampling_temp` double DEFAULT NULL,
  `reception_temp` double DEFAULT NULL,
  PRIMARY KEY (`id_sample`),
  KEY `source_idx` (`source`),
  KEY `analyst_idx` (`analyst`),
  CONSTRAINT `analyst` FOREIGN KEY (`analyst`) REFERENCES `analysts` (`id_analyst`),
  CONSTRAINT `source` FOREIGN KEY (`source`) REFERENCES `sources` (`id_source`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sources` (
  `id_source` int NOT NULL,
  `point_sampling` varchar(100) NOT NULL,
  `vol` double NOT NULL,
  `lote` varchar(45) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `process` varchar(45) DEFAULT NULL,
  `product` varchar(45) NOT NULL,
  PRIMARY KEY (`id_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `analysis` (
  `id_analisis` int NOT NULL,
  `sample` int NOT NULL,
  `analyst` int NOT NULL,
  `temp` double NOT NULL,
  `color` enum('C','NC') NOT NULL,
  `smell` enum('C','NC') NOT NULL,
  `texture` enum('C','NC') NOT NULL,
  `flavor` enum('C','NC') NOT NULL,
  `ph` double NOT NULL,
  `acidity` double NOT NULL,
  `mass_dry` double DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `sng` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `density` double DEFAULT NULL,
  `crioscopy_1` double DEFAULT NULL,
  `crioscopy_2` double DEFAULT NULL,
  `alcalinos` varchar(45) DEFAULT NULL,
  `cloruro` varchar(45) DEFAULT NULL,
  `peroxydase` varchar(45) DEFAULT NULL,
  `estabilidad` varchar(45) DEFAULT NULL,
  `brix_1` double DEFAULT NULL,
  `brix_2` double DEFAULT NULL,
  `charm` enum('D','ND') DEFAULT NULL,
  `delvotest` enum('D','ND') DEFAULT NULL,
  `observation` text,
  PRIMARY KEY (`id_analisis`),
  KEY `sample_idx` (`sample`),
  KEY `analyst_idx` (`analyst`),
  CONSTRAINT `analyst_in_analysis` FOREIGN KEY (`analyst`) REFERENCES `analysts` (`id_analyst`),
  CONSTRAINT `sample` FOREIGN KEY (`sample`) REFERENCES `samples` (`id_sample`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
