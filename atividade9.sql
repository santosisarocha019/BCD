use bliblioteca_Isa;
/*1*/
SELECT livro.id
from livro
inner join livro_autor on id_livro = livro.id
inner join autor on id_autor = autor.id
where livro.titulo = "Cem Anos de SolidãO";
/*2*/
SELECT livro.*
from livro
inner join livro_autor on id_livro = livro.id
inner join autor on id_autor = autor.id
where autor.nome = "Clarice Lispector";
/*3*/
SELECT categoria.nome as categoria, COUNT(livro.id) as quantos_livros_existem
FROM livro
INNER JOIN livro_categoria ON livro.id = livro_categoria.id_livro
INNER JOIN categoria ON categoria.id = livro_categoria.id_categoria
GROUP BY categoria.nome;
/*4*/
select autor.nome as autores, livro.titulo as livros
from livro
inner join livro_autor on id_livro = livro.id
inner join autor on id_autor = autor.id;
/*6*/
SELECT categoria.nome as categoria, COUNT(livro.id) as quantos_livros_existem
FROM livro
INNER JOIN livro_categoria ON livro.id = livro_categoria.id_livro
INNER JOIN categoria ON categoria.id = livro_categoria.id_categoria
GROUP BY categoria.nome
having count(livro.id) >1;

/*7*/
SELECT min(autor.data_nascimento) FROM autor;

/*8*/
SELECT MONTH(inicio_data) as mes, COUNT(*) as quantidade_de_usuarios
FROM usuario
WHERE YEAR(inicio_data) = 2024
GROUP BY MONTH(inicio_data);

 /*9*/
SELECT livro.id, livro.titulo, COUNT(emprestimo.id_livro) AS vezes_emprestado
FROM livro
LEFT JOIN emprestimo ON livro.id = emprestimo.id_livro
GROUP BY livro.id, livro.titulo
ORDER BY vezes_emprestado DESC
LIMIT 1;

SELECT livro.id, livro.titulo, IFNULL(COUNT(emprestimo.id_livro), 0) AS vezes_emprestado
FROM livro
LEFT JOIN emprestimo ON livro.id = emprestimo.id_livro
GROUP BY livro.id, livro.titulo
ORDER BY vezes_emprestado ASC
LIMIT 1;


/*10*/

SELECT AVG(DATEDIFF(CURRENT_DATE(), data_nascimento) / 365) AS idade_media_dos_autores
FROM autor;


/* 11*/
SELECT livro.id, livro.titulo
FROM livro
ORDER BY id DESC
LIMIT 3;


/*12*/
SELECT COUNT(*) AS total_emprestimos
FROM emprestimo
INNER JOIN usuario ON emprestimo.id_usuario = usuario.id
WHERE usuario.membros = 'premium';

/*13*/

SELECT autor.id, autor.nome, COUNT(livro_autor.id_livro) AS numero_de_livros
FROM autor
LEFT JOIN livro_autor ON autor.id = livro_autor.id_autor
GROUP BY autor.id, autor.nome;

/*14*/

SELECT c.nome AS categoria, COUNT(e.id_livro) AS numero_de_livros_emprestados
FROM categoria c
LEFT JOIN livro_categoria lc ON c.id = lc.id_categoria
LEFT JOIN emprestimo e ON lc.id_livro = e.id_livro
GROUP BY c.nome;

/*15*/

SELECT usuario.id, usuario.nome, COUNT(DISTINCT emprestimo.id_livro) AS numero_de_livros_unicos
FROM usuario
INNER JOIN emprestimo ON usuario.id = emprestimo.id_usuario
GROUP BY usuario.id, usuario.nome
ORDER BY numero_de_livros_unicos DESC
LIMIT 1;

/*16*/

SELECT AVG(DATEDIFF(data_final, inicio_data)) AS media_duracao_emprestimos
FROM emprestimo
WHERE data_final IS NOT NULL;

/*17*/

SELECT livro.id, livro.titulo
FROM livro
LEFT JOIN emprestimo ON livro.id = emprestimo.id_livro
WHERE emprestimo.id IS NULL;

/*18*/

SELECT categoria.nome AS categoria, COUNT(livro.id) AS numero_de_livros
FROM categoria
INNER JOIN livro_categoria ON categoria.id = livro_categoria.id_categoria
INNER JOIN livro ON livro_categoria.id_livro = livro.id
GROUP BY categoria.nome
ORDER BY numero_de_livros DESC
LIMIT 1;

/*19*/

SELECT AVG(livros_por_autor) AS media_de_livros_por_autor
FROM (
    SELECT id_autor, COUNT(id_livro) AS livros_por_autor
    FROM livro_autor
    GROUP BY id_autor
) AS livros_por_autor;

/*20*/

SELECT MONTH(inicio_data) AS mes, COUNT(*) AS total_emprestimos
FROM emprestimo
GROUP BY MONTH(inicio_data)
HAVING total_emprestimos > 10;

/*21*/

SELECT id, nome, data_nascimento
FROM autor
ORDER BY data_nascimento DESC
LIMIT 1;

/*22*/

SELECT *
FROM usuario
WHERE MONTH(usuario.inicio_data) = MONTH(usuario.data_registro);
