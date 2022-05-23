/**
	Lojinha pets
    @autor Gabriela
*/



create database lojinhapets;
use lojinhapets;
create table produtos(
	codigo int primary key auto_increment,
    produto varchar(255) not null,
    quantidade int not null,
    valor decimal(10,2)
    );
    describe produtos;
    
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
  
    select * from produtos;
    
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
