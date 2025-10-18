-- TABELA PRODUTO

-- fk_id_cat está vazia


-- create table produto as
select produto_descricao as descricao, preco_unitario as preco from pedidos;


select * from produto;
describe produto;

alter table produto add primary key (id);

create table descricao_prd as
select distinct produto_descricao from pedidos;


select * from produto;

select * from descricao_prd;

select produto.id, descricao_prd.produto_descricao from produto, descricao_prd;

describe produto;
describe categorias_prod;

alter table produto add column id int primary key auto_increment;
alter table produto add column fk_id_cat int;

alter table produto add constraint fk_cat_prod foreign key (fk_id_cat) 
	references categorias_prod(id);




-- TABELA CATEGORIA
-- create table categorias_prod as
select distinct produto_categoria from pedidos;

select * from categorias_prod;

alter table categorias_prod add column id int primary key auto_increment first;

select * from produto;



-- TABELA FORMA PAGAMENTO
create table forma_pagamento as
select distinct forma_pagamento from pedidos;

select * from forma_pagamento;

alter table forma_pagamento add column id int primary key auto_increment;



select id, descricao from produto where 
