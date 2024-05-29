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





