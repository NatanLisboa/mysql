describe pessoas; -- é igual a:
desc pessoas; -- Ambos mostram os campos da tabela "pessoas"

-- Adição de uma nova coluna numa tabela
alter table pessoas
add column profissao varchar(10); -- Por padrão, a SQL cria uma coluna como sendo o último campo de uma tabela

-- Remoção de uma coluna
alter table pessoas
drop column profissao;

-- Adição de uma coluna em uma posição específica na tabela
alter table pessoas
add column profissao varchar(10) after nome; -- Não existe "before"

-- Adição de uma coluna como primeiro campo de uma tabela
alter table pessoas
add codigo int first; -- A palavra "column" é opcional para a adição de um campo (ou seja, coluna) numa tabela

-- Alteração da definição de um campo
alter table pessoas
modify column profissao varchar(20); -- Antes era varchar(10). Como por definição a SQL coloca "null" em um campo que acabou de ser criado, não é possível colocar a constraint "not null", a menos que algo seja inserido

alter table pessoas
modify column profissao varchar(20) not null default ''; -- Isso soluciona o problema do "not null", estabelecendo um padrão para profissão que, nesse caso, é uma cadeia de caracteres vazia

-- Renomeação de uma coluna
alter table pessoas
change column profissao prof varchar(20); -- alter table <nome da tabela> change *column* <nome atual do campo> <novo nome do campo> <tipo do campo>; * * = Opcional. O comando "change" também serve para modificar o tipo de um campo. Como não foi especificado "not null" e default '' nessa linha de comando, o campo perderá essas definições após a execução dessa linha de comando.

-- Renomeação de uma tabela
alter table pessoas
rename to gafanhotos;

create table if not exists cursos( -- Crie a tabela cursos se ela ainda não existir. Isso impede que uma tabela seja sobrescrita 
	nome varchar(30) not null unique, -- Unique não é chave primária. Essa constraint apenas impede a inserção de dados redundantes
    descricao text, -- Tipo "text": Tipo para textos longos
    carga int unsigned, -- Unsigned: Desconsidera o sinal do dado, impedindo que o usuário digite números negativos neste campo
    totaulas int unsigned,
    ano year default '2019' -- Se nada for inserido pelo usuário, a SQL preencherá este campo com a cadeia de caracteres '2019'.
) default charset = utf8; -- Permite a inserção de dados com caracteres especiais, como letras acentuadas, por exemplo.

-- Criando uma chave primária para a nova tabela
alter table cursos
add column idcurso int first;

alter table cursos
add primary key(idcurso); -- Define um campo já existente como chave primária da tabela

create table if not exists romarino(
	id int not null,
	nome varchar(100) default 'Romarino, o terror da porcada'
);

alter table romarino
add primary key (id);

alter table romarino
default charset utf8;

insert into romarino
values
(1, 'Ronaldo, brilhou muito no Corinthians');

desc romarino;

-- Exclusão de uma tabela com todos os seus dados
drop table if exists romarino; -- Apaga a tabela "romarino" se ela existir no banco de dados que está sendo utilizado no momento

-- Comandos DDL (de definição estrutural) vistos até agora:
-- CREATE DATABASE
-- CREATE TABLE
-- ALTER TABLE
-- DROP TABLE

-- Comandos DML (de manipulação de dados de tabelas) vistos até agora:
-- INSERT INTO