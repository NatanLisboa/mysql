-- Regras ACID de transação (mudança) de estado do Banco do Dados 
-- Atomicidade: Ou tudo é executado ou nada é executado e o banco volta ao estado anterior (mais estável)
-- Consistência: Um banco de dados que estava consistente antes da transação tem que continuar consistente após a transação. Se isso não acontecer, o banco volta imediatamente ao estado anterior
-- Isolamento: Se houver duas transações acontecendo, elas devem acontecer de forma isolada, ou seja, uma não pode afetar a outra.
-- Durabilidade: Uma transação deve manter a integridade dos dados ou os dados em si, ou seja, ela deve ser durável.

-- Engines: Mecanismos que servem para a criação de tabelas

-- Engines que suportam as regras ACID e garantem a integridade referencial:
-- InnoDB
-- XtraDB

use cadastro;
describe gafanhotos;
desc cursos;

-- Adicionando a chave estrangeira (chave primária de curso) na tabela gafanhotos
alter table gafanhotos 
add column cursopreferido int;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso); 

select * from gafanhotos;
select * from cursos;

-- Adicionando um curso preferido a um aluno
update gafanhotos set cursopreferido = 6 where id = 1; -- Também é possível alterar os dados na própria tabela criada por um select, clicando no campo em que se quer alterar, digitando o novo valor e, em seguida, clicando em "Apply".

-- A partir de agora, não é mais possível apagar o curso 6 da base de dados sem antes "desferenciar" os alunos que preferem esse curso, por questões de integridade referencial.
-- Integridade referencial: Uma chave estrangeira de uma tabela tem que necessariamente fazer referência à chave primária da outra tabela. 

-- Entretanto, ainda é possível deletar um curso que não está sendo referenciado por nenhuma tupla da outra tabela
delete from cursos
where idcurso = 29;

-- Juntando campos de duas tabelas diferentes (INNER JOIN)
select nome, cursopreferido from gafanhotos;
select nome, ano from cursos;

select gafanhotos.nome, cursos.nome, cursos.ano 
from gafanhotos join cursos
on cursos.idcurso = gafanhotos.cursopreferido -- Ligação da chave primária da tabela curso (idcurso) com a chave estrangeira da tabela gafanhotos (cursopreferido)
order by gafanhotos.nome;

-- Dar nomes personalizados para as tabelas
select Alunos.nome, CursoEscolhido.nome, CursoEscolhido.ano
from gafanhotos as Alunos inner join cursos as CursoEscolhido -- Inner Join = Join. select <nomepersonalizado>.<campo> from <nomeoriginal> as <nomepersonalizado>. "inner" opcional
on CursoEscolhido.idcurso = Alunos.cursopreferido;

-- O Inner Join (ou apenas Join) só mostra os registros da tabela gafanhoto que tem relação com a chave primária da tabela curso

-- Mostrar todas colunas da tabela da esquerda do join e as colunas da tabela da direita do join que têm relação com a tabela da esquerda através da chave primária/estrangeira (LEFT JOIN)
select g.nome, c.nome, c.ano
from gafanhotos as g left outer join cursos as c -- "as" e "outer" opcionais 
on g.id = c.idcurso
order by g.nome;

-- Mostrar todas colunas da tabela da direita do join e as colunas da tabela da esquerda do join que têm relação com a tabela da direita através da chave primária/estrangeira (RIGHT JOIN)
select g.nome, c.nome, c.ano
from gafanhotos g right join cursos c -- "as" e "outer" opcionais 
on g.id = c.idcurso
order by g.nome;
