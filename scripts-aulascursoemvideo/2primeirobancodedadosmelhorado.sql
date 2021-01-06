create database cadastro default character set utf8 default collate utf8_general_ci; -- Cria um banco de dados com uma codificação de caracteres utf8, que contempla a acentuação das linguagens latinas

create table pessoas(
	id int not null auto_increment,
	nome varchar(100) not null, 
    nascimento date,
    sexo enum('M','F'), -- enum: Define os valores que podem ser colocados na variável
    peso decimal(5,2),
    altura decimal(3,2),
    nacionalidade varchar(20) default 'Brasil', -- Como este campo não é "not null", caso nada seja digitado, este campo será preenchido com "Brasil", por padrão
    primary key (id)
) default charset = utf8;