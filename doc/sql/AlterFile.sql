CREATE TABLE `imobiliaria` (
  `id` int(11) NOT NULL,
  `no_imobiliaria` varchar(150) NOT NULL,
  `nu_cnpj` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_imobiliaria_estado1_idx` (`estado_id`),
  CONSTRAINT `fk_imobiliaria_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

go

alter table users add imobiliaria_id int;

alter table users  add constraint fk_imobiliaria_users foreign key (imobiliaria_id)references imobiliaria(id)

drop table users_escritorio ;

alter table contrato  add imobiliaria_id int;

alter table contrato  add constraint fk_imobiliaria_contrato foreign key (imobiliaria_id)references imobiliaria(id);

# será preciso remover a foreign key fk_contrato_escritorio1_idx, da tabela contrato antes de
# executar o script abaixo


alter table contrato  drop column escritorio_id;

drop table escritorio

ALTER TABLE sgrv1.cliente DROP COLUMN nu_ddd_comercial;
ALTER TABLE sgrv1.cliente DROP COLUMN nu_ddd_celular;
ALTER TABLE sgrv1.cliente DROP COLUMN nu_ddd_residencial;

