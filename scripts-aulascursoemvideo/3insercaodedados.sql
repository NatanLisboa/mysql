-- CREATE: Comando de definição (DDL)
use cadastro;

insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Godofredo', '1984-01-02', 'M', '78.5', '1.83', 'Brasil');

insert into pessoas 
(nome, nascimento, sexo, peso, altura, nacionalidade)
values 
('Maria', '1999-12-30', 'F', '55.2', '1.65', 'Portugal');
 
-- Inserindo a chave primária
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', DEFAULT);
-- Default no campo "id": Utiliza o padrão de inserção para definir o valor de id. Como o valor anterior de "id" foi 2, o próximo será 3 por conta do "auto_increment"
-- Default no campo "nacionalidade": Utiliza o padrão definido na criação do campo, que no caso, é "Brasil".

-- Se todos os campos irão ser inseridos e mesma ordem definida pela tabela, não é necessário informá-los
insert into pessoas
values
(DEFAULT, 'Adalgiza', '1930-11-2', 'F', '63.2', '1.75', 'Irlanda'); 

-- Um "INSERT INTO" para inserção vários registros
insert into pessoas
values
(DEFAULT, 'Ana', '1975-11-22', 'F', '52.3', '1.45', 'EUA'),
(DEFAULT, 'Pedro', '2000-07-15', 'M', '52.3', '1.45', 'Brasil'),
(DEFAULT, 'Maria', '1999-05-30', 'F', '75.9', '1.70', 'Portugal'); -- O término de múltiplas inserções é definido por um ponto e vírgula

-- Comando para verificar o conteúdo de uma tabela
select * from pessoas;