-- Select (Parte 1)
-- Filtrar todos os campos presentes em uma tabela
select * from cursos;
select * from gafanhotos;

-- Filtrar todos os campos presentes em uma tabela, estando em alguma ordem
select * from cursos
order by nome; -- Por padrão, a SQL ordena de maneira ascendente, isto é, do menor para o maior. Pode ser colocado o sufixo "asc" depois do campo no qual a ordenação é baseada, mas é opcional.alter

select * from cursos
order by nome desc; -- Exibe os registros ordenados pelo nome de maneira descendente, ou seja, de Z a A

-- Filtrar colunas de uma tabela
select nome, carga, ano from cursos
order by nome; -- A ordem de escrita deterrmina a ordem em que a exibição será feita. Nesse caso, será exibido os campos "nome", "carga", "ano".

select ano, nome, carga from cursos
order by ano;

select ano, nome, carga from cursos
order by ano, nome; -- Ano: 1ª prioridade de ordenação. Se existirem registros com anos iguais, a SQL passará a os ordenar pelo nome, nesse caso.

-- Filtrar linhas (tuplas)
select * from cursos
where ano = '2016'
order by nome;

-- Filtrar colunas de linhas específicas
select nome, carga from cursos
where ano <= '2015' -- A constraint "where" é compatível com todos os operadores relacionais
order by nome;

-- Filtrar registros entre intervalos específicos (BETWEEN E AND)
select * from cursos
where ano between '2014' and '2016';

select nome, ano from cursos
where ano between '2014' and '2016'
order by ano desc, nome asc; -- Ordenação com ano "decrescente" e nome "crescente"

-- Filtrar registros com valores específicos (IN)
select nome, descricao, ano from cursos
where ano in (2014, 2016)
order by nome;

-- Filtrar registros utilizando operadores lógicos
select nome, carga, totaulas from cursos 
where carga > 35 and totaulas < 30
order by nome;

select nome, carga, totaulas from cursos 
where carga > 35 or totaulas < 30
order by nome;

-- Select (Parte 2)
-- Filtrar registros através de algumas letras ou cadeia de caracteres
select * from cursos
where nome like 'p%'; -- Filtre todos os campos da tabela cursos que tiverem o nome começando com "P". O "%" é um caractere coringa, que pode representar nenhum ou vários caracteres

select * from cursos
where nome like '%a'; -- Filtre todos os campos da tabela cursos que tiverem o nome terminando com "A".alter

select * from cursos
where nome like '%a%'; -- Filtre todos os campos da tabela cursos que tiverem "A" no nome. Se houver um somente um "A" acentuado no nome do curso, o MySQL irá filtrar, mas não são todos os SQLs que fazem isto. 

select * from cursos
where nome not like '%a%'; -- Filtra todos os campos que não tem A

select * from cursos
where nome like 'ph%p'; -- Filtra todos os campos da tabela "cursos" que comecem com "PH" e terminem com "p"

select * from cursos
where nome like 'html_'; -- A wildcard "_" exige que o registro tenha algum caractere depois de "html" para ser filtrado. Diferentemente da wildcard "%", o "_" não filtraria os registros com "html" apenas. Cada "_" representa um caractere.

-- Filtrar registros distintos
select distinct nacionalidade from gafanhotos; -- O "distinct" desconsidera repetições nos dados das colunas em sua filtragem

-- Funções de agregação
-- Funcão count
select count(*) from cursos; -- A função count retorna quantas ocorrências foram encontradas. Nesse caso, ela retornou quantas tuplas foram encontradas, pois foi ordenada a busca de todos os campos.
select count(*) from cursos where carga > 40; -- Quantos registros posuem a carga maior que 40 horas
select count(nome) from cursos where carga > 40; -- Quantos "nomes" existem onde a carga do curso é maior que 40 horas.alter

-- Função MAX
select max(carga) from cursos order by carga; -- Qual é a maior carga horária encontrada nos registros da tabela "cursos"
select max(carga) from cursos where ano = '2016' order by carga; -- Qual é a maior carga encontrada nos cursos do ano de 2016

select distinct carga from cursos order by carga desc; -- Teste da veracidade da função "MAX"
select distinct carga from cursos where ano = '2016' order by carga desc;

-- Função MIN
select min(carga) from cursos order by carga; -- Qual é a menor carga horária encontrada nos registros da tabela "cursos"
select min(carga) from cursos where ano = '2016' order by carga; -- Qual é a menor carga encontrada nos cursos do ano de 2016

select distinct carga from cursos order by carga; -- Teste da veracidade da função MIN

-- Função SUM
select sum(totaulas) from cursos where ano = '2016'; -- A função SUM, como o próprio nome sugere, soma os valores encontrados nos registros, considerando os valores do campo que foi passado como parâmetro. Nesse caso, a função sum está fazendo a soma do total de aulas dos registros que têm ano = '2016'

-- Função AVG
select avg(totaulas) from cursos where ano = '2016'; -- A função AVG (abreviação para average, média em inglês) retorna a média dos valores encontrados nos registros, considerando os valores do campo que foi passado como parâmetro. Nesse caso, a função avg está calculando a média do total de aulas dos registros que têm ano = '2016'

-- Exercícios
-- Exercício 1: Uma lista com o nome de todas as gafanhotas
select nome from gafanhotos where sexo = 'F';

-- Exercício 2: Uma lista com os dados de todos aqueles que nasceram entre 01/01/2000 e 31/12/2015
select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31';

-- Exercício 3: Uma lista com o nome de todos os homens que trabalham como programadores
select nome from gafanhotos where sexo = 'M' and profissao = 'Programador'; 

-- Exercício 4: Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra "J"
select * from gafanhotos where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%';

-- Exercício 5: Uma lista com o nome e nacionalidade de todos os homens que têm "Silva" no nome, não nasceram no Brasil e pesam menos de 100 kg;
select nome, nacionalidade from gafanhotos where sexo = 'M' and nome like '%silva%' and nacionalidade <> 'Brasil' and peso < '100';

-- Exercício 6: Qual é a maior altura entre gafanhotos homens que moram no Brasil
select max(altura) from gafanhotos where sexo = 'M' and nacionalidade = 'Brasil';

-- Exercício 7: Qual é a média de peso dos gafanhotos cadastrados
select avg(peso) from gafanhotos;

-- Exercício 8: Qual é o menor peso entre as gafanhotos mulheres que nasceram fora do Brasil e entre 01/01/1990 e 31/12/2000
select min(peso) from gafanhotos where sexo = 'F' and nacionalidade <> 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

-- Exercício 9: Quantas gafanhotas mulheres têm mais de 1,90 de altura
select count(*) from gafanhotos where sexo = 'F' and altura > 1.90;


-- Select (parte 3) - Agrupamento de registros (GROUP BY E HAVING)
select carga from cursos group by carga; -- Apesar de esse resultado ser igual ao do select distinct, o distinct considera apenas uma ocorrência, e o group by agrupa as ocorrências

select distinct carga, count(nome) from cursos; 
select carga, count(nome) from cursos group by carga; -- O "group by", nesse caso, faz com que a SQL conte quantos nomes existem dentro de cada agrupamento de carga. Ex.: Existem 4 nomes de cursos que possuem carga '5'

select ano, count(nome) from cursos where totaulas = 30
group by ano; -- Filtre os campos ano e a contagem dos nomes presentes em cada ocorrência de ano (group by ano) onde o total de aulas = 30

select carga, count(nome) from cursos
group by carga
having count(nome) > 3 -- Filtre apenas a carga e a quantidade de nomes da tabela cursos que tenha como resultado do agrupamento de cursos por carga (representado pela quantidade de nomes) um valor maior que 3. Portanto, o Workbench só irá exibir as cargas que tenham mais de 3 ocorrências que, no caso, são 5 e 40 horas. O having só pode ter aqueles campos que foram descritos no agrupamento, ou seja, os que foram agrupados
order by count(nome) desc;

select carga, count(*) from cursos
where ano > 2000
group by carga
having count(*) >= 2; -- Filtra a carga e a quantidade de registros da tabela cursos onde o ano for maior que 2000, agrupando as ocorrências por carga e mostrando somente aquelas cargas em que as ocorrências forem maiores que 0;

-- Agrupamento com um select dentro do outro
select count(*), carga from cursos
group by carga
having carga > (select avg(carga) from cursos);

-- Exercícicio 1: Uma lista com as profissões dos gafanhotos e as ocorrências destas profissões
select profissao, count(*) from gafanhotos
group by profissao
order by count(*) desc; 

-- Exercício 2: Quantos gafanhotos homens e quantas mulheres nasceram após 01/01/2005
select sexo, count(*) from gafanhotos
where nascimento > '01/01/2005'
group by sexo;

-- Exercício 3: Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá. Só nós interessam os países que tiverem mais de 3 gafanhotos com essa nacionalidade
select nacionalidade, count(*) from gafanhotos 
where nacionalidade <> 'Brasil'
group by nacionalidade
having count(*) > 3
order by count(*) desc;

-- Exercício 4: Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100 kg e que estão acima da média de altura de todos os cadastrados
select altura, count(*) from gafanhotos where peso > '100'
group by altura
having altura > (select avg(altura) from gafanhotos);


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

-- Comandos DQL (pesquisa de dados) vistos até agora:
-- SELECT
