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
  
  insert into produtos (produto,quantidade,valor)
  value ('ração',10,8.20);
    insert into produtos (produto,quantidade,valor)
  value ('casinha',10,15.10);
    insert into produtos (produto,quantidade,valor)
  value ('coleira',10,8.20);
    insert into produtos (produto,quantidade,valor)
  value ('potes',10,2.20);
    insert into produtos (produto,quantidade,valor)
  value ('escova/pente',10,8.20);
    insert into produtos (produto,quantidade,valor)
  value ('comedouro',10,6.20);
  insert into produtos (produto,quantidade,valor)
  value('caminha',2,20);
  
  drop table produtos;
  
    select * from produtos;
    
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
