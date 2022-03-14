-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: sgrv1
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ceos`
--

DROP TABLE IF EXISTS `ceos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ceos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `company_headquarters` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `what_company_does` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ceos`
--

LOCK TABLES `ceos` WRITE;
/*!40000 ALTER TABLE `ceos` DISABLE KEYS */;
INSERT INTO `ceos` VALUES (1,'asdfasdfasdfasdfads','Gestão de ALguma cois1a',2020,'Livro sobre orientação a objetoss','eeee de Saude',1,'2022-02-08 14:52:16','2022-02-08 14:52:16');
/*!40000 ALTER TABLE `ceos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `no_cliente` varchar(225) DEFAULT NULL,
  `co_tipo_cliente` int(11) DEFAULT NULL,
  `nu_cpf` varchar(11) DEFAULT NULL,
  `de_email` varchar(150) NOT NULL,
  `nu_cnpj` varchar(45) DEFAULT NULL,
  `st_pessoa_juridica` tinyint(1) DEFAULT NULL,
  `tipo_cliente_id` int(11) DEFAULT NULL,
  `nu_celular` varchar(45) DEFAULT NULL,
  `nu_tel_residencial` int(11) DEFAULT NULL,
  `nu_tel_comercial` varchar(45) DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `nu_cep` int(11) DEFAULT NULL,
  `no_cidade` varchar(200) DEFAULT NULL,
  `de_endereco` varchar(45) DEFAULT NULL,
  `de_complemento` varchar(200) DEFAULT NULL,
  `nu_endereco` varchar(45) DEFAULT NULL,
  `estado_id` int(11) NOT NULL,
  `cadastro_dt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_cliente_tipo_cliente_idx` (`tipo_cliente_id`),
  KEY `fk_cliente_estado1_idx` (`estado_id`),
  CONSTRAINT `fk_cliente_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_tipo_cliente` FOREIGN KEY (`tipo_cliente_id`) REFERENCES `tipo_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conselho_regional`
--

DROP TABLE IF EXISTS `conselho_regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conselho_regional` (
  `id` int(11) NOT NULL,
  `de_conselho_regional` varchar(45) DEFAULT NULL,
  `nu_ddd` int(11) DEFAULT NULL,
  `nu_telefone` int(11) DEFAULT NULL,
  `no_representante` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conselho_regional`
--

LOCK TABLES `conselho_regional` WRITE;
/*!40000 ALTER TABLE `conselho_regional` DISABLE KEYS */;
/*!40000 ALTER TABLE `conselho_regional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conselho_regional_estado`
--

DROP TABLE IF EXISTS `conselho_regional_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conselho_regional_estado` (
  `conselho_regional_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`conselho_regional_id`,`estado_id`),
  KEY `fk_estado_has_conselho_regional_conselho_regional1_idx` (`conselho_regional_id`),
  KEY `fk_estado_has_conselho_regional_estado1_idx` (`estado_id`),
  CONSTRAINT `fk_estado_has_conselho_regional_conselho_regional1` FOREIGN KEY (`conselho_regional_id`) REFERENCES `conselho_regional` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_has_conselho_regional_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conselho_regional_estado`
--

LOCK TABLES `conselho_regional_estado` WRITE;
/*!40000 ALTER TABLE `conselho_regional_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `conselho_regional_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) NOT NULL,
  `situacao_id` int(10) unsigned NOT NULL,
  `st_com_exclusividade` tinyint(2) DEFAULT 0,
  `users_id` int(11) NOT NULL,
  `tipo_contrato_id` int(11) NOT NULL,
  `cadastro_dt` datetime NOT NULL DEFAULT current_timestamp(),
  `imovel_id` int(11) NOT NULL,
  `imobiliaria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contrato_cliente1_idx` (`cliente_id`),
  KEY `fk_contrato_situacao1_idx` (`situacao_id`),
  KEY `fk_contrato_users1_idx` (`users_id`),
  KEY `fk_contrato_tipo_contrato1_idx` (`tipo_contrato_id`),
  KEY `fk_contrato_imovel1_idx` (`imovel_id`),
  KEY `fk_imobiliaria_contrato` (`imobiliaria_id`),
  CONSTRAINT `fk_contrato_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_imovel1` FOREIGN KEY (`imovel_id`) REFERENCES `imovel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_situacao1` FOREIGN KEY (`situacao_id`) REFERENCES `situacao_contrato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_tipo_contrato1` FOREIGN KEY (`tipo_contrato_id`) REFERENCES `tipo_contrato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_imobiliaria_contrato` FOREIGN KEY (`imobiliaria_id`) REFERENCES `imobiliaria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `de_estado` varchar(50) NOT NULL,
  `co_estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Acre','AC'),(2,'Alagoas','AL'),(3,'Amazonas','AM'),(4,'Amapá','AP'),(5,'Bahia','BA'),(6,'Ceará','CE'),(7,'Distrito Federal','DF'),(8,'Espírito Santo','ES'),(9,'Goiás','GO'),(10,'Maranhão','MA'),(11,'Minas Gerais','MG'),(12,'Mato Grosso do Sul','MS'),(13,'Mato Grosso','MT'),(14,'Pará','PA'),(15,'Paraíba','PB'),(16,'Pernambuco','PE'),(17,'Piauí','PI'),(18,'Paraná','PR'),(19,'Rio de Janeiro','RJ'),(20,'Rio Grande do Norte','RN'),(21,'Rondônia','RO'),(22,'Roraima','RR'),(23,'Rio Grande do Sul','RS'),(24,'Santa Catarina','SC'),(25,'Sergipe','SE'),(26,'São Paulo','SP'),(27,'Tocantins','TO');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_contrato`
--

DROP TABLE IF EXISTS `historico_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_contrato` (
  `id` int(11) NOT NULL,
  `id_pai` int(11) DEFAULT NULL,
  `contrato_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `situacao_id` int(10) unsigned NOT NULL,
  `escritorio_id` int(11) NOT NULL,
  `st_com_exclusividade` tinyint(2) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `tipo_contrato_id` int(11) NOT NULL,
  `dt_cadastro` datetime NOT NULL,
  `imovel_id` int(11) NOT NULL,
  `registro_dt` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_historico_contrato_contrato1_idx` (`contrato_id`),
  KEY `fk_hisotirco_contratao_pai_idx` (`id_pai`),
  CONSTRAINT `fk_hisotirco_contratao_pai` FOREIGN KEY (`id_pai`) REFERENCES `historico_contrato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_historico_contrato_contrato1` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_contrato`
--

LOCK TABLES `historico_contrato` WRITE;
/*!40000 ALTER TABLE `historico_contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imobiliaria`
--

DROP TABLE IF EXISTS `imobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imobiliaria` (
  `id` int(11) NOT NULL,
  `no_imobiliaria` varchar(150) NOT NULL,
  `nu_cnpj` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_imobiliaria_estado1_idx` (`estado_id`),
  CONSTRAINT `fk_imobiliaria_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imobiliaria`
--

LOCK TABLES `imobiliaria` WRITE;
/*!40000 ALTER TABLE `imobiliaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `imobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imovel`
--

DROP TABLE IF EXISTS `imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imovel` (
  `id` int(11) NOT NULL,
  `nu_cep` int(11) DEFAULT NULL,
  `no_cidade` varchar(200) DEFAULT NULL,
  `de_endereco` varchar(150) DEFAULT NULL,
  `de_complemento` varchar(200) DEFAULT NULL,
  `nu_endereco` int(11) DEFAULT NULL,
  `co_tipo_imovel` varchar(5) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `nu_matricula` varchar(100) DEFAULT NULL,
  `cadastro_dt` varchar(45) DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`),
  KEY `fk_imovel_estado1_idx` (`estado_id`),
  CONSTRAINT `fk_imovel_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imovel`
--

LOCK TABLES `imovel` WRITE;
/*!40000 ALTER TABLE `imovel` DISABLE KEYS */;
/*!40000 ALTER TABLE `imovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_12_14_000001_create_personal_access_tokens_table',1),(9,'2021_08_23_135450_create_c_e_o_s_table',1),(10,'2021_10_30_161747_rota',1),(11,'2021_10_30_161852_perfil',1),(12,'2021_10_30_161932_profile_role',1),(13,'2022_02_01_015825_usuario',1),(14,'2022_02_01_181820_cliente',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_modulo` varchar(100) NOT NULL,
  `no_icone` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Administrativo','settings'),(2,'Contrato','assignment'),(3,'Cliente','person_outline'),(4,'Dashboard','dashboard'),(5,'Usuário','manage_accounts');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('054397d4b3b1d4f2dfca5c726b33e6fbbc414066cddca5e95ff503cd702c61b6ec0294fa82b525ce',1,1,'authToken','[]',0,'2022-02-10 12:24:48','2022-02-10 12:24:48','2023-02-10 09:24:48'),('07e8ce36a514f9321fe156498902f7ecb01bea7a94934e29736f81e1fe894f32cd683bdd1a4449f7',1,1,'authToken','[]',0,'2022-02-10 11:52:38','2022-02-10 11:52:38','2023-02-10 08:52:38'),('0938eb894edbd860a25a0c40172a9cf1ff419c363059699cb4734f985c09944ed887515607a9bca2',1,1,'authToken','[]',0,'2022-02-08 17:06:51','2022-02-08 17:06:51','2023-02-08 14:06:51'),('0de7a4b88c363513ef7eede32c9f4fbbf28ec18f30075c85e7bd87da88d929afd58dcf467ba48aa8',1,1,'authToken','[]',0,'2022-02-10 11:12:25','2022-02-10 11:12:25','2023-02-10 08:12:25'),('15e445044ef3579930a9f2863e368c3f748ea93868f970f08e117d3c5b54e75c4956c8a8a094050b',1,1,'authToken','[]',0,'2022-02-10 14:34:27','2022-02-10 14:34:27','2023-02-10 11:34:27'),('16bd97e920559226ff0696095ae374df0b2df831344a05a441d893232d074a3db4783b7cba66a103',1,1,'authToken','[]',0,'2022-02-13 19:03:26','2022-02-13 19:03:26','2023-02-13 16:03:26'),('18bfef4dd241173292860e9d18c436003d96ddb2d448d0380ad13caf3708d789a8ce065745761e8a',1,1,'authToken','[]',0,'2022-02-16 14:43:31','2022-02-16 14:43:31','2023-02-16 11:43:31'),('204376ad0bbf604865401b53fc0dde98f90072cd322b3d4d1f3195ad47bde4701a561ff2b7c27f77',1,1,'authToken','[]',0,'2022-02-14 20:04:22','2022-02-14 20:04:22','2023-02-14 17:04:22'),('21f9fb43723f41f24e372a159e08d0dfe7b0b5ef1175f949e4c209b36842540d56ff79d966b336db',1,1,'authToken','[]',0,'2022-02-10 14:20:22','2022-02-10 14:20:22','2023-02-10 11:20:22'),('286d9f7b3d6d548d2f8542f84ea1357264fe4fc9589ed97a8230c2822e6885e001d4aaf5f1b81f03',1,1,'authToken','[]',0,'2022-02-12 02:52:19','2022-02-12 02:52:19','2023-02-11 23:52:19'),('28919ae1f0aa366412b5fbfde8bd592a53be12092bdbee827efe29932ec024a5ad9c5cc8a10a750a',1,1,'authToken','[]',0,'2022-02-10 12:15:18','2022-02-10 12:15:18','2023-02-10 09:15:18'),('29b5ba759449dfbae8f1d2a9931dc7c038ec201f5c85442d06173a0d66503381eb5431e08a46e333',1,1,'authToken','[]',0,'2022-02-10 12:15:44','2022-02-10 12:15:44','2023-02-10 09:15:44'),('2f92feb2a9e606cc8c77ebd41dc7c9cb01fa110649fe0a86437bab06dcec1b0bea6d6501dd96788b',1,1,'authToken','[]',0,'2022-02-10 12:05:58','2022-02-10 12:05:58','2023-02-10 09:05:58'),('3167ef2ddcffa90d4a688195da6872f685c9f5dc6323cef8448220109b52dceb350219599c97de6a',1,1,'authToken','[]',0,'2022-02-10 12:30:50','2022-02-10 12:30:50','2023-02-10 09:30:50'),('359b8a2e0b53c998f898f3e1a412f134ead34ea59ec90cb052767d4b9525908995073baa170a353a',1,1,'authToken','[]',0,'2022-02-10 14:13:55','2022-02-10 14:13:55','2023-02-10 11:13:55'),('3915263fee8c8b6fe846e13610a70538b36d8be0395541b6fc9811d471cff378bea6f6ed2a8504fa',1,1,'authToken','[]',0,'2022-02-11 02:16:59','2022-02-11 02:16:59','2023-02-10 23:16:59'),('399b13e23051103f910a94a66a9589b61d0b1c22bccfaeda0bf638b46a5d3c2dddc25f528978dc8c',1,1,'authToken','[]',0,'2022-02-08 14:50:43','2022-02-08 14:50:43','2023-02-08 11:50:43'),('3c75564b8c43b479c15cc6eca97322b1a19415dbfe735e047b388a48a12ef1f8242c09ee8520fe0c',1,1,'authToken','[]',0,'2022-02-10 14:30:42','2022-02-10 14:30:42','2023-02-10 11:30:42'),('3ea6a45aa46669faf07ebc0f87b3d6e4ce33c7dc90247edd92b92bb3d9b0ada97cfdc163e7f8404a',1,1,'authToken','[]',0,'2022-02-10 14:08:23','2022-02-10 14:08:23','2023-02-10 11:08:23'),('42c3053a7d2aa653da19a7034edac1c09bdcc46f2eab7dd2b5c690104ef4f720429a69286ba4fb76',1,1,'authToken','[]',0,'2022-02-13 19:11:36','2022-02-13 19:11:36','2023-02-13 16:11:36'),('43efbaf52f0558df7f7c9184e61eacfe4173e010d2b65edb55b6a1658b7094876783d422331f9c09',1,1,'authToken','[]',0,'2022-02-11 11:01:49','2022-02-11 11:01:49','2023-02-11 08:01:49'),('45fabcf507be7bfe0f1ac5e6276c2da692678ecb684f18c598dd47a87fbc84181637313677531a4b',1,1,'authToken','[]',0,'2022-02-10 11:17:37','2022-02-10 11:17:37','2023-02-10 08:17:37'),('47f1682f54eb8fca24cc21bb2962c43db12995fe9acacc565066e547d1052c17d31526230c32bfc6',1,1,'authToken','[]',0,'2022-02-10 13:36:56','2022-02-10 13:36:56','2023-02-10 10:36:56'),('4a904d73d4e7595dd1faf54fd2c3b707a050ef60f9e40ee4e6b9fc0cdfb498b7de04e47d6df6e890',1,1,'authToken','[]',0,'2022-02-10 03:42:02','2022-02-10 03:42:02','2023-02-10 00:42:02'),('4bd4a578f59464a2268306f01c22a74b2997e556cbabe946d321e579b92cdfcd4998dd0982bae88c',1,1,'authToken','[]',0,'2022-02-10 12:36:48','2022-02-10 12:36:48','2023-02-10 09:36:48'),('4c11573e090b8f950162ff39fdc4f5cfa36a9d0482fa89997d112353901bc02e7bc121d5475cfd2c',1,1,'authToken','[]',0,'2022-02-10 13:37:19','2022-02-10 13:37:19','2023-02-10 10:37:19'),('4c2d61286e6abaa3a0c66a52166a78242faf9714d493e2189c0f6bbbfc630e6407ba476d2f2c72a6',1,1,'authToken','[]',0,'2022-02-08 15:46:10','2022-02-08 15:46:10','2023-02-08 12:46:10'),('4cd8432b70ce75dea32dd4c497750ddf0fa19cb2d61b4bc9e5863bcff0b5175fa396b9aa3542a62b',1,1,'authToken','[]',0,'2022-02-10 12:38:38','2022-02-10 12:38:38','2023-02-10 09:38:38'),('4e175bdf60b5a667caebd64f99b8947c125caeece80831527547c404d2ef4844bc841341e935e4f1',1,1,'authToken','[]',0,'2022-02-11 02:44:27','2022-02-11 02:44:27','2023-02-10 23:44:27'),('4fb3ea6dc625e622da7e0a83f27923fc4a03cc0f6ede5fdf9721bf7acf0e92a2be1a1a39d5437e98',1,1,'authToken','[]',0,'2022-02-10 11:57:24','2022-02-10 11:57:24','2023-02-10 08:57:24'),('57482302574ede009d096302de458e382412e84d803a113675e272d4ff0c0b4bb7069dc844206951',1,1,'authToken','[]',0,'2022-02-12 00:42:55','2022-02-12 00:42:55','2023-02-11 21:42:55'),('5b7282ff2864026c488f432e88a6c5cb0dc2aa6ac6c460021688e7b0bdda5a02245e59d3b4ce076a',1,1,'authToken','[]',0,'2022-02-10 13:31:57','2022-02-10 13:31:57','2023-02-10 10:31:57'),('5c206bf98e5edbca893963e1fa04ad2a3afbbea9b0b67d26e5d822355d0c64ee2ee4e177ded8d3b7',1,1,'authToken','[]',0,'2022-02-13 18:58:42','2022-02-13 18:58:42','2023-02-13 15:58:42'),('5c385cc1a6bf3f7d544a491c3808a3175821cb791497b90dffa7be84d8421178199df65998e4900d',1,1,'authToken','[]',0,'2022-02-10 14:29:49','2022-02-10 14:29:49','2023-02-10 11:29:49'),('5c860dc725d6a640a19223f9694243a14689fc9078d51822db604113fb07d62e1f847079dee6b24e',1,1,'authToken','[]',0,'2022-02-10 14:21:17','2022-02-10 14:21:17','2023-02-10 11:21:17'),('5cfc5706054df00093b7c4536960d83ee25e5001cc00b10d027d5f4cc94c666abadf25e27b1bc738',1,1,'authToken','[]',0,'2022-02-08 17:26:01','2022-02-08 17:26:01','2023-02-08 14:26:01'),('5d0d5c997e6caaf302eb6360b3872200c34a4c359dcd538912923a96342185ca456221683039d2e3',1,1,'authToken','[]',0,'2022-02-10 12:25:01','2022-02-10 12:25:01','2023-02-10 09:25:01'),('5edc381f4209a5c878a2ef58159dde9532db3316da1ce015964b27a1ab5d2954065a7eb3c6b5af6b',1,1,'authToken','[]',0,'2022-02-10 13:34:21','2022-02-10 13:34:21','2023-02-10 10:34:21'),('66337aade2618cc91f79d5c2f17e504e80c617f5f3b1b951d5bfc7f6a4c4b1ccd1938cd100891ea0',1,1,'authToken','[]',0,'2022-02-10 15:56:57','2022-02-10 15:56:57','2023-02-10 12:56:57'),('6674f2f583257a7b1350cb4ecee6dc70e9a14a34066b655a88181589bb9117120a76af02693c9f34',1,1,'authToken','[]',0,'2022-02-11 02:09:26','2022-02-11 02:09:26','2023-02-10 23:09:26'),('66d5fc44b2d2f49dc52c2f281239ce2e62359b0c640534611e3db683bb0fc94806004363a37d9831',1,1,'authToken','[]',0,'2022-02-11 01:53:36','2022-02-11 01:53:36','2023-02-10 22:53:36'),('6c457d0dfdc6068dceccac245eefd250b08a613d030f2671621d56687466a06623c9666e82bb72f3',1,1,'authToken','[]',0,'2022-02-10 13:47:12','2022-02-10 13:47:12','2023-02-10 10:47:12'),('6cbec307c076baf5535d4a3189979b70537715be180f36f365cbcb1407c6ce22174244ffdc65dfbf',1,1,'authToken','[]',0,'2022-02-10 11:52:50','2022-02-10 11:52:50','2023-02-10 08:52:50'),('6d657cf8cd94147d1ac9f872ffe6ce1964fbda858a89c9111f13a79db10ac1794ff53b3c77de3b14',1,1,'authToken','[]',0,'2022-02-16 14:50:27','2022-02-16 14:50:27','2023-02-16 11:50:27'),('6e2b103ac534f2f3949a344d2c985748f8243ffa7c0bb8942d02ba3321b2fb903784f2a627603878',1,1,'authToken','[]',0,'2022-02-10 14:13:34','2022-02-10 14:13:34','2023-02-10 11:13:34'),('700fb00f871b493c27706e1aaf7b6fe7b840a20ed93f2519c1b71b283c35b59a8ff0db004d9b310b',1,1,'authToken','[]',0,'2022-02-09 10:03:27','2022-02-09 10:03:27','2023-02-09 07:03:27'),('70ac9c3b5a06d4c13f8baeea096e934d8f7b519cbffa48f237d7ed9d903fcbfbcb3beeae039c0313',1,1,'authToken','[]',0,'2022-02-15 00:54:39','2022-02-15 00:54:39','2023-02-14 21:54:39'),('71315d9cfcba9800ac5d92ed584627336c96286f485e437d7f88b07e8ee844d8e98f3be5b5dbcf34',1,1,'authToken','[]',0,'2022-02-22 13:20:35','2022-02-22 13:20:35','2023-02-22 10:20:35'),('791269974de5c9d0a958f5815b4a059e98f4c0fcdbe8fe947a7fe9c7f7a1966d5c8f5f75c4a0fbca',1,1,'authToken','[]',0,'2022-02-10 12:11:28','2022-02-10 12:11:28','2023-02-10 09:11:28'),('7ff10ee533a96c88bd63c714ecc19bfe2a8425653bc364d86593712a0f1e9ef531659a8cd43f0ec7',1,1,'authToken','[]',0,'2022-02-14 12:06:00','2022-02-14 12:06:00','2023-02-14 09:06:00'),('810fe0dd509eeed5e17552b2b7cfa52f29637fb6efde60c9244eba8d7c79d6318a29a67339e8efb0',1,1,'authToken','[]',0,'2022-02-10 12:09:31','2022-02-10 12:09:31','2023-02-10 09:09:31'),('824a3aa452d8eb37192e84ef0ebaf33064c170f119dac3656f96820bad802f8eb153dfe586d4fea4',1,1,'authToken','[]',0,'2022-02-10 14:36:14','2022-02-10 14:36:14','2023-02-10 11:36:14'),('84292a6e0570a095b0a1142fdbc1f2fc79e15769b5818525c7ed4eb44ce07716a154774f21cfa9a5',1,1,'authToken','[]',0,'2022-02-10 14:20:15','2022-02-10 14:20:15','2023-02-10 11:20:15'),('84a49c2efab4f51c3fca2e3621b734a16abbb387bb2a6bcaaae6b6dbcd36f6647b5183d43fd35db2',1,1,'authToken','[]',0,'2022-02-22 17:28:09','2022-02-22 17:28:09','2023-02-22 14:28:09'),('89c3f079c579e57c4dbbc450e826d91bf0d796b89029f2534112cb3b36c3eb6cf11d719ae6bd99b9',1,1,'authToken','[]',0,'2022-02-11 02:16:45','2022-02-11 02:16:45','2023-02-10 23:16:45'),('8cc60819386d7f47b0278fb12838f9d45c8dabeca22af9faea09cf547d331ec8953641a91e0d9613',1,1,'authToken','[]',0,'2022-02-11 02:17:15','2022-02-11 02:17:15','2023-02-10 23:17:15'),('8e2e7f3bdeb63eaddc8f14279eb980640e820f0de65df6d44d24154c3d3585279951a858f3a6c397',1,1,'authToken','[]',0,'2022-02-13 19:00:33','2022-02-13 19:00:33','2023-02-13 16:00:33'),('9bad319cc1824b7659c80e96e5f692c618ee775fbe4fea34b84126a614c60c41922794cb8c6a87e9',1,1,'authToken','[]',0,'2022-02-10 14:11:12','2022-02-10 14:11:12','2023-02-10 11:11:12'),('9e4b1083d92a54996ca8b8da275808926991e549896e9a2977ef236294fde9fec0128ff15e489652',1,1,'authToken','[]',0,'2022-02-10 14:30:11','2022-02-10 14:30:11','2023-02-10 11:30:11'),('9e68dc9587cbd398bca225c27070e292eb8f9aceba8255ec268ae89fa4389ad2ec17edfbdcc73975',1,1,'authToken','[]',0,'2022-02-13 19:02:44','2022-02-13 19:02:44','2023-02-13 16:02:44'),('a3853dfc57fb5dcd0d501150ff70b5d06ddb3fc5af35bb802764943964cfc3cee0d5452395994765',1,1,'authToken','[]',0,'2022-02-11 02:20:37','2022-02-11 02:20:37','2023-02-10 23:20:37'),('a4b58225c9bd3eedded890d8cab2f2c8db9409c6da5222fc3b81e9ef2749f79343ca65dd29d67f25',1,1,'authToken','[]',0,'2022-02-16 14:46:16','2022-02-16 14:46:16','2023-02-16 11:46:16'),('a4c92403437a2966a7a09696534971261b8c0125113dcab100691c31b72f0709465a9164b3119cb9',1,1,'authToken','[]',0,'2022-02-10 13:48:41','2022-02-10 13:48:41','2023-02-10 10:48:41'),('a6ae71babdaf0f05213982c3b736e16371e563ebf58229b90a46992b90265a8af2fb5df5f299aa4f',1,1,'authToken','[]',0,'2022-02-16 14:44:21','2022-02-16 14:44:21','2023-02-16 11:44:21'),('a86d5e9a4fb966cc3223d0e5b9ec18833dea371cd2ecbfaba498e78c55c132a4121668e85c805f8b',1,1,'authToken','[]',0,'2022-02-10 13:16:40','2022-02-10 13:16:40','2023-02-10 10:16:40'),('aa4405ff03ee717d93b80cbb793ae0f13de8c3fb4b83c2a8efd5652140f471eaf8447a4bec69c54c',1,1,'authToken','[]',0,'2022-02-11 02:11:36','2022-02-11 02:11:36','2023-02-10 23:11:36'),('ac2e9b67d24228e6319c077c7a557198a5557b95d0217ded62a4e1812fa92821f7499b0bf666cbd1',1,1,'authToken','[]',0,'2022-02-14 18:43:28','2022-02-14 18:43:28','2023-02-14 15:43:28'),('aebd1af75e3e37638656d13dced6bfbc73e77b6bbe2f27dca40847d6632f972ed1946dcef6aa3b6b',1,1,'authToken','[]',0,'2022-02-10 13:35:10','2022-02-10 13:35:10','2023-02-10 10:35:10'),('b0608c01b411b7c35c59f9f9f57e59213abf93bf1536aebb95bd7006751fc3035d2ad3d2dc24eaa9',1,1,'authToken','[]',0,'2022-02-10 13:34:04','2022-02-10 13:34:04','2023-02-10 10:34:04'),('b078141b1bf8e65a2226296823419860d0fac715d2639158e2a7515d2a6ab6dcf903f30f0f20ad13',1,1,'authToken','[]',0,'2022-02-13 19:10:34','2022-02-13 19:10:34','2023-02-13 16:10:34'),('b161c5f0713ea65b42e2f6f3744ea672d3c9e748c4ce4cf1268e206b666ba9c8795460b05c166dfa',1,1,'authToken','[]',0,'2022-02-13 18:58:02','2022-02-13 18:58:02','2023-02-13 15:58:02'),('b8a324a6c7cfb535f11f5c2e45588f9df27c94f2b76ffbabb60eaedd0c1c4098039cbd5575c15d87',1,1,'authToken','[]',0,'2022-02-10 12:01:00','2022-02-10 12:01:00','2023-02-10 09:01:00'),('bad6a1db481df4c64b07d90ea68495cb8011c6cdc2e04a4a77101fcdbbdc9280413fe1b5d0132948',1,1,'authToken','[]',0,'2022-02-21 10:33:10','2022-02-21 10:33:10','2023-02-21 07:33:10'),('c12f646e6e00214358880e96b2ef33ead2842669a0ce0a64a31cb3a91112cf057caaf3f3a5181fa9',1,1,'authToken','[]',0,'2022-02-16 14:49:39','2022-02-16 14:49:39','2023-02-16 11:49:39'),('c258778e9141e4c3f2a78714507284ace921e4c812fb560d12cedeed83361d3f56d52140a462dd3b',1,1,'authToken','[]',0,'2022-02-13 19:08:42','2022-02-13 19:08:42','2023-02-13 16:08:42'),('c40af1632484654835f702eac690d82ae15e40e0386dbbf93e191acebd63329f8593950938ea2721',1,1,'authToken','[]',0,'2022-02-08 16:54:43','2022-02-08 16:54:43','2023-02-08 13:54:43'),('c41890b51007f31255fc0df5db2e76f732c8b63622c1bb4aa64db00119ce8f65117f90f5d259fb81',1,1,'authToken','[]',0,'2022-02-11 02:43:31','2022-02-11 02:43:31','2023-02-10 23:43:31'),('c558c38edd28a64f9eab655cfaeb26d339b93699a7b937a9cb6ca0cd6a7b588740f90e4d8945d238',1,1,'authToken','[]',0,'2022-02-21 10:34:18','2022-02-21 10:34:18','2023-02-21 07:34:18'),('c6085403f9df4c531aefd56a3c4367143f0e867ddf9c1df00d01078bee12ac20eb85f82a9c695d5f',1,1,'authToken','[]',0,'2022-02-22 13:21:34','2022-02-22 13:21:34','2023-02-22 10:21:34'),('c67608fd5011555a9dc44d2cd464224571d85b59dde91a3c83c54d89d0f3312ed7df718c863e8b60',1,1,'authToken','[]',0,'2022-02-09 00:16:43','2022-02-09 00:16:43','2023-02-08 21:16:43'),('c8fac3d996a7dfc9d07f4fa2d3a30c74eeeb6e19d71c973ae6ff565bce02b7734ea65025802511bc',1,1,'authToken','[]',0,'2022-02-23 03:01:48','2022-02-23 03:01:48','2023-02-23 00:01:48'),('ccdfb2d2f09537ef0ff518d133938a6b311d8079c62492eb09ba726d35dd89d619bd62a69e576d64',1,1,'authToken','[]',0,'2022-02-10 12:11:50','2022-02-10 12:11:50','2023-02-10 09:11:50'),('d3a43bbf6da66dbaee2eea238de2285803d725d4b5adf261705ba7a2f2c2f1dcd2f0bba40cda4a6f',1,1,'authToken','[]',0,'2022-02-10 12:10:21','2022-02-10 12:10:21','2023-02-10 09:10:21'),('d41c3e55c9293d19275cee1c7d46fba844de0ae1b89ac0e3c6be8daa774061c99b430ab90d29b74b',1,1,'authToken','[]',0,'2022-02-13 19:43:57','2022-02-13 19:43:57','2023-02-13 16:43:57'),('d4967d742bb99cf88bdf5e97c0594b5d25d4f960de9624525201a9050999fb759f260164d95d1682',1,1,'authToken','[]',0,'2022-02-10 14:11:32','2022-02-10 14:11:32','2023-02-10 11:11:32'),('d4a6a134873bb0446ac52ca34864321c2bd349a922abb797e8139af22a535e836e0c5cd436a6a573',1,1,'authToken','[]',0,'2022-02-10 13:51:41','2022-02-10 13:51:41','2023-02-10 10:51:41'),('d4cde71f48563129ad4d92cfc795cb44f647987801e27c11aaf0f9d9fd94cdd8585131cb585d2317',1,1,'authToken','[]',0,'2022-02-11 02:44:03','2022-02-11 02:44:03','2023-02-10 23:44:03'),('d6a278a52c6c0fdb4934900e615d7179757107c1d0e304f167e1a27ef192cd065078cc9926b5e96e',1,1,'authToken','[]',0,'2022-02-23 03:00:12','2022-02-23 03:00:12','2023-02-23 00:00:12'),('d6cfc5ea3d7a91d712aeab2857a4414b0af73a06e1a09f88c893986596a30ef02e8eef0de7f0c218',1,1,'authToken','[]',0,'2022-02-18 01:47:25','2022-02-18 01:47:25','2023-02-17 22:47:25'),('e01689b69263683d4f3c501f5bf4f9e300293ab1acc30e68cb3815ebeca23b26adc1f1851d24fe83',1,1,'authToken','[]',0,'2022-02-10 13:49:09','2022-02-10 13:49:09','2023-02-10 10:49:09'),('e04f894f347d7e44f3493c024750958d9729fad62151bddb663289907184febfc8095ac8a386e0ca',1,1,'authToken','[]',0,'2022-02-08 15:43:21','2022-02-08 15:43:21','2023-02-08 12:43:21'),('e37c0997f24f8721559519ddb2960673a79140e6c537bc674c3ae8ee5fc5d4db7d48ba12ff93108d',1,1,'authToken','[]',0,'2022-02-10 11:17:45','2022-02-10 11:17:45','2023-02-10 08:17:45'),('e57da92203c3b26e900d47a8777a037f691c27a53fdddd43839b01c16b29a3a9ba3f3b5a291f5310',1,1,'authToken','[]',0,'2022-02-08 15:45:15','2022-02-08 15:45:15','2023-02-08 12:45:15'),('f2eebd33dc93f13aa770f9376838ec0ece91c1ce50f2a509c73f21436a045e66bd671591e2f3e9b5',1,1,'authToken','[]',0,'2022-02-11 02:44:30','2022-02-11 02:44:30','2023-02-10 23:44:30'),('f8d91c72bd3efcf1b97740f36f1e623f6e56ed4a43ec15fd85aebd3103cdd79157518256405525ae',1,1,'authToken','[]',0,'2022-02-10 12:16:01','2022-02-10 12:16:01','2023-02-10 09:16:01'),('f91a53e479e65c7313d8d17dd5bdfa8fab97bd30b9db123a40acf3634461129f61f37d03da4a608a',1,1,'authToken','[]',0,'2022-02-13 19:12:13','2022-02-13 19:12:13','2023-02-13 16:12:13'),('f94aaea05953121801d71ebd46775564f6db3fd541c2f6243f4ea343df8bcb845b29a624e9cc3f6f',1,1,'authToken','[]',0,'2022-02-10 12:39:18','2022-02-10 12:39:18','2023-02-10 09:39:18'),('fa03d6b45c7a2e7bce55d8f4873b279a785a18239a97528a2d2826a6576888f3bcaa8ae60703c4dd',1,1,'authToken','[]',0,'2022-02-13 19:10:01','2022-02-13 19:10:01','2023-02-13 16:10:01'),('fc97602bd3730bb94c6dee38d64be194f2f16a2ea1811fd4b8ed0bbc15eb568668e8742828e21f06',1,1,'authToken','[]',0,'2022-02-08 20:32:47','2022-02-08 20:32:47','2023-02-08 17:32:47'),('fd5980d21e4524b34f739fe8ad96ec65878a283f7e80a8f70e39c83076cbacec91f9a60f46065eb3',1,1,'authToken','[]',0,'2022-02-10 04:10:56','2022-02-10 04:10:56','2023-02-10 01:10:56');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'SGC Personal Access Client','S8Yh0Yo70ltK1JMIgkTmVRRVtCq55ABFPkOiJ99o',NULL,'http://localhost',1,0,0,'2022-02-08 14:50:21','2022-02-08 14:50:21'),(2,1,'SGC Password Grant Client','Ks68lYhWPEmOJpnJALQjlTJrrIGLRufx57B1Osah','users','http://localhost',0,1,0,'2022-02-08 14:50:21','2022-02-08 14:50:21');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2022-02-08 14:50:21','2022-02-08 14:50:21');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `no_perfil` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perfil_pai_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador',0),(2,'Supervisor',1),(3,'Regional',2),(4,'Corretoras',3),(5,'Corretor',4);
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_rota`
--

DROP TABLE IF EXISTS `perfil_rota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_rota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_id` int(11) NOT NULL,
  `rota_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_rota_FK` (`perfil_id`),
  KEY `perfil_rota_FK_1` (`rota_id`),
  CONSTRAINT `perfil_rota_FK` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`),
  CONSTRAINT `perfil_rota_FK_1` FOREIGN KEY (`rota_id`) REFERENCES `rota` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_rota`
--

LOCK TABLES `perfil_rota` WRITE;
/*!40000 ALTER TABLE `perfil_rota` DISABLE KEYS */;
INSERT INTO `perfil_rota` VALUES (12,1,6),(13,1,9),(14,1,10),(15,1,11),(16,1,12),(17,1,13),(18,1,14),(19,1,15),(20,1,16),(21,1,17);
/*!40000 ALTER TABLE `perfil_rota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rota`
--

DROP TABLE IF EXISTS `rota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_rota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ds_rota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_icone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sg_menu` tinyint(1) NOT NULL DEFAULT 0,
  `rota_pai_id` int(11) DEFAULT NULL,
  `nu_ordem` int(11) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rota_modulo` (`modulo_id`),
  CONSTRAINT `fk_rota_modulo` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rota`
--

LOCK TABLES `rota` WRITE;
/*!40000 ALTER TABLE `rota` DISABLE KEYS */;
INSERT INTO `rota` VALUES (6,'dashboard','Painel','folder',1,NULL,NULL,4),(9,'userIndex','Pesquisar','search',1,NULL,NULL,5),(10,'userCreate','Cadastrar Usuário','person_add',1,NULL,NULL,5),(11,'userEdit','Editar Usuário','person_add',0,NULL,NULL,5),(12,'userShow','Dados Usuário','account_box',0,NULL,NULL,5),(13,'contratoIndex','Pesquisar','search',1,NULL,NULL,2),(14,'contratoCreate','Cadastrar','note_add',1,NULL,NULL,2),(15,'contratoEdit','Editar Contrato','assignment',0,NULL,NULL,2),(16,'contratoShow','Visualizar Contrato','assignment',0,NULL,NULL,2),(17,'contratoMeus','Meus Contratos','list',1,NULL,NULL,2);
/*!40000 ALTER TABLE `rota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacao_contrato`
--

DROP TABLE IF EXISTS `situacao_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situacao_contrato` (
  `id` int(10) unsigned NOT NULL,
  `de_situacao_contrato` varchar(100) NOT NULL,
  `tx_situacao_contrato` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacao_contrato`
--

LOCK TABLES `situacao_contrato` WRITE;
/*!40000 ALTER TABLE `situacao_contrato` DISABLE KEYS */;
INSERT INTO `situacao_contrato` VALUES (1,'Rascunho','Contrato não tem validade'),(2,'Aguardando Pagamento','Ainda não recebeu a confirmação de pagamento'),(3,'Liberado','Contrato já pode ser impresso, já foi pago'),(4,'Encerrado','Contrato foi encerrado'),(5,'Cancelado','Contrato cancelado');
/*!40000 ALTER TABLE `situacao_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cliente`
--

DROP TABLE IF EXISTS `tipo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_cliente` (
  `id` int(11) NOT NULL,
  `de_tipo_cliente` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cliente`
--

LOCK TABLES `tipo_cliente` WRITE;
/*!40000 ALTER TABLE `tipo_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contrato` (
  `id` int(11) NOT NULL,
  `de_tipo_contrato` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contrato`
--

LOCK TABLES `tipo_contrato` WRITE;
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
INSERT INTO `tipo_contrato` VALUES (1,'Compra'),(2,'Venda'),(3,'Locação'),(4,'Fiança'),(5,'Representação');
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `st_ativo` tinyint(1) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conselho_regional_id` int(11) DEFAULT NULL,
  `perfil_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imobiliaria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_perfil_id_foreign` (`perfil_id`),
  KEY `users_FK` (`conselho_regional_id`),
  KEY `fk_imobiliaria_users` (`imobiliaria_id`),
  CONSTRAINT `fk_imobiliaria_users` FOREIGN KEY (`imobiliaria_id`) REFERENCES `imobiliaria` (`id`),
  CONSTRAINT `users_FK` FOREIGN KEY (`conselho_regional_id`) REFERENCES `conselho_regional` (`id`),
  CONSTRAINT `users_perfil_id_foreign` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@sgc.com.br',NULL,'$2y$10$ZeqONLbaj736ai3T8piiUO6wF/w8jhQi5walmTtu2Ac42UbsuTB4e',1,NULL,NULL,1,NULL,NULL,NULL),(2,'admin','admin2@gmail.com',NULL,'SgrSegunda',1,NULL,NULL,1,'2022-02-12 03:08:08','2022-02-12 03:08:08',NULL),(4,'admin','admin2@gmail.coma',NULL,'SgrSegunda',0,NULL,NULL,1,'2022-02-12 03:08:19','2022-02-12 03:08:19',NULL),(5,'ROniel','ronielvb@gmail.com',NULL,'SgrSegunda',0,NULL,NULL,2,'2022-02-14 19:21:41','2022-02-14 19:21:41',NULL),(6,'Roniel viana','viana@gmail.com',NULL,'$2y$10$Ed1xdRbWrQgV0sYjHkY.WOHlPYtUhDILXwb7CmsIcvFigRUnM4VaG',0,NULL,NULL,2,'2022-02-14 19:24:09','2022-02-14 19:24:09',NULL),(8,'Roniel viana','viana@gmail.coma',NULL,'$2y$10$mFdIhhxMoagdTIv0sNup5Ojkuipct8IFCdGzXhkpg4.y8CcYCcLXG',0,NULL,NULL,2,'2022-02-14 19:24:22','2022-02-14 19:24:22',NULL),(9,'via','vi@gma.com',NULL,'$2y$10$RZDwNwVeyeiJnnP7TY.Ea.gT.XefTNvrCYKERzhOweIF0XG6a/q9O',0,NULL,NULL,2,'2022-02-14 19:25:00','2022-02-14 19:25:00',NULL),(10,'de nvovo','vida@gail.com',NULL,'$2y$10$yyjJg5jJIy9u7C8QUQsDReugT1vZq6mdP2KXRcur74zBz7W6PdezO',0,NULL,NULL,3,'2022-02-14 19:26:55','2022-02-14 19:26:55',NULL),(11,'Novoa diad','ronielvb@gma.coe',NULL,'$2y$10$xBFwGX3PHx3SnpPGBd3Lfu4edutY9poRZJY718l1bngDkKT1MjUhW',0,NULL,NULL,2,'2022-02-14 19:28:23','2022-02-14 19:28:23',NULL),(12,'Novoa diad','ronielvb@gma.br',NULL,'$2y$10$Sr4C5ioUCF.S6QfqsqSWS.nwpW8/aIqTOt9jDCwRzww5SAPjKg9ya',0,NULL,NULL,2,'2022-02-14 19:29:04','2022-02-14 19:29:04',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sgrv1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-23  0:10:32
