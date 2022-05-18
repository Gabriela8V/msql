/**
   Agenda de contatos
   @autor Gabriela
*/

-- Verificar bancos de dados
show databases;

-- Criar um novo banco de dados 
create database teste;
create database agendagabriela;
-- Excluir um banco de dados 
drop database teste;

-- Selecionar o baco de dados 
use agendagabriela;
-- Criando uma tabela
-- int; (tipos de dados -números inteiros
-- dicimal(10,2) -> tipo de números não inteiros
-- (10,2) 10 digitos com 2 casas decimais
-- primary key(transforma o campo em chave primaria)
-- auto_increment (numeração automatica)
-- varchar (255) -> tipo de dado string (com variação)
-- char(255) tipo de dados string (sem variação) 
-- (255) -> maximos de caracter
-- not null (obrigarorio o preenchimento)


create table contatos(
	id int primary key auto_increment,
    nome varchar(255) not null,
    fone varchar(255) not null,
    email varchar(255)
    );
 -- verificar tabela de banco 
 show tables;
 
 -- descrever a tbela;
 describe contatos;   
 
 -- adicionando uma coluna (campo)a tabela
 alter table contatos add column obs varchar(255);
 -- adicionar uma columa (campo) a tabela
 alter table contatos add column fone2 varchar(255);
  -- adicionar uma columa (campo) a tabela
 alter table contatos add column cel varchar(255) after fone;
 
 -- modificando uma propriedade ta tabela
 alter table contatos modify column cel varchar(255) not null;
 
 -- excluir uma coluna (campo) da tabela
 alter table contatos drop column obs;

 -- excluir a tabela
 drop table contatos;