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
CREATE DATABASE IF NOT EXISTS `hotspot_site` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hotspot_site`;


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


-- Copiando estrutura para tabela hotspot.galleries
DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.galleries: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(32, 'uma galeria', '2016-06-27 20:29:25', NULL);
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.photos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` (`id`, `title`, `description`, `created_at`, `updated_at`, `gallery_id`, `src`) VALUES
  (16, 'ola mundo', 'teste', '2016-06-27 20:33:00', '0000-00-00 00:00:00', 32, 'images/computer-962971.jpg'),
  (17, 'ola mundo', 'teste', '2016-06-27 20:33:58', '0000-00-00 00:00:00', 32, 'images/computer-962971.jpg'),
  (18, 'ola mundo', 'teste', '2016-06-27 20:34:45', '0000-00-00 00:00:00', 32, 'images/computer-962971.jpg'),
  (19, 'ola mundo', 'teste', '2016-06-27 20:35:46', '0000-00-00 00:00:00', 32, 'images/computer-962971.jpg');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;


-- Copiando estrutura para tabela hotspot.pages
DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cache` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela hotspot.pages: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `name`, `cache`, `created_at`, `updated_at`) VALUES
  (1, 'inicio', 'index', '2016-06-13 16:54:02', NULL),
  (2, 'hotspot_coworking', 'about', '2016-06-13 16:53:59', NULL),
  (3, 'como_funciona', 'works', '2016-06-13 16:54:01', NULL),
  (4, 'imagens', 'images', '2016-06-13 16:54:02', NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.content: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` (`id`, `name`, `content`, `flag`, `page_id`, `created_at`, `updated_at`) VALUES
  (1, 'Banner', '<p>asdasd</p>', 'banner', 1, '2016-06-13 16:44:14', '2016-06-24 15:14:17'),
  (2, 'A Hotpost', '<p>A <strong>Hotspot </strong>foi desenvolvida para atuar no mercado de Coworking. Trabalha de forma inovadora, s&eacute;ria e comprometida. Sua localiza&ccedil;&atilde;o &eacute; privilegiada em Curitiba.</p><p>Possui agrad&aacute;vel ambiente de trabalho com salas equipadas, suporte t&eacute;cnico e uma equipe altamente qualificada.</p><p>&nbsp;</p><p>Daremos todo suporte que voc&ecirc; precisa para colocar em pr&aacute;tica seu projeto de trabalho e fazer com que seu sonho seja realidade. A Hotspot &eacute; formada por uma equipe de profissionais que ir&aacute; agregar valor aos servi&ccedil;os que iremos lhe oferecer. J&aacute; atuamos em diversos seguimentos, tais como, &aacute;rea jur&iacute;dica, tecnol&oacute;gica, cont&aacute;bil e comercial, que automaticamente sua empresa ser&aacute; inserida.</p><p>&nbsp;</p><p>Oferecemos um espa&ccedil;o de trabalho inovador, para profissionais inteligentes que tem interesse de reinventar sua forma de trabalho.</p><p>&nbsp;</p><p>O profissional que escolhe atuar em um ambiente de coworking, poder&aacute; focar sua energia e seu tempo no que &eacute; realmente importante para alavancar e potencializar sua atividade dentro do mercado, colocando diante de suas m&atilde;os a possibilidade de um retorno extraordin&aacute;rio.</p>', 'about', 2, '2016-06-13 16:44:24', '2016-06-23 19:11:50'),
  (6, 'Como Funciona', '<p>\r\n						Coworking é a união de um grupo de profissionais inovadores e talentosos, que trabalham independente uma das outras, dividindo o mesmo espaço e mesmo endereço.\r\n						São pessoas que compartilham seus valores e conhecimento, criam sinergia entre elas que aumenta a motivação e consequentemente seus resultados.\r\n					</p>\r\n					<p>\r\n						O coworking oferece mais que uma mesa de trabalho, nele você encontra internet, telefone, sala de treinamento,\r\n						sala de reunião totalmente equipada, impressora multifuncional, ampla copa, armários, gavetas, banheiros.\r\n						Tem tudo que você precisa para desenvolver suas atividades.\r\n					</p>\r\n\r\n					<p>\r\n						Além disso, junto com coworking tem também a atividade de escritório fiscal e comercial,<br/> <strong>O QUE SÃO?</strong> <br/><br/>\r\n						São duas atividades que utiliza o endereço do coworking para ser de sua empresa.\r\n						Você escolhe o local para receber correspondências, atender clientes e telefone. A diferença é que o escritório fiscal você utilizará o nosso endereço, como o endereço fiscal de sua empresa.\r\n					</p>', 'cf', 3, '2016-06-13 16:44:31', '2016-06-15 17:11:56'),
  (7, 'Servicos', '', 'services', 1, '2016-06-15 10:59:37', NULL),
  (9, 'Vantagens', '', 'list', 1, NULL, NULL),
  (12, 'Hotspot Coworking', '<p>Beneficios</p>', 'beneficios', 2, NULL, '2016-06-24 15:06:32'),
  (14, 'Info Impresa', '', 'mvv', 2, NULL, NULL),
  (15, 'Todos', '', '', 4, NULL, NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;


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
  KEY `cateory_id` (`content_id`),
  CONSTRAINT `cateory_id` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela hotspot.information: ~33 rows (aproximadamente)
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` (`id`, `title`, `content`, `icon`, `content_id`, `created_at`, `updated_at`) VALUES
	(1, 'Missão', '<p>Lorem ipsum pretium torquent magna dui eleifend nisl, non euismod varius congue pretium pellentesque, porttitor primis convallis vel scelerisque sit.</p>', '', 14, '2016-06-17 11:31:33', '2016-06-23 19:14:51'),
	(2, 'Visão', 'Ser uma conceituada e respeitada empresa de Coworking em âmbito Nacional e internacional.', '', 14, '2016-06-17 11:31:31', NULL),
	(3, 'Valores', 'Trabalhar com ética, seriedade, produtividade, relacionamento, e apropriado investimento.', '', 14, '2016-06-16 12:06:08', NULL),
	(12, 'Hotspot Coworking', '<p>Espa&ccedil;o compartilhando com outros profissionais.</p><p>Modalidade em que o cliente contrata uma esta&ccedil;&atilde;o de trabalho e utiliza o coworking compartilhando com outros profissionais ambiente de trabalho. Dentro da mesma estrutura, profissionais de diversos ramos de atividade trabalham individualmente. Servi&ccedil;os de telefonia, recep&ccedil;&atilde;o, caf&eacute;, &aacute;gua, limpeza e manuten&ccedil;&atilde;o est&atilde;o inclu&iacute;dos na mensalidade. Outros podem ser solicitados sob demanda como motoboy e correios.</p><p>Vantagens:</p><ul><li>Servi&ccedil;os de telefonia</li><li>Internet</li><li>Recep&ccedil;&atilde;o</li><li>Caf&eacute;</li><li>&Aacute;gua.</li><li>Limpeza e manuten&ccedil;&atilde;o</li><li>Material para escrit&oacute;rio</li><li>Ambiente climatizado</li></ul>', 'envelope', 7, '2016-06-17 11:31:34', '2016-06-27 14:59:51'),
	(15, 'Sala para Reuniões', '<p>Estrutura completa para sua reuni&atilde;o.</p><p>As salas s&atilde;o alugadas por hora, per&iacute;odo, di&aacute;rio e mensal, possuem servi&ccedil;os de copa com caf&eacute; e &aacute;gua inclusos. Nossas salas s&atilde;o equipadas:</p><p>Vantagens:</p><ul><li>Suporte de v&iacute;deo;</li><li>&Aacute;udio confer&ecirc;ncia;</li><li>TV Flipchart para trabalhos did&aacute;ticos;</li><li>Telefone;</li><li>Internet;</li><li>Ambiente climatizado;</li><li>Recep&ccedil;&atilde;o;</li><li>Caf&eacute;;</li><li>&Aacute;gua;</li><li>Limpeza e manuten&ccedil;&atilde;o;</li></ul><p><strong>&nbsp;</strong></p><p>Coffe Break podem ser servidos conforme solicita&ccedil;&atilde;o do cliente, servi&ccedil;o terceirizado disponibilizado separadamente</p>', 'blackboard', 7, '2016-06-17 11:31:36', '2016-06-21 18:09:02'),
	(18, 'Escritório Fiscal', '<p>Endere&ccedil;o fiscal para atender seus clientes.</p><p>O Escrit&oacute;rio Virtual proporciona a sua empresa uma imagem coorporativa de prest&iacute;gio sempre nos endere&ccedil;os mais nobres da cidade.</p><p>Al&eacute;m de reduzir custos operacionais. Permite que a empresa se concentre em sua atividade principal:</p><ul><li>Recepcionista;</li><li>Atendimento ao cliente;</li><li>Um telefone fixo exclusivo que &eacute; atendido com o nome da empresa do cliente (personalizado);</li><li>Endere&ccedil;o comercial;</li><li>Gerenciamento das correspond&ecirc;ncias;</li><li>Endere&ccedil;o fiscal;</li><li>Central de correspond&ecirc;ncia;</li></ul>', 'globe', 7, '2016-06-17 11:54:51', '2016-06-21 18:17:07'),
	(20, 'Sala Privativa', '<p>Sala reservada para equipe ou at&eacute; 3 pessoas.</p><p>Nossa sala Privativa possui ambiente mais reservado, para uma empresa ou compartilhada com at&eacute; 3 pessoas. Banheiro exclusivo- Sala rica em arm&aacute;rios e gaveteiros.</p><ul><li>Sala Reservada;</li><li>Banheiro;</li><li>Arm&aacute;rio Grande;</li><li>Ambiente climatizado;</li><li>Internet;</li><li>Mesa com cadeira;</li><li>Servi&ccedil;os de telefonia;</li><li>Recep&ccedil;&atilde;o;</li><li>Caf&eacute;;</li><li>&Aacute;gua;</li><li>Material para escrit&oacute;rio;</li></ul><p>Outros podem ser solicitados conforme necessidade, como motoboy e correios (servi&ccedil;os a parte).</p>', 'lock', 7, '2016-06-17 11:55:27', '2016-06-21 18:11:23'),
	(22, 'Escritório Comercial', '<p>Endere&ccedil;o comercial para atender seus clientes.</p><p>O endere&ccedil;o comercial ser&aacute; utilizado pelo contratante para ter um endere&ccedil;o em local nobre que receba suas correspond&ecirc;ncias, que poder&aacute; ser utilizado em seu material de marketing, em cart&otilde;es de visita, panfletos, site etc.. Incluindo os servi&ccedil;os:</p><ul><li>Recepcionista;</li><li>Atendimento telef&ocirc;nico;</li><li>Endere&ccedil;o comercial;</li><li>Gerenciamento das correspond&ecirc;ncias;</li><li>Envio de recado.</li></ul>', 'usd', 7, '2016-06-17 11:57:35', '2016-06-21 18:18:48'),
	(23, 'Sala de treinamento', '<p>Sala estruturada para realizar seu treinamento, palestra ou curso.</p><p>Formato audit&oacute;rio, possui capacidade para 15 pessoas. As salas s&atilde;o alugadas por per&iacute;odo e dia, possuem servi&ccedil;os de copa com caf&eacute; e &aacute;gua inclusos. Nossas salas s&atilde;o equipadas com:</p><ul><li>Suporte de v&iacute;deo e &aacute;udio confer&ecirc;ncia</li><li>TV;</li><li>Flipchart para trabalhos did&aacute;ticos,</li><li>Internet;</li><li>Ar condicionado.</li><li>Jardim de inverno para deixar o ambiente agrad&aacute;vel</li></ul><p>Coffe Break podem ser servidos conforme solicita&ccedil;&atilde;o do cliente, servi&ccedil;o (terceirizado) disponibilizado separadamente.</p>', 'cog', 7, '2016-06-17 11:57:36', '2016-06-21 18:15:06'),
	(24, 'Lista Vantagens 1...', '<p>teste teste teste</p>', 'edit', 9, '2016-06-17 12:10:56', '2016-06-27 16:16:23'),
	(25, 'Lista Vantagens 2', '<p>asdfas</p>', 'edit', 9, '2016-06-17 12:10:57', '2016-06-24 16:14:07'),
	(27, 'Lista Vantagens 3', '<p>sdf</p>', 'edit', 9, NULL, '2016-06-24 16:14:12'),
	(29, 'Lista Vantagens 4', '<p>sfg</p>', 'edit', 9, NULL, '2016-06-24 16:14:17'),
	(31, 'Lista Vantagens 5', '<p>testew</p>', 'edit', 9, NULL, '2016-06-24 16:14:24'),
	(33, 'Lista Vantagens 6', '<p>asdfa</p>', 'edit', 9, NULL, '2016-06-24 16:14:29'),
	(34, 'Missão', '<p>Oferecer, agrad&aacute;vel ambiente, excelente estrutura, maior custo benef&iacute;cio e suporte t&eacute;cnico necess&aacute;rio para o desenvolvimento do trabalho.</p>', 'asterisk', 1, NULL, '2016-06-27 15:01:47'),
	(35, 'Visão', '<p>Ser uma conceituada e respeitada empresa de Coworking em &acirc;mbito Nacional e internacional.</p>', NULL, 1, NULL, '2016-06-23 19:07:44'),
	(36, 'Valores', '<p>Trabalhar com &eacute;tica, seriedade, produtividade, relacionamento, e apropriado investimento.</p>', NULL, 1, NULL, '2016-06-23 19:08:08'),
	(39, 'Lista Beneficios 1', '<p>Menor custo operacional. teste li</p>', 'pushpin', 12, NULL, '2016-06-27 16:17:46'),
	(41, 'Lista Beneficios 2', '<p>Ambiente empresarial moderno.</p>', 'pushpin', 12, NULL, '2016-06-27 16:19:04'),
	(43, 'Lista Beneficios 3', 'Investimento inicial zero.', 'pushpin', 12, NULL, NULL),
	(45, 'Lista Beneficios 4', 'Agilidade nas atividades operacionais de um escritório.', 'pushpin', 12, NULL, NULL),
	(47, 'Lista Beneficios 5', 'Foco na atividade fim do seu negócio.', 'pushpin', 12, NULL, NULL),
	(48, 'Lista Beneficios 6', 'Networking profissional.', 'pushpin', 12, NULL, NULL),
	(50, 'Lista Beneficios 7', 'Networking pessoal.', 'pushpin', 12, NULL, NULL),
	(52, 'Lista Beneficios 8', 'Grupo de empresas que poderá lhe auxiliar.', 'pushpin', 12, NULL, NULL),
	(58, 'Lista Busca 1', '<p>Profissionais que querem ampliar seu networking.</p>', 'asterisk', 6, NULL, '2016-06-27 16:21:36'),
	(59, 'Lista Busca 2', 'Sair de seu home office.', 'asterisk', 6, NULL, NULL),
	(60, 'Lista Busca 3', 'Diminuir as despesas com escritórios.', 'asterisk', 6, NULL, NULL),
	(62, 'Lista Busca 4', 'Startups.', 'asterisk', 6, NULL, NULL),
	(63, 'Lista Busca 5', 'Expandir seus negócios.', 'asterisk', 6, NULL, NULL),
	(64, 'Lista Busca 6', 'Ter rápido retorno financeiro.', 'asterisk', 6, NULL, NULL),
	(65, 'Lista Busca 7', 'Evitar erros comuns.', 'asterisk', 6, NULL, NULL);
/*!40000 ALTER TABLE `information` ENABLE KEYS */;



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
