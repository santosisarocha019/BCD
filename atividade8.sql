use bliblioteca_Isa;

select * from emprestimo;

select * from livro where  ISBN = "9780451524935";

select nome from autor where data_nascimento< '1965-01-01';

select biografia from autor where nome = "Franz Kafka";

select nome from usuario where membros = "premium";

select titulo from livro where id = '17';

select nome from autor where nome like 'J%';

select email from usuario where id = '5';

select titulo from livro where titulo like '% Pequeno %';

select inicio_data from usuario where nome like "Lucas %";

select id_livro from emprestimo where data_final > '2024-03-08';

select id from usuario where email = 'maria@example.com';

select * from usuario where inicio_data > '2023-09-01';

select * from autor where data_nascimento > '1901-03-01' and data_nascimento < '2000-03-01';

select * from usuario where inicio_data >'2023-07-01' and inicio_data <'2023-09-01';

select * from usuario where email = null;

select * from livro where CHARACTER_LENGTH(descricao)>50;










