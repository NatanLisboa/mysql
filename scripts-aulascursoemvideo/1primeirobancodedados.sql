create database cadastro;

use cadastro;

create table pessoas(
	nome varchar(30), 
    idade tinyint(3),
    sexo char(1),
    peso float,
    altura float,
    nacionalidade varchar(20)
);

describe pessoas; -- Exibe os campos da tabela "pessoas", com seus respectivos tipos