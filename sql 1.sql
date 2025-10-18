select 
	c.id, 
	c.nome,
    
from cliente as c
join pedido as ped on c.id = fk_id_cli;

select * from pedido; -- fk_produto_id e fk_forma_pagamento estão vazias
select * from produto; -- fk_id_cat está vazia


create table produto1 as
select 
produto_id as pk_id_prod,
produto_descricao,
preco_unitario as preco,
cp.id as fk_id_cat
 from pedidos p
 inner join categorias_prod cp on p.produto_categoria = cp.produto_categoria;
 
 
 alter table produto1 add column id_produto int primary key auto_increment;
 create table produto as
 select * from produto1;
 
 describe produto;
 
 alter table produto1 drop column pk_id_prod;
 
alter table produto1 add constraint fk_cat_prod1 foreign key (fk_id_cat) 
	references categorias_prod(id);

select * from produto1;

select * from pedido;

 
 