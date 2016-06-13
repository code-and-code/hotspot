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
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela hotspot.categories: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `page_id`, `created_at`, `update_at`) VALUES
	(1, 'serviços', 1, NULL, NULL),
	(2, 'a_hotspot', 2, NULL, NULL),
	(3, 'missao', 2, NULL, NULL),
	(4, 'visao', 2, NULL, NULL),
	(5, 'valores', 2, NULL, NULL),
	(6, 'como_funciona', 3, NULL, NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.contents
CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela hotspot.contents: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `contents` DISABLE KEYS */;
INSERT INTO `contents` (`id`, `text`, `category_id`, `created_at`, `update_at`) VALUES
	(1, '0', 1, NULL, NULL),
	(2, '0', 2, NULL, NULL),
	(3, '0', 3, NULL, NULL),
	(4, '0', 4, NULL, NULL),
	(5, '0', 5, NULL, NULL),
	(6, '0', 6, NULL, NULL);
/*!40000 ALTER TABLE `contents` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.galeries
CREATE TABLE IF NOT EXISTS `galeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela hotspot.galeries: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `galeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `galeries` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela hotspot.pages: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `name`, `created_at`, `update_at`) VALUES
	(1, 'inicio', '0000-00-00 00:00:00', NULL),
	(2, 'hotspot_coworking', NULL, NULL),
	(3, 'como_funciona', NULL, NULL),
	(4, 'imagens', NULL, NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(6) NOT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `update-at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela hotspot.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `name`, `password`, `create_at`, `update-at`) VALUES
	(1, 'suporte@codeandcode.com.br', 'suporte', 'admin', NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
