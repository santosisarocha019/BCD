-- Criação do banco de dados
CREATE DATABASE IF NOT exists RedeSocial;
USE RedeSocial;

-- Cria a tabela perfil
CREATE TABLE IF NOT EXISTS Perfil (
    PerfilID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL
);

-- Cria a tabela usuario
CREATE TABLE IF NOT EXISTS Usuario (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Data_nascimento date NOT NULL,
    Endereco varchar(255),
    Email varchar(255) NOT NULL,
    Nome_usuario varchar(255),
    Senha varchar(255) NOT NULL,
    PerfilID int NOT NULL,    
    FOREIGN KEY (PerfilID) REFERENCES Perfil(PerfilID)
);

-- Cria a tabela amizade
CREATE TABLE IF NOT EXISTS Amizade (
    AmizadeID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID int NOT NULL, 
    AmigoID int NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (AmigoID) REFERENCES Usuario(UsuarioID)
    
);

-- Cria a tabela categorias
CREATE TABLE IF NOT EXISTS Categorias (
    CategoriasID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL    
);

-- Cria a tabela atividade
CREATE TABLE IF NOT EXISTS Atividades (
    AtividadeID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Data_inicio date NOT NULL,
    Data_final date NOT NULL,
    CategoriasID int NOT NULL,    
    FOREIGN KEY (CategoriasID) REFERENCES Categorias(CategoriasID)
);

-- Cria a tabela comentario
CREATE TABLE IF NOT EXISTS Comentario (
    ComentarioID INT AUTO_INCREMENT PRIMARY KEY,
    AtividadeID int NOT NULL, 
    Usuario_principal_ID int NOT NULL,
    Usuario_comentado_ID int NOT NULL,
    FOREIGN KEY (AtividadeID) REFERENCES Atividades(AtividadeID	),
    FOREIGN KEY (Usuario_principal_ID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (Usuario_comentado_ID) REFERENCES Usuario(UsuarioID)
    
);

-- Cria a tabela de relacionamento usuario_atividade
CREATE TABLE IF NOT EXISTS Usuario_atividade (
    Usuario_atividadeID INT AUTO_INCREMENT PRIMARY KEY,
    AtividadeID int NOT NULL, 
    UsuarioID int NOT NULL,
    FOREIGN KEY (AtividadeID) REFERENCES Atividades(AtividadeID	),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID)    
);

-- Insere dados na tabela Perfil
INSERT INTO Perfil (Nome) VALUES
('Estudante'),
('Administrador');

-- Insere dados na tabela Perfil
INSERT INTO Usuario (Nome, Data_nascimento, Endereco, Email, Nome_usuario, Senha, PerfilID) VALUES
('Isabela', '2004-09-10', 'campinas-sp', 'santosisabelarocha@gmail.com', '@isa_rocha', '1234567', 2),
('Ana Beatriz', '2005-04-15', 'campinas-sp', 'Beatrizana@gmail.com', '@bea_torrecilas', '1234567', 1),
('Adailton', '2006-10-15', 'campinas-sp', 'filhoadaiton@gmail.com', '@adans_filho', '1234567', 1),
('Isabela', '2004-07-13', 'campinas-sp', 'leiteisabela@gmail.com', '', '1234567', 2),
('Murilo', '2006-03-12', 'campinas-sp', 'santosmurilosilva@gmail.com', '@mu_santos', '1234', 1);


INSERT INTO Amizade (UsuarioID, AmigoID) VALUES
(1,5),
(1,2),
(2,3),
(2,4),
(1,4);

INSERT INTO Categorias (Nome) VALUES
('esporte'),
('tecnologia'),
('ciencia'),
('fisica'),
('humanas');

INSERT INTO Atividades (Nome, Descricao, Data_inicio, Data_final, CategoriasID) VALUES
('Aula de ds', 'aula de ds no senai gratuido para jovens ate 20 anos ', '2024-05-10', '2024-06-10', 2),
('Aula de bioquimica', 'aula de bioquimica no cotuca ', '2025-02-12', '2026-12-20', 3),
('Aula de eletronica', 'aula de eletronica no senai', '2025-01-20', '2026-12-20', 4),
('Aula de principios de direito', 'Aula de principios de direito na unicamp', '2024-05-20', '2024-05-27', 5),
('Aula de volei', 'aula de volei no sesi gratuido nos periodo tarde e noite ', '2024-07-30', '2024-08-24', 1);

INSERT INTO Comentario (AtividadeID, Usuario_principal_ID, Usuario_comentado_ID ) VALUES
(1, 1, 4),
(1, 1, 3),
(1, 1, 2),
(4, 1, 5),
(5, 2, 1);

INSERT INTO Usuario_atividade (AtividadeID, UsuarioID) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(4, 5);


select A.Nome , A.Descricao 
from Atividades A
left join Comentario C on A.AtividadeID = C.AtividadeID
where C.ComentarioID is null;

select U.Nome, U.Email
from Usuario U
left join Usuario_atividade UA on U.UsuarioID = UA.UsuarioID
left join Atividades A on UA.AtividadeID = A.AtividadeID;

select A.Nome, A.Descricao, A.Data_inicio
from Atividades A
where month(A.Data_inicio) = 5;

select U.Nome , U.Email 
from Usuario U
left join Usuario_atividade UA on U.UsuarioID = UA.UsuarioID
left join Atividades A on UA.AtividadeID = A.AtividadeID
where  A.AtividadeID is null;

SELECT Endereco AS Cidade, COUNT(*) AS Quantidade_de_Usuarios
FROM Usuario
WHERE Endereco IS NOT NULL
GROUP BY Endereco;

SELECT C.Nome AS Nome_Categoria, COUNT(*) AS Quantidade_de_Atividades
FROM Atividades A
JOIN Categorias C ON A.CategoriasID = C.CategoriasID
GROUP BY C.Nome;

SELECT A.Nome AS Titulo_Atividade, COUNT(UA.UsuarioID) AS Quantidade_de_Participantes
FROM Atividades A
JOIN Usuario_atividade UA ON A.AtividadeID = UA.AtividadeID
GROUP BY A.Nome
ORDER BY COUNT(UA.UsuarioID) DESC
LIMIT 3;

SELECT U.Nome AS Nome_Usuario, COUNT(UA.AtividadeID) AS Quantidade_de_Atividades
FROM Usuario U
JOIN Usuario_atividade UA ON U.UsuarioID = UA.UsuarioID
GROUP BY U.UsuarioID
HAVING COUNT(UA.AtividadeID) >= 2;

SELECT U.Nome AS Nome_Usuario, A.Nome AS Titulo_Atividade, A.Data_inicio AS Data_Atividade
FROM Usuario U
JOIN Usuario_atividade UA ON U.UsuarioID = UA.UsuarioID
JOIN Atividades A ON UA.AtividadeID = A.AtividadeID
ORDER BY U.Nome ASC, A.Data_inicio DESC
LIMIT 5;

SELECT C.Nome AS Nome_Categoria, COUNT(A.CategoriasID) AS Total_de_Atividades
FROM Categorias C
LEFT JOIN Atividades A ON C.CategoriasID = A.CategoriasID
GROUP BY C.CategoriasID
ORDER BY Total_de_Atividades
LIMIT 1;

SELECT A.Nome AS Nome_Atividade, U.Nome AS Nome_Usuario
FROM Atividades A
LEFT JOIN Comentario C ON A.AtividadeID = C.AtividadeID
LEFT JOIN Usuario U ON C.Usuario_comentado_ID = U.UsuarioID
ORDER BY A.Nome;

SELECT A.Nome AS Titulo_Atividade, A.Descricao, U.Nome AS Nome_Usuario
FROM Atividades A
JOIN Usuario_atividade UA ON A.AtividadeID = UA.AtividadeID
JOIN Usuario U ON UA.UsuarioID = U.UsuarioID
JOIN Perfil P ON U.PerfilID = P.PerfilID
WHERE P.Nome = 'Administrador';







