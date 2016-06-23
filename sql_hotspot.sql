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
CREATE DATABASE IF NOT EXISTS `hotspot` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hotspot`;


-- Copiando estrutura para tabela hotspot.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `acting` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.contacts: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` (`id`, `name`, `phone`, `email`, `acting`) VALUES
	(4, 'Angelo Biscola', '41 363636363', 'angelo.biscola@codeandcode.com.br', NULL);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.content
CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `page_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.content: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` (`id`, `name`, `content`, `flag`, `page_id`, `created_at`, `updated_at`) VALUES
	(1, 'banner', '', 'banner', 1, '2016-06-13 16:44:14', '2016-06-15 18:52:13'),
	(2, 'a_hotspot', '<p>A Hotspot foi desenvolvida para atuar no mercado de Coworking. Trabalha de forma inovadora, s&eacute;ria e comprometida. Sua localiza&ccedil;&atilde;o &eacute; privilegiada em Curitiba.</p><p>Possui agrad&aacute;vel ambiente de trabalho com salas equip', 'sobre', 2, '2016-06-13 16:44:24', '2016-06-16 17:04:59'),
	(3, 'missao', '<p>Oferecer, agrad&aacute;vel ambiente, excelente estrutura, maior custo benef&iacute;cio e suporte t&eacute;cnico necess&aacute;rio para o desenvolvimento do trabalho.</p>', 'missao', 2, '2016-06-13 16:44:27', '2016-06-15 17:25:41'),
	(4, 'visao', '<p>Ser uma conceituada e respeitada empresa de Coworking em &acirc;mbito Nacional e internacional.</p>', 'visao', 2, '2016-06-13 16:44:28', '2016-06-15 17:25:53'),
	(5, 'valores', '<p>Trabalhar com &eacute;tica, seriedade, produtividade, relacionamento, e apropriado investimento.</p>', 'valores', 2, '2016-06-13 16:44:30', '2016-06-15 17:09:19'),
	(6, 'como_funciona', '<p>Modalidade em que o cliente contrata uma esta&ccedil;&atilde;o de trabalho e utiliza o coworking compartilhando com outros profissionais ambiente de trabalho. Dentro da mesma estrutura, profissionais de diversos ramos de atividade trabalham individualm', '', 3, '2016-06-13 16:44:31', '2016-06-15 17:11:56'),
	(7, 'servicos', '', 'servicos', 1, '2016-06-15 10:59:37', NULL),
	(9, 'vantagens', '', '', 1, NULL, NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.galeries
CREATE TABLE IF NOT EXISTS `galeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.galeries: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `galeries` DISABLE KEYS */;
INSERT INTO `galeries` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'sala_de_reuniao', '2016-06-13 16:56:51', NULL);
/*!40000 ALTER TABLE `galeries` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.information
CREATE TABLE IF NOT EXISTS `information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cateory_id` (`content_id`),
  CONSTRAINT `cateory_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.information: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` (`id`, `title`, `content`, `content_id`, `created_at`, `updated_at`) VALUES
	(3, 'Valores', 'Trabalhar com ética, seriedade, produtividade, relacionamento, e apropriado investimento.', 1, '2016-06-16 12:06:08', NULL),
	(6, 'Visão', 'Ser uma conceituada e respeitada empresa de Coworking em âmbito Nacional e internacional.', 1, '2016-06-17 11:31:31', NULL),
	(7, 'Missão', 'Oferecer, agradável ambiente, excelente estrutura, maior custo benefício e suporte técnico necessário para o desenvolvimento do trabalho.', 1, '2016-06-17 11:31:33', NULL),
	(12, 'Escritório Compartilhado', 'Espaço compartilhando com outros profissionais.', 7, '2016-06-17 11:31:34', NULL),
	(15, 'Sala para Reuniões', 'Estrutura completa para sua reunião.', 7, '2016-06-17 11:31:36', NULL);
/*!40000 ALTER TABLE `information` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `view` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela hotspot.pages: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `name`, `view`, `created_at`, `updated_at`) VALUES
	(1, 'inicio', 'index.phtml', '2016-06-13 16:54:02', NULL),
	(2, 'hotspot_coworking', '', '2016-06-13 16:53:59', NULL),
	(3, 'como_funciona', '', '2016-06-13 16:54:01', NULL),
	(4, 'imagens', '', '2016-06-13 16:54:02', NULL);
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
