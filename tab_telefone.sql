-- TABELA TELEFONE


create table telefone as
select distinct cliente_telefone, cliente_id as fk_id_cliente from pedidos;

alter table telefone add constraint fk_cli_tele foreign key (fk_id_cliente) 
	references cliente(ID);

describe telefone;
select * from telefone;