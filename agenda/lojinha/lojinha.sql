/**
  dados da lojinha 
  @Gabriela
*/

-- Verificar banco de dados
show databases;
-- Criar um novo banco de dados 
create database teste;
create database lojinhagabriela;
-- Excluir um banco de dados 

-- Excluir um banco de dados 
drop database teste;

-- Selecionar o baco de dados 
use lojinhagabriela;

create table produtos(
	id int primary key auto_increment,
    nome varchar(255) not null,
	estoque varchar(255) not null,
    preco varchar(255)
    
);

 -- verificar tabela de banco 
 show tables;
 
 -- descrever a tbela;
 describe produtos;
 
 -- adicionando uma coluna (campo)a tabela
 alter table produtos add column obs varchar(255);
 
 -- adicionando uma coluna (campo)a tabela
 alter table produtos add column  fone2 varchar(255);
 

 -- excluir uma coluna (campo) da tabela
 alter table produtos drop column obs;
 
  -- excluir a tabela
 drop table produtos;
 
  -- excluir a tabela
 drop table produto;