-- TABELA ENDEREÇO
create table end_temporario as
select 
	distinct cliente_endereco, 
    cliente_id 
from pedidos;

select * from end_temporario;

create table endereco as
select
	cliente_id as fk_cli_id,
	substring_index(cliente_endereco,',',1) as rua,
    substring_index(substring_index(substring_index(cliente_endereco,',',2),',',-1),'-',1) as numero,
    substring_index(substring_index(substring_index(cliente_endereco,'-',2),'-',-1),',',1) as bairro,
    substring_index(substring_index(cliente_endereco,',',-1),'-',1) as cidade,
    substring_index(substring_index(cliente_endereco,',',-1),'-',-1) as estado
from end_temporario;

select * from endereco;

alter table endereco add constraint fk_cli_end foreign key (fk_cli_id) 
	references cliente(ID);
    
describe endereco;

select * from pedidos;