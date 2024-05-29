use escola_isabela;

INSERT INTO professor (nome, email, senha) values
('João Silva', 'joao@example.com', '123456');
INSERT INTO professor (nome, email, senha) values
('marcia', 'marcia@example.com', '123456');
INSERT INTO professor (nome, email, senha) values
('lindomar', 'lindomaro@example.com', '123456');

INSERT INTO turma (numero, nome, id_professor)values
("T01", "Matemática Avançada", 3);

INSERT INTO turma (numero, nome, id_professor)values
("T02", "Matemática basico", 2);

INSERT INTO atividade (numero, descricao, id_turma)values
("A001", "Prova de Matemática", 2);

INSERT INTO professor (nome, email, senha) values
('Ana Oliveia', 'ana@example.com', 'senha123');

INSERT INTO turma (numero, nome, id_professor)values
("T02", "Física Experimental", 4);

select * from professor where  id_professor = 1;

select 
turma.*,
professor.nome
from turma
inner join professor on turma.id_professor = professor.id_professor;

select turma.nome, 
atividade.*
from turma
inner join atividade on atividade.id_turma = turma.id_turma;

UPDATE professor 
SET email = "carlos@example.com"
WHERE id_professor = 2;

UPDATE turma 
SET nome = "Inglês Intermediário"
WHERE id_turma = 3;

UPDATE atividade 
SET descricao = "Trabalho de Laboratório"
WHERE id_atividade = 1;

UPDATE professor 
SET senha = "meudeisenha"
WHERE email = "joao@example.com";

UPDATE turma 
SET nome = "Química Orgânica"
WHERE id_turma = 3;

DELETE FROM turma
WHERE  id_turma = 3;

DELETE FROM professor 
WHERE  email = "ana@example.com";


DELETE FROM turma
WHERE  id_turma = 1;

DELETE FROM atividade
WHERE  id_atividade = 4;

select * from professor;
select * from atividade;
select * from turma;











