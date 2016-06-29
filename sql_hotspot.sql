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
DROP TABLE IF EXISTS `contacts`;
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
DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `flag` varchar(255) NOT NULL,
  `page_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  CONSTRAINT `page_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.content: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` (`id`, `name`, `content`, `flag`, `page_id`, `created_at`, `updated_at`) VALUES
	(1, 'Banner', '', 'banner', 1, NULL, NULL),
	(2, 'Serviços', '', 'services', 1, NULL, NULL),
	(3, 'Vantagens', 'Vantagens Hotspot:', 'list', 1, NULL, NULL),
	(4, 'A Hotspot', '<p>A Hotspot foi desenvolvida para atuar no mercado de Coworking. Trabalha de forma inovadora, s&eacute;ria e comprometida. Sua localiza&ccedil;&atilde;o &eacute; privilegiada em Curitiba.</p><p>Possui agrad&aacute;vel ambiente de trabalho com salas equipadas, suporte t&eacute;cnico e uma equipe altamente qualificada.</p><p>&nbsp;</p><p>Daremos todo suporte que voc&ecirc; precisa para colocar em pr&aacute;tica seu projeto de trabalho e fazer com que seu sonho seja realidade. A Hotspot &eacute; formada por uma equipe de profissionais que ir&aacute; agregar valor aos servi&ccedil;os que iremos lhe oferecer. J&aacute; atuamos em diversos seguimentos, tais como, &aacute;rea jur&iacute;dica, tecnol&oacute;gica, cont&aacute;bil e comercial, que automaticamente sua empresa ser&aacute; inserida.</p><p>&nbsp;</p><p>Oferecemos um espa&ccedil;o de trabalho inovador, para profissionais inteligentes que tem interesse de reinventar sua forma de trabalho.</p><p>&nbsp;</p><p>O profissional que escolhe atuar em um ambiente de coworking, poder&aacute; focar sua energia e seu tempo no que &eacute; realmente importante para alavancar e potencializar sua atividade dentro do mercado, colocando diante de suas m&atilde;os a possibilidade de um retorno extraordin&aacute;rio.</p>', 'about', 2, NULL, '2016-06-29 17:19:12'),
	(5, 'Info Empresa', '', 'mvv', 2, NULL, NULL),
	(6, 'Como Funciona', '<p>Coworking &eacute; a uni&atilde;o de um grupo de profissionais inovadores e talentosos, que trabalham independente uma das outras, dividindo o mesmo espa&ccedil;o e mesmo endere&ccedil;o. S&atilde;o pessoas que compartilham seus valores e conhecimento, criam sinergia entre elas que aumenta a motiva&ccedil;&atilde;o e consequentemente seus resultados.</p><p>O coworking oferece mais que uma mesa de trabalho, nele voc&ecirc; encontra internet, telefone, sala de treinamento, sala de reuni&atilde;o totalmente equipada, impressora multifuncional, ampla copa, arm&aacute;rios, gavetas, banheiros. Tem tudo que voc&ecirc; precisa para desenvolver suas atividades.</p><p>Al&eacute;m disso, junto com coworking tem tamb&eacute;m a atividade de escrit&oacute;rio fiscal e comercial,<br /><strong>O QUE S&Atilde;O?</strong><br /><br />S&atilde;o duas atividades que utiliza o endere&ccedil;o do coworking para ser de sua empresa. Voc&ecirc; escolhe o local para receber correspond&ecirc;ncias, atender clientes e telefone. A diferen&ccedil;a &eacute; que o escrit&oacute;rio fiscal voc&ecirc; utilizar&aacute; o nosso endere&ccedil;o, como o endere&ccedil;o fiscal de sua empresa.</p>', 'cf', 3, NULL, '2016-06-29 17:55:23'),
	(11, 'Beneficios', 'Beneficios', 'beneficios', 2, NULL, '2016-06-29 17:29:15'),
	(12, 'Escritorio Virtual', '', 'ev', 3, NULL, NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.galleries
DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.galleries: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(36, 'Sala de Reunião', '2016-06-28 17:46:36', '2016-06-29 18:13:33'),
	(37, 'Sala de Treinamento', '2016-06-29 18:14:41', NULL),
	(38, 'Sala Privativa', '2016-06-29 18:15:03', NULL);
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.information
DROP TABLE IF EXISTS `information`;
CREATE TABLE IF NOT EXISTS `information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`),
  CONSTRAINT `content_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.information: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` (`id`, `title`, `content`, `icon`, `content_id`, `created_at`, `updated_at`) VALUES
	(1, 'Coworking', 'Agradável ambiente de trabalho com salas equipadas, suporte técnico e uma equipe altamente qualificada.', NULL, 1, '2016-06-29 11:12:52', NULL),
	(2, 'Hotspot', '<p>A Hotspot &eacute; mais que um espa&ccedil;o de trabalho compartilhado, a Hotspost &eacute; o caminho mais curto para o sucesso.</p>', NULL, 1, '2016-06-29 11:12:54', '2016-06-29 13:25:07'),
	(3, 'Cup coffee', 'Disponibilizamos excelente copa, equipada com geladeira, micro-ondas, mesa, tv e sofá, para que possa fazer sua pausa de trabalho, tomar seu café e fazer suas refeições.', NULL, 1, '2016-06-29 11:12:55', NULL),
	(4, 'Escritório Compartilhado', '<p>Modalidade em que o cliente contrata uma esta&ccedil;&atilde;o de trabalho e utiliza o coworking compartilhando com outros profissionais ambiente de trabalho. Dentro da mesma estrutura, profissionais de diversos ramos de atividade trabalham individualmente. Servi&ccedil;os de telefonia, recep&ccedil;&atilde;o, caf&eacute;, &aacute;gua, limpeza e manuten&ccedil;&atilde;o est&atilde;o inclu&iacute;dos na mensalidade. Outros podem ser solicitados sob demanda como motoboy e correios.</p><p><br />Vantagens:</p><ul><li>Servi&ccedil;os de telefonia</li><li>Internet</li><li>Recep&ccedil;&atilde;o</li><li>Caf&eacute;</li><li>&Aacute;gua.</li><li>Limpeza e manuten&ccedil;&atilde;o</li><li>Material para escrit&oacute;rio</li><li>Ambiente climatizado</li></ul>', 'leaf', 2, '2016-06-29 11:12:50', '2016-06-29 18:30:24'),
	(5, 'Sala para Reuniões', '<p>Estrutura completa para sua reuni&atilde;o.</p><p>As salas s&atilde;o alugadas por hora, per&iacute;odo, di&aacute;rio e mensal, possuem servi&ccedil;os de copa com caf&eacute; e &aacute;gua inclusos. Nossas salas s&atilde;o equipadas:</p><p>Vantagens:</p><ul><li>Suporte de v&iacute;deo;</li><li>&Aacute;udio confer&ecirc;ncia;</li><li>TV Flipchart para trabalhos did&aacute;ticos;</li><li>Telefone;</li><li>Internet;</li><li>Ambiente climatizado;</li><li>Recep&ccedil;&atilde;o;</li><li>Caf&eacute;;</li><li>&Aacute;gua;</li><li>Limpeza e manuten&ccedil;&atilde;o;</li></ul><p><strong>&nbsp;</strong></p><p>Coffe Break podem ser servidos conforme solicita&ccedil;&atilde;o do cliente, servi&ccedil;o terceirizado disponibilizado separadamente</p>', 'blackboard', 2, NULL, '2016-06-29 18:25:49'),
	(6, 'Escritório Fiscal', '<p>Endere&ccedil;o fiscal para atender seus clientes.</p><p>O Escrit&oacute;rio Virtual proporciona a sua empresa uma imagem coorporativa de prest&iacute;gio sempre nos endere&ccedil;os mais nobres da cidade.</p><p>Al&eacute;m de reduzir custos operacionais. Permite que a empresa se concentre em sua atividade principal:</p><ul><li>Recepcionista;</li><li>Atendimento ao cliente;</li><li>Um telefone fixo exclusivo que &eacute; atendido com o nome da empresa do cliente;</li><li>Endere&ccedil;o comercial;</li><li>Gerenciamento das correspond&ecirc;ncias;</li><li>Endere&ccedil;o fiscal;</li><li>Central de correspond&ecirc;ncia;</li></ul>', 'globe', 2, NULL, '2016-06-29 18:24:09'),
	(7, 'Sala Privativa', '<p>Sala reservada para equipe ou at&eacute; 3 pessoas.</p><p>Nossa sala Privativa possui ambiente mais reservado, para uma empresa ou compartilhada com at&eacute; 3 pessoas. Banheiro exclusivo- Sala rica em arm&aacute;rios e gaveteiros.</p><ul><li>Sala Reservada;</li><li>Banheiro;</li><li>Arm&aacute;rio Grande;</li><li>Ambiente climatizado;</li><li>Internet;</li><li>Mesa com cadeira;</li><li>Servi&ccedil;os de telefonia;</li><li>Recep&ccedil;&atilde;o;</li><li>Caf&eacute;;</li><li>&Aacute;gua;</li><li>Material para escrit&oacute;rio;</li></ul><p>Outros podem ser solicitados conforme necessidade, como motoboy e correios (servi&ccedil;os a parte).</p>', 'lock', 2, NULL, '2016-06-29 17:12:27'),
	(8, 'Escritório Comercial', '<p>Endere&ccedil;o comercial para atender seus clientes.</p><p>O endere&ccedil;o comercial ser&aacute; utilizado pelo contratante para ter um endere&ccedil;o em local nobre que receba suas correspond&ecirc;ncias, que poder&aacute; ser utilizado em seu material de marketing, em cart&otilde;es de visita, panfletos, site etc.. Incluindo os servi&ccedil;os:</p><ul><li>Recepcionista;</li><li>Atendimento telef&ocirc;nico;</li><li>Endere&ccedil;o comercial;</li><li>Gerenciamento das correspond&ecirc;ncias;</li><li>Envio de recado.</li></ul>', 'usd', 2, NULL, '2016-06-29 18:28:06'),
	(9, 'Sala de treinamento', '<p>Sala estruturada para realizar seu treinamento, palestra ou curso.</p><p>Formato audit&oacute;rio, possui capacidade para 15 pessoas. As salas s&atilde;o alugadas por per&iacute;odo e dia, possuem servi&ccedil;os de copa com caf&eacute; e &aacute;gua inclusos. Nossas salas s&atilde;o equipadas com:</p><ul><li>Suporte de v&iacute;deo e &aacute;udio confer&ecirc;ncia</li><li>TV;</li><li>Flipchart para trabalhos did&aacute;ticos,</li><li>Internet;</li><li>Ar condicionado.</li><li>Jardim de inverno para deixar o ambiente agrad&aacute;vel</li></ul><p>Coffe Break podem ser servidos conforme solicita&ccedil;&atilde;o do cliente, servi&ccedil;o (terceirizado) disponibilizado separadamente.</p>', 'cog', 2, NULL, '2016-06-29 17:13:32'),
	(12, 'Lista Vantagens 1', '<p>Escritorio em uma &aacute;rea nobre com baixo custo.</p>', 'edit', 3, NULL, '2016-06-29 17:10:56'),
	(13, 'Lista Vantagens 2 ', '<p>Mob&iacute;lia e estrutura completa.</p>', 'edit', 3, NULL, '2016-06-29 17:11:02'),
	(14, 'Lista Vantagens 3', '<p>Recep&ccedil;&atilde;o, cozinha, sala de reuni&otilde;es.</p>', 'edit', 3, NULL, '2016-06-29 17:08:48'),
	(15, 'Lista Vantagens 4', '<p>V&aacute;rias empresas ao seu lado.</p>', 'edit', 3, NULL, '2016-06-29 17:09:46'),
	(16, 'Lista Vantagens 5', '<p>Linhas telefonicas.</p>', 'edit', 3, NULL, '2016-06-29 17:10:11'),
	(17, 'Lista Vantagens 6 ', '<p>Conforto e privacidade.</p>', 'edit', 3, NULL, '2016-06-29 17:10:24'),
	(18, 'Missão', '<p>Oferecer, agrad&aacute;vel ambiente, excelente estrutura, maior custo benef&iacute;cio e suporte t&eacute;cnico necess&aacute;rio para o desenvolvimento do trabalho.</p>', '', 5, NULL, '2016-06-29 17:23:18'),
	(19, 'Visão', '<p>Ser uma conceituada e respeitada empresa de Coworking em &acirc;mbito Nacional e internacional.</p>', NULL, 5, NULL, '2016-06-29 17:26:57'),
	(20, 'Valores', '<p>Trabalhar com &eacute;tica, seriedade, produtividade, relacionamento, e apropriado investimento.</p>', NULL, 5, NULL, '2016-06-29 17:27:17'),
	(21, 'Lista Beneficios 1', '<p>Menor custo operacional.</p>', 'pushpin', 11, NULL, '2016-06-29 17:38:09'),
	(23, 'Lista Beneficios 2', '<p>Ambiente empresarial moderno.</p>', 'pushpin', 11, NULL, '2016-06-29 17:38:21'),
	(24, 'Lista Beneficios 3', '<p>Investimento inicial zero.</p>', 'pushpin', 11, NULL, '2016-06-29 17:38:31'),
	(25, 'Lista Beneficios 4', '<p>Agilidade nas atividades operacionais de um escrit&oacute;rio.</p>', 'pushpin', 11, NULL, '2016-06-29 17:38:41'),
	(26, 'Lista Beneficios 5', '<p>Foco na atividade fim do seu neg&oacute;cio.</p>', 'pushpin', 11, NULL, '2016-06-29 17:41:00'),
	(27, 'Lista Beneficios 6', '<p>Networking profissional.</p>', 'pushpin', 11, NULL, '2016-06-29 17:44:20'),
	(29, 'Lista Beneficios 7', '<p>Networking pessoal.</p>', 'pushpin', 11, NULL, '2016-06-29 17:44:42'),
	(30, 'Lista Beneficios 8', '<p>Grupo de empresas que poder&aacute; lhe auxiliar.</p>', 'pushpin', 11, NULL, '2016-06-29 17:44:58'),
	(31, 'Lista E.V 1', '<p>Profissionais que querem ampliar seu networking.</p>', 'asterisk', 12, NULL, '2016-06-29 18:06:27'),
	(35, 'Lista E.V 2', '<p>Sair de seu home office.</p>', 'asterisk', 12, NULL, '2016-06-29 18:10:01'),
	(36, 'Lista E.V 3', '<p>Diminuir as despesas com escrit&oacute;rios.</p>', 'asterisk', 12, NULL, '2016-06-29 18:10:10'),
	(37, 'Lista E.V 4', '<p>Startups</p>', 'asterisk', 12, NULL, '2016-06-29 18:10:21'),
	(41, 'Lista E.V 5', '<p>Expandir seus neg&oacute;cios.</p>', 'asterisk', 12, NULL, '2016-06-29 18:10:30'),
	(42, 'Lista E.V 6', '<p>Ter r&aacute;pido retorno financeiro.</p>', 'asterisk', 12, NULL, '2016-06-29 18:10:41'),
	(43, 'Lista E.V 7', '<p>Evitar erros comuns</p>', 'asterisk', 12, NULL, '2016-06-29 18:10:50');
/*!40000 ALTER TABLE `information` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cache` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela hotspot.pages: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `name`, `cache`, `created_at`, `updated_at`) VALUES
	(1, 'inicio', 'index', '2016-06-13 16:54:02', NULL),
	(2, 'hotspot_coworking', 'about', '2016-06-13 16:53:59', NULL),
	(3, 'como_funciona', 'works', '2016-06-13 16:54:01', NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.photos
DROP TABLE IF EXISTS `photos`;
CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gallery_id` int(11) NOT NULL,
  `src` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_id` (`gallery_id`),
  CONSTRAINT `gallery_id` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.photos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.users
DROP TABLE IF EXISTS `users`;
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
