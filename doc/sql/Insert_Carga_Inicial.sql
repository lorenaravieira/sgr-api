
insert into perfil(id,no_perfil)values(1,'Administrador');
insert into perfil(id,no_perfil)values(2,'Supervisor');
insert into perfil(id,no_perfil)values(3,'Regional');
insert into perfil(id,no_perfil)values(4,'Corretoras');
insert into perfil(id,no_perfil)values(5,'Corretor');

/

insert into tipo_contrato(id,de_tipo_contrato)values(1,'Compra');
insert into tipo_contrato(id,de_tipo_contrato)values(2,'Venda');
insert into tipo_contrato(id,de_tipo_contrato)values(3,'Locação');
insert into tipo_contrato(id,de_tipo_contrato)values(4,'Fiança');
insert into tipo_contrato(id,de_tipo_contrato)values(5,'Representação');

/

insert into situacao_contrato(id,de_situacao_contrato,tx_situacao_contrato)values(1,'Rascunho','Contrato não tem validade');
insert into situacao_contrato(id,de_situacao_contrato,tx_situacao_contrato)values(2,'Aguardando Pagamento','Ainda não recebeu a confirmação de pagamento');
insert into situacao_contrato(id,de_situacao_contrato,tx_situacao_contrato)values(3,'Liberado','Contrato já pode ser impresso, já foi pago');
insert into situacao_contrato(id,de_situacao_contrato,tx_situacao_contrato)values(4,'Encerrado','Contrato foi encerrado');
insert into situacao_contrato(id,de_situacao_contrato,tx_situacao_contrato)values(5,'Cancelado','Contrato cancelado');

