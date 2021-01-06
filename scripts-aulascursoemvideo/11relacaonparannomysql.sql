use cadastro;

-- Criação da tabela de relacionamento
create table if not exists gafanhoto_assiste_curso(
	idAssistirCurso int auto_increment,
    dataAssistiuCurso date, 
    idGafanhoto int, 
    idCurso int,
    primary key (idAssistirCurso),
    foreign key (idGafanhoto) references gafanhotos(id),
    foreign key (idCurso) references cursos(idcurso)
) default charset = utf8;

-- Inserindo dados na tabela de relacionamento
insert into gafanhoto_assiste_curso (dataAssistiuCurso, idGafanhoto, idCurso)
values
('2019-11-20', '1', '1'),
('2019-11-20', '1', '3'),
('2019-11-20', '2', '1'),
('2019-11-20', '2', '2'),
('2019-11-20', '3', '1'),
('2019-11-20', '3', '2'),
('2019-11-20', '3', '3');

-- Mostrando o nome do aluno com o curso respectivo o qual ele está fazendo usando a tabela de relacionamento
select g.nome, c.nome from gafanhotos g 
join gafanhoto_assiste_curso a
on g.id = a.idGafanhoto -- Relacionar gafanhotos com tabela de relacionamento
join cursos c
on c.idcurso = a.idCurso; -- Relacionar cursos com tabela de relacionamento