

CREATE TABLE IF NOT EXISTS `tipo_cliente` (
  `id` INT NOT NULL,
  `de_tipo_cliente` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE IF NOT EXISTS `situacao_contrato` (
  `id` INT UNSIGNED NOT NULL,
  `de_situacao_contrato` VARCHAR(100) NOT NULL,
  `tx_situacao_contrato` VARCHAR(400) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `tipo_contrato` (
  `id` INT NOT NULL,
  `de_tipo_contrato` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` INT NOT NULL,
  `de_estado` VARCHAR(50) NOT NULL,
  `co_estado` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE IF NOT EXISTS `escritorio` (
  `id` INT NOT NULL,
  `no_escritorio` VARCHAR(150) NOT NULL,
  `nu_cnpj` INT(11) NOT NULL,
  `estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_escritorio_estado1_idx` (`estado_id` ASC) ,
  CONSTRAINT `fk_escritorio_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `users_escritorio` (
  `users_id` INT NOT NULL,
  `escritorio_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `escritorio_id`),
  INDEX `fk_users_has_escritorio_escritorio1_idx` (`escritorio_id` ASC) ,
  INDEX `fk_users_has_escritorio_users1_idx` (`users_id` ASC) ,
  CONSTRAINT `fk_users_has_escritorio_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_escritorio_escritorio1`
    FOREIGN KEY (`escritorio_id`)
    REFERENCES `escritorio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `conselho_regional` (
  `id` INT NOT NULL,
  `de_conselho_regional` VARCHAR(45) NULL DEFAULT NULL,
  `nu_ddd` INT(11) NULL DEFAULT NULL,
  `nu_telefone` INT(11) NULL DEFAULT NULL,
  `no_representante` VARCHAR(145) NULL DEFAULT NULL,
  PRIMARY KEY (`id_conselho_regional`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE IF NOT EXISTS `cliente` (
  `id` INT NOT NULL,
  `no_cliente` VARCHAR(225) NULL DEFAULT NULL,
  `co_tipo_cliente` INT(11) NULL DEFAULT NULL,
  `nu_cpf` VARCHAR(11) NULL DEFAULT NULL,
  `de_email` VARCHAR(150) NOT NULL,
  `nu_cnpj` VARCHAR(45) NULL DEFAULT NULL,
  `st_pessoa_juridica` TINYINT(1) NULL DEFAULT NULL,
  `tipo_cliente_id` INT(11) NULL DEFAULT NULL,
  `nu_celular` VARCHAR(45) NULL DEFAULT NULL,
  `nu_ddd_celular` VARCHAR(3) NULL DEFAULT NULL,
  `nu_tel_residencial` INT(11) NULL DEFAULT NULL,
  `nu_ddd_residencial` VARCHAR(3) NULL DEFAULT NULL,
  `nu_tel_comercial` VARCHAR(45) NULL DEFAULT NULL,
  `nu_ddd_comercial` VARCHAR(3) NULL DEFAULT NULL,
  `dt_nascimento` DATE NULL DEFAULT NULL,
  `nu_cep` INT(11) NULL DEFAULT NULL,
  `no_cidade` VARCHAR(200) NULL DEFAULT NULL,
  `de_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `de_complemento` VARCHAR(200) NULL DEFAULT NULL,
  `nu_endereco` VARCHAR(45) NULL DEFAULT NULL,
  `estado_id` INT NOT NULL,
  `cadastro_dt` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_tipo_cliente_idx` (`tipo_cliente_id` ASC) ,
  INDEX `fk_cliente_estado1_idx` (`estado_id` ASC) ,
  CONSTRAINT `fk_cliente_tipo_cliente`
    FOREIGN KEY (`tipo_cliente_id`)
    REFERENCES `tipo_cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `imovel` (
  `id` INT NOT NULL,
  `nu_cep` INT(11) NULL DEFAULT NULL,
  `no_cidade` VARCHAR(200) NULL DEFAULT NULL,
  `de_endereco` VARCHAR(150) NULL DEFAULT NULL,
  `de_complemento` VARCHAR(200) NULL DEFAULT NULL,
  `nu_endereco` INT(11) NULL DEFAULT NULL,
  `co_tipo_imovel` VARCHAR(5) NOT NULL,
  `estado_id` INT NOT NULL,
  `nu_matricula` VARCHAR(100) NULL DEFAULT NULL,
  `cadastro_dt` VARCHAR(45) NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`id`),
  INDEX `fk_imovel_estado1_idx` (`estado_id` ASC) ,
  CONSTRAINT `fk_imovel_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `conselho_regional_estado` (
  `conselho_regional_id` INT(11) NOT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`conselho_regional_id`, `estado_id`),
  INDEX `fk_estado_has_conselho_regional_conselho_regional1_idx` (`conselho_regional_id` ASC) ,
  INDEX `fk_estado_has_conselho_regional_estado1_idx` (`estado_id` ASC) ,
  CONSTRAINT `fk_estado_has_conselho_regional_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estado_has_conselho_regional_conselho_regional1`
    FOREIGN KEY (`conselho_regional_id`)
    REFERENCES `conselho_regional` (`id_conselho_regional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



CREATE TABLE IF NOT EXISTS `contrato` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `situacao_id` INT UNSIGNED NOT NULL,
  `escritorio_id` INT NOT NULL,
  `st_com_exclusividade` TINYINT(2) NULL DEFAULT 0,
  `users_id` INT NOT NULL,
  `tipo_contrato_id` INT NOT NULL,
  `cadastro_dt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imovel_id` INT NOT NULL,
  PRIMARY KEY (`INT`),
  INDEX `fk_contrato_cliente1_idx` (`cliente_id` ASC) ,
  INDEX `fk_contrato_situacao1_idx` (`situacao_id` ASC) ,
  INDEX `fk_contrato_escritorio1_idx` (`escritorio_id` ASC) ,
  INDEX `fk_contrato_users1_idx` (`users_id` ASC) ,
  INDEX `fk_contrato_tipo_contrato1_idx` (`tipo_contrato_id` ASC) ,
  INDEX `fk_contrato_imovel1_idx` (`imovel_id` ASC) ,
  CONSTRAINT `fk_contrato_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_situacao1`
    FOREIGN KEY (`situacao_id`)
    REFERENCES `situacao_contrato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_escritorio1`
    FOREIGN KEY (`escritorio_id`)
    REFERENCES `escritorio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_tipo_contrato1`
    FOREIGN KEY (`tipo_contrato_id`)
    REFERENCES `tipo_contrato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contrato_imovel1`
    FOREIGN KEY (`imovel_id`)
    REFERENCES `imovel` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `historico_contrato` (
  `id` INT NOT NULL,
  `id_pai` INT NULL DEFAULT NULL,
  `cliente_id` INT(11) NOT NULL,
  `situacao_id` INT UNSIGNED NOT NULL,
  `escritorio_id` INT NOT NULL,
  `st_com_exclusividade` TINYINT(2) NULL DEFAULT NULL,
  `users_id` INT NOT NULL,
  `tipo_contrato_id` INT NOT NULL,
  `dt_cadastro` DATETIME NOT NULL,
  `imovel_id` INT NOT NULL,
  `contrato_id` INT NOT NULL,
  `registro_dt` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_historico_contrato_contrato1_idx` (`contrato_id` ASC) ,
  INDEX `fk_hisotirco_contratao_pai_idx` (`id_pai` ASC) ,
  CONSTRAINT `fk_historico_contrato_contrato1`
    FOREIGN KEY (`contrato_id`)
    REFERENCES `contrato` (`INT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hisotirco_contratao_pai`
    FOREIGN KEY (`id_pai`)
    REFERENCES `historico_contrato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

ALTER TABLE `users` ADD  CONSTRAINT `fk_users_conselho_regional1`
   FOREIGN KEY (`id_conselho_regional`)
    REFERENCES `conselho_regional` (`id_conselho_regional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;
