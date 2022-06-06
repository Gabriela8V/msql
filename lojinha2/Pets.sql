/**
	Lojinha pets
    @autor Gabriela
*/



create database lojinhapets;
use lojinhapets;
create table produtos(
	codigo int primary key auto_increment,
    barcode varchar(255),
    produto varchar(255) not null,
    descricao varchar(255) not null,
    fabricante varchar(255) not null,
    datacard timestamp default current_timestamp,
    dataval date not null,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(255) not null,
    localizacao varchar(255),
   custo decimal(10,2),
   lucro decimal(10,2),
   venda decimal(10,2),
   valor decimal(10,2)
    );
    describe produtos;
    
    
  insert into produtos(barcode,produto,descricao,fabricante,dataval,
  estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
  value('1234567890','Caneta BIC Azul','Caneta bic ponta fina','Bic','20240523',20,5,'UN','Prateleira 2',0.80,100,1.50);
  
  insert into produtos (barcode,produto,descricao,fabricante,dataval,
  estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
  value ('1234567890','ração','Ração de Carne','ração','20240523',20,5,'UN','Prateleira 2',0.80,80,17.50);
    insert into produtos (barcode,produto,descricao,fabricante,dataval,
  estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
  value ('1234567890','Casinha','Casinha pet','casa tamanho medio','20240523',20,5,'UN','Prateleira 5',0.80,80,50.00);
    insert into produtos (barcode,produto,descricao,fabricante,dataval,
  estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
  value ('1234567890','Coleira','coleira','coleira','20240523',20,5,'UN','Prateleira 1',0.80,80,10.50);
    insert into produtos (barcode,produto,descricao,fabricante,dataval,
  estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
  value ('1234567890','Pote de Aluminio','Pote de Aluminio','Pote','20240523',20,5,'UN','Prateleira 7',0.80,100,25.00);
    insert into produtos (barcode,produto,descricao,fabricante,dataval,
  estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
  value ('1234567890','Escova/pente','Escova/pente','Escova','20240523',20,5,'UN','Prateleira 6',0.80,80,10.50);
    insert into produtos (barcode,produto,descricao,fabricante,dataval,
  estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
  value ('1234567890','Comedouro','comedouro','Comedouro','20240523',20,5,'UN','Prateleira 8',0.80,80,40.00);
  insert into produtos (barcode,produto,descricao,fabricante,dataval,
  estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
  value('1234567890','Caminha','Caminha','Caminha','20240523',20,5,'UN','Prateleira 9',0.80,80,2.20);
  
  drop table produtos;
  
    select * from produtos;
    
    
-- Acessando o sistema pela tela de login
-- and (função lógica onde todas as condições devem ser verdadeiras)
select * from usuarios where login='admin' and senha=md5('admin');

create table fornecedores (
	idfor int primary key auto_increment,
    cnpj varchar(255) not null unique,
    ie varchar(255) unique,
    im varchar(255) unique,
    razao varchar(255) not null,
    fantasia varchar(255) not null,
    site varchar(255),
    fone varchar(255) not null,
    contato varchar(255),     
	email varchar(255),
    cep varchar(255) not null,
    endereco varchar(255) not null,
    numero varchar(255) not null,
    complemento varchar(255),
    bairro varchar(255) not null,
    cidade varchar(255) not null,
    uf char(2) not null,
    obs varchar(255)
);

insert into fornecedores
(cnpj,razao,fantasia,fone,cep,endereco,numero,bairro,cidade,uf)
values ('17.127.927/0001-99','Kalunga Comercio e Industria Grafica Ltda','Kalunga',
'9999-1234','03307-000','Rua Tuiuti','2769','Tatuapé','São Paulo','SP');


select * from fornecedores;

    
create table usuarios(
	idusu int primary key auto_increment,
    usuario varchar(255) not null,
    login varchar(255) not null unique,
    senha varchar(255) not null,
    perfil varchar(255)  not null
    );
    
    describe usuarios;

insert into usuarios(usuario,login,senha,perfil)
value('Administrador','admin',md5('admin'),'admin');
    
insert into usuarios(usuario,login,senha,perfil)
value('Gabriela','gabriela',md5('123456'),'user');

 select * from usuarios;
 
  select * from usuarios where login='admin' and senha=md5('admin');


    select * from produto where codigo=2;
    
    select produto,quantidade from produtos;
    select produto, valor from produtos;
    
    select produto,quantidade,valor from produtos order by produto;
  select produto,quantidade,valor from produtos order by produto desc;
  
  select produto as Produto, quantidade as Quantidade, valor as Valor
from produtos order by produto;

update produtos set valor= '20' where codigo=1;
update produtos set produto = 'pente'where codigo=5;
update produtos set produto= 'anti pulgas', quantidade = '3', valor  = '10' where codigo=7;

 delete from produtos where codigo=7;
 
/* relatórios */

-- Inventário do estoque (patrimônio)
-- sum() função de soma no banco de dados
select sum(estoque * custo) as total from produtos;

-- relatório de reposição de estoque 1
select * from produtos where estoque < estoquemin;

-- relatório de reposição de estoque 2
-- date_format() função usada para formatar a data
-- %d/%m/%Y dd/mm/aaaa | %d/%m/%y dd/mm/aa
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
estoque, estoquemin as estoque_mínimo
from produtos where estoque < estoquemin;

-- relatório de validade de produtos 1
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade
from produtos;

-- relatório de validade de produtos 2
-- datediff() calcula a diferença em dias
-- curdate() obtém a data atual
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes
from produtos;

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(255) not null,
    fone varchar(255) not null,
    cpf varchar(255) unique,
    email varchar(255),
    marketing varchar(255) not null,
    cep varchar(255),
    endereco varchar(255),
    numero varchar(255),
    complemento varchar(255),
    bairro varchar(255),
    cidade varchar(255),
    uf char(2)
);

insert into clientes(nome,fone,marketing)
values('Gabriela','99999-1234','não');

select * from clientes;

-- foreign key(FK) Chave estrangeira que cria o relacionamento
-- do tipo 1-N com a tabela clientes
-- FK(pedidos)________PK(clientes)
-- Observação: Usar o mesmo nome e tipo de dados nas chaves (PK e FK)
create table pedidos (
	pedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    total decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)
);

-- abertura de pedido
insert into pedidos(idcli) values(1);

-- verificar pedido
select * from pedidos;

-- verificar pedidos junto com o nome do cliente
-- inner join (unir informações de 2 ou mais tabelas)
-- IMPORTANTE! Indicar as chaves FK e PK
select * from pedidos inner join clientes on pedidos.idcli = clientes.idcli;

-- verificar pedidos junto com o nome do cliente (relatório simplificado)
-- %H:%i exibir também o horário formatado
select
pedidos.pedido,
date_format(pedidos.dataped,'%d/%m/%Y - %H:%i') as data_ped,
clientes.nome as cliente,
clientes.fone
from pedidos inner join clientes
on pedidos.idcli = clientes.idcli;
 
 
 
 
 -- Tabela de apoio para criar um relacionamento do tipo M-M
-- (muitos para muitos) neste caso não criamos a chave primária
create table carrinho (
	pedido int not null,
    codigo int not null,
    quantidade int not null,
    foreign key(pedido) references pedidos(pedido),
	foreign key(codigo) references produtos(codigo)
);

insert into carrinho values (1,1,2);
insert into carrinho values (1,4,1);

select * from carrinho;

-- Exibir o carrinho
select pedidos.pedido,
carrinho.codigo as código,
produtos.produto,
carrinho.quantidade,
produtos.venda,
produtos.venda * carrinho.quantidade as sub_total
from (carrinho inner join pedidos on carrinho.pedido =
pedidos.pedido)
inner join produtos on carrinho.codigo = produtos.codigo;

-- total do pedido(carrinho) "fechamento"
select sum(produtos.venda * carrinho.quantidade) as total
from carrinho inner join produtos
on carrinho.codigo = produtos.codigo;

-- atualização do estoque
update carrinho
inner join produtos
on carrinho.codigo = produtos.codigo
set produtos.estoque = produtos.estoque - carrinho.quantidade
where carrinho.quantidade > 0;
