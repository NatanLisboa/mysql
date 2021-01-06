insert into cursos values 
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programação', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHP para iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução à Linguagem Java', '10', '29', '2000'),
('6', 'MySQL', 'Bancos de Dados MySQL', '30', '15', '2016'),
('7', 'Word', 'Curso completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer Kibe', '40', '30', '2018'),
('10', 'Youtuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

-- Modificando linhas incorretas
-- Linha (Tupla) 1
update cursos 
set nome = 'HTML5'
where idcurso = 1; -- Atualize o campo nome das tuplas da tabela curso que tiverem o campo idcurso = 1, inserindo no campo "nome" destas tuplas a cadeia de caracteres "HTML5"

-- Linha 4 - Modificando dois campos de um registro ao mesmo tempo
update cursos
set nome = 'PHP', ano = '2015'
where idcurso = 4;

-- Linha 5
update cursos
set nome = 'Java', carga = '40', ano = '2015'
where idcurso = 5
limit 1; -- Com essa linha de comando, estamos dizendo ao SQL que, no máximo, uma linha pode ser modificada 

-- Modificações em várias tuplas (não recomendado e barrado pelo próprio Workbench por motivos de segurança)
update cursos
set ano = '2050'
where ano = '2018';

-- Modificação em uma tupla sem a comparação com a chave primária
update cursos
set ano = '2018'
where ano = '2050'
limit 1;

-- Exclusão de uma tupla (registro)
delete from cursos
where idcurso = '8'; -- Delete da tabela cursos as tuplas que tiverem o campo idcurso = 8

-- Exclusão de várias tuplas (não recomendado e barrado pelo "safe mode" do Workbench)
delete from cursos
where ano = '2050';

-- Exclusão de todas as tuplas (registros) de uma tabela
truncate table cursos; -- ou apenas:
truncate cursos;

select * from cursos;

-- Comandos DDL (de definição estrutural) vistos até agora:
-- CREATE DATABASE
-- CREATE TABLE
-- ALTER TABLE
-- DROP TABLE

-- Comandos DML (de manipulação de dados de tabelas) vistos até agora:
-- INSERT INTO
-- UPDATE
-- DELETE
-- TRUNCATE
