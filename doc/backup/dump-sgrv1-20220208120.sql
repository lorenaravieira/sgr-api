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
  `nu_ddd_celular` varchar(3) DEFAULT NULL,
  `nu_tel_residencial` int(11) DEFAULT NULL,
  `nu_ddd_residencial` varchar(3) DEFAULT NULL,
  `nu_tel_comercial` varchar(45) DEFAULT NULL,
  `nu_ddd_comercial` varchar(3) DEFAULT NULL,
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
  `escritorio_id` int(11) NOT NULL,
  `st_com_exclusividade` tinyint(2) DEFAULT 0,
  `users_id` int(11) NOT NULL,
  `tipo_contrato_id` int(11) NOT NULL,
  `cadastro_dt` datetime NOT NULL DEFAULT current_timestamp(),
  `imovel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contrato_cliente1_idx` (`cliente_id`),
  KEY `fk_contrato_situacao1_idx` (`situacao_id`),
  KEY `fk_contrato_escritorio1_idx` (`escritorio_id`),
  KEY `fk_contrato_users1_idx` (`users_id`),
  KEY `fk_contrato_tipo_contrato1_idx` (`tipo_contrato_id`),
  KEY `fk_contrato_imovel1_idx` (`imovel_id`),
  CONSTRAINT `fk_contrato_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_escritorio1` FOREIGN KEY (`escritorio_id`) REFERENCES `escritorio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_imovel1` FOREIGN KEY (`imovel_id`) REFERENCES `imovel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_situacao1` FOREIGN KEY (`situacao_id`) REFERENCES `situacao_contrato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_tipo_contrato1` FOREIGN KEY (`tipo_contrato_id`) REFERENCES `tipo_contrato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `escritorio`
--

DROP TABLE IF EXISTS `escritorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escritorio` (
  `id` int(11) NOT NULL,
  `no_escritorio` varchar(150) NOT NULL,
  `nu_cnpj` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_escritorio_estado1_idx` (`estado_id`),
  CONSTRAINT `fk_escritorio_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escritorio`
--

LOCK TABLES `escritorio` WRITE;
/*!40000 ALTER TABLE `escritorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `escritorio` ENABLE KEYS */;
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
  `cliente_id` int(11) NOT NULL,
  `situacao_id` int(10) unsigned NOT NULL,
  `escritorio_id` int(11) NOT NULL,
  `st_com_exclusividade` tinyint(2) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `tipo_contrato_id` int(11) NOT NULL,
  `dt_cadastro` datetime NOT NULL,
  `imovel_id` int(11) NOT NULL,
  `contrato_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'Administrativo','manage_accounts'),(2,'Contrato','assignment'),(3,'Cliente','person_outline');
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
INSERT INTO `oauth_access_tokens` VALUES ('0938eb894edbd860a25a0c40172a9cf1ff419c363059699cb4734f985c09944ed887515607a9bca2',1,1,'authToken','[]',0,'2022-02-08 17:06:51','2022-02-08 17:06:51','2023-02-08 14:06:51'),('399b13e23051103f910a94a66a9589b61d0b1c22bccfaeda0bf638b46a5d3c2dddc25f528978dc8c',1,1,'authToken','[]',0,'2022-02-08 14:50:43','2022-02-08 14:50:43','2023-02-08 11:50:43'),('4c2d61286e6abaa3a0c66a52166a78242faf9714d493e2189c0f6bbbfc630e6407ba476d2f2c72a6',1,1,'authToken','[]',0,'2022-02-08 15:46:10','2022-02-08 15:46:10','2023-02-08 12:46:10'),('5cfc5706054df00093b7c4536960d83ee25e5001cc00b10d027d5f4cc94c666abadf25e27b1bc738',1,1,'authToken','[]',0,'2022-02-08 17:26:01','2022-02-08 17:26:01','2023-02-08 14:26:01'),('c40af1632484654835f702eac690d82ae15e40e0386dbbf93e191acebd63329f8593950938ea2721',1,1,'authToken','[]',0,'2022-02-08 16:54:43','2022-02-08 16:54:43','2023-02-08 13:54:43'),('c67608fd5011555a9dc44d2cd464224571d85b59dde91a3c83c54d89d0f3312ed7df718c863e8b60',1,1,'authToken','[]',0,'2022-02-09 00:16:43','2022-02-09 00:16:43','2023-02-08 21:16:43'),('e04f894f347d7e44f3493c024750958d9729fad62151bddb663289907184febfc8095ac8a386e0ca',1,1,'authToken','[]',0,'2022-02-08 15:43:21','2022-02-08 15:43:21','2023-02-08 12:43:21'),('e57da92203c3b26e900d47a8777a037f691c27a53fdddd43839b01c16b29a3a9ba3f3b5a291f5310',1,1,'authToken','[]',0,'2022-02-08 15:45:15','2022-02-08 15:45:15','2023-02-08 12:45:15'),('fc97602bd3730bb94c6dee38d64be194f2f16a2ea1811fd4b8ed0bbc15eb568668e8742828e21f06',1,1,'authToken','[]',0,'2022-02-08 20:32:47','2022-02-08 20:32:47','2023-02-08 17:32:47');
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
INSERT INTO `perfil` VALUES (1,'Administrador',NULL),(2,'Supervisor',NULL),(3,'Regional',NULL),(4,'Corretoras',NULL),(5,'Corretor',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_rota`
--

LOCK TABLES `perfil_rota` WRITE;
/*!40000 ALTER TABLE `perfil_rota` DISABLE KEYS */;
INSERT INTO `perfil_rota` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rota`
--

LOCK TABLES `rota` WRITE;
/*!40000 ALTER TABLE `rota` DISABLE KEYS */;
INSERT INTO `rota` VALUES (1,'ceo.show','Visualização do CEO',NULL,1,NULL,NULL,1),(2,'ceo.update','Atualização do CEO',NULL,1,NULL,NULL,1),(3,'ceo.store','Registrar do CEO',NULL,1,NULL,NULL,2),(4,'ceo.put','Editar do CEO',NULL,1,NULL,NULL,2),(5,'ceo.delete','Deletar do CEO',NULL,1,NULL,NULL,3);
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
  `id_conselho_regional` int(11) DEFAULT NULL,
  `perfil_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_perfil_id_foreign` (`perfil_id`),
  KEY `users_FK` (`id_conselho_regional`),
  CONSTRAINT `users_FK` FOREIGN KEY (`id_conselho_regional`) REFERENCES `conselho_regional` (`id`),
  CONSTRAINT `users_perfil_id_foreign` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@sgc.com.br',NULL,'$2y$10$ZeqONLbaj736ai3T8piiUO6wF/w8jhQi5walmTtu2Ac42UbsuTB4e',1,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_escritorio`
--

DROP TABLE IF EXISTS `users_escritorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_escritorio` (
  `users_id` int(11) NOT NULL,
  `escritorio_id` int(11) NOT NULL,
  PRIMARY KEY (`users_id`,`escritorio_id`),
  KEY `fk_users_has_escritorio_escritorio1_idx` (`escritorio_id`),
  KEY `fk_users_has_escritorio_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_has_escritorio_escritorio1` FOREIGN KEY (`escritorio_id`) REFERENCES `escritorio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_escritorio_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_escritorio`
--

LOCK TABLES `users_escritorio` WRITE;
/*!40000 ALTER TABLE `users_escritorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_escritorio` ENABLE KEYS */;
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

-- Dump completed on 2022-02-08 22:36:44
