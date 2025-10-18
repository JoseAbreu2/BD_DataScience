-- TABELA PEDIDO

create table pedido as
select 
	pedido_numero as numero,
    cliente_id as fk_id_cli,
	data_pedido as ped_data, 
    valor_item as valor,
	valor_total_pedido as valor_total, 
    forma_pagamento as forma, 
    quantidade as qtd
from pedidos;

select * from pedido;

alter table pedido add constraint fk_cli_pedi foreign key (fk_id_cli) 
	references cliente(ID);

alter table pedido add constraint fk_id_prod foreign key (fk_produto_id) 
	references produto(ID);

alter table pedido add constraint fk_form_paga foreign key (fk_forma_pagamento) 
	references forma_pagamento(id);
    

alter table pedido add column fk_forma_pagamento int;
describe pedido;

alter table pedido drop column forma;
alter table pedido add column fk_produto_id int after numero;