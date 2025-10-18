-- TABELA CLIENTE

create table cliente as
select distinct cliente_id as ID, cliente_nome as nome, cliente_email as email from pedidos;

select * from cliente;
alter table cliente add primary key (ID);
describe cliente;