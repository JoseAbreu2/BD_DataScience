create table cliente as
select codcliente as id, nomecliente as nome from clientes;

describe cliente;

select * from cliente;


-- modificar coluna para PK e auto_increment
alter table cliente modify id int primary key auto_increment;
alter table cliente modify nome varchar(45) not null;

create table contato as
select
    codcliente as fk_id_cliente,
    trim(substring_index(telefones, ',', 1)) as contato
from clientes

union
select
    codcliente as fk_id_cliente,
    trim(substring_index(telefones, ',', -1)) as contato
from clientes;

select * from contato;

alter table contato add constraint fk_id_cliente foreign key(fk_id_cliente)
    references cliente(id);
   
    -- tabela endereço
    -- ----------------
    select * from clientes;
    create table endereco as
    select
    codcliente,
    substring_index(endereco, ',',1) as rua,
substring_index(endereco, ',',-1) as numero,
    cidade,
    estado
    from clientes;
   
    alter table endereco add constraint fk_end foreign key (codcliente)
    references cliente(id);
   
    -- tabela produto
    -- ---------------
   
    select * from clientes;
   
    create table produtos as
    select
    codcliente fk_id_cliente,
    trim(substring_index(produtoscomprados,',',1)) as produto
    from clientes
   union
   select    
    codcliente,
    trim(substring_index(produtoscomprados,',',-1)) as produto
    from clientes
    union
    select
    codcliente,
    trim(substring_index(substring_index(produtoscomprados,',',2),',',-1)) as produto
    from clientes;

alter table produtos add column id int primary key auto_increment first;

select * from produtos;

create table item_comprado as
select id as fk_id_produto, fk_id_cliente from produtos;


alter table produtos drop column fk_id_cliente;
select * from produtos;


alter table produtos drop column fk_id_cliente;

alter table item_comprado add constraint fk_prod
foreign key(fk_id_produto) references produtos(id);

alter table item_comprado add constraint fk_cli_item
foreign key (fk_id_cliente) references cliente(id);