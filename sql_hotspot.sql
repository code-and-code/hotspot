-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.13-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para hotspot
CREATE DATABASE IF NOT EXISTS `hotspot` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hotspot`;


-- Copiando estrutura para tabela hotspot.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `page_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.categories: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `page_id`, `created_at`, `updated_at`) VALUES
	(1, 'serviços', 1, '2016-06-13 16:44:14', '0000-00-00 00:00:00'),
	(2, 'a_hotspot', 2, '2016-06-13 16:44:24', NULL),
	(3, 'missao', 2, '2016-06-13 16:44:27', NULL),
	(4, 'visao', 2, '2016-06-13 16:44:28', NULL),
	(5, 'valores', 2, '2016-06-13 16:44:30', NULL),
	(6, 'como_funciona', 3, '2016-06-13 16:44:31', NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.contents
CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.contents: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` (`id`, `text`, `category_id`, `created_at`, `updated_at`) VALUES
	(1, '', 1, '2016-06-13 16:45:29', NULL),
	(2, '', 2, '2016-06-13 16:45:30', NULL),
	(3, '', 3, '2016-06-13 16:45:31', NULL),
	(4, '', 4, '2016-06-13 16:45:32', NULL),
	(5, '', 5, '2016-06-13 16:45:33', NULL),
	(6, '', 6, '2016-06-13 16:45:34', NULL);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.galeries
CREATE TABLE IF NOT EXISTS `galeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.galeries: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `galeries` DISABLE KEYS */;
INSERT INTO `galeries` (`id`, `name`, `created_at`, `update_at`) VALUES
	(1, 'sala_de_reuniao', '2016-06-13 16:56:51', NULL);
/*!40000 ALTER TABLE `galeries` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.pages: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'inicio', '2016-06-13 16:54:02', NULL),
	(2, 'hotspot_coworking', '2016-06-13 16:53:59', NULL),
	(3, 'como_funciona', '2016-06-13 16:54:01', NULL),
	(4, 'imagens', '2016-06-13 16:54:02', NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `name`, `password`, `created_at`, `updated_at`) VALUES
	(1, 'suporte@codeandcode.com.br', 'suporte', 'admin', '2016-06-13 16:56:59', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
