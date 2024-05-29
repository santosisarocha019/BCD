-- Criação do banco de dados
CREATE DATABASE IF NOT exists EmpresaDB;
USE EmpresaDB;

-- Cria a tabela Departamentos
CREATE TABLE IF NOT EXISTS Departamentos (
    DepartamentoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Localizacao VARCHAR(255)
);

-- Cria a tabela Funcionarios
CREATE TABLE IF NOT EXISTS Funcionarios (
    FuncionarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Sobrenome VARCHAR(255) NOT NULL,
    DepartamentoID INT,
    Salario DECIMAL(10, 2),
    DataDeEntrada DATE,
    Ativo BOOLEAN,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

-- Insere dados na tabela Departamentos
INSERT INTO Departamentos (Nome, Localizacao) VALUES
('TI', 'Andar 1'),
('RH', 'Andar 2'),
('Financeiro', 'Andar 3');

-- Insere dados na tabela Funcionarios
INSERT INTO Funcionarios (Nome, Sobrenome, DepartamentoID, Salario, DataDeEntrada, Ativo) VALUES
('João', 'Silva', 1, 5000.00, '2022-01-10', TRUE),
('Maria', 'Oliveira', 2, 4500.00, '2022-05-23', TRUE),
('Carlos', 'Santos', 1, 5500.00, '2023-03-15', FALSE),
('Ana', 'Costa', 3, 6000.00, '2023-07-01', TRUE),
('Pedro', 'Almeida', 2, 4000.00, '2022-09-09', TRUE),
('Fernanda', 'Machado', 3, 4700.00, '2023-02-11', TRUE),
('Lucas', 'Ferreira', 1, 5300.00, '2022-04-15', TRUE),
('Patricia', 'Barbosa', 2, 5000.00, '2023-01-20', TRUE),
('Rafael', 'Melo', 1, 4900.00, '2023-08-05', FALSE),
('Gabriela', 'Dias', 3, 6200.00, '2022-07-22', TRUE),
('Roberto', 'Lima', 2, 4000.00, '2023-03-18', FALSE),
('Clara', 'Azevedo', 1, 5800.00, '2023-05-29', TRUE),
('Eduardo', 'Pereira', 3, 4550.00, '2022-12-15', TRUE),
('Sofia', 'Martins', 2, 5150.00, '2023-04-01', TRUE),
('Andre', 'Gomes', 1, 5400.00, '2022-06-20', FALSE),
('Juliana', 'Rocha', 3, 5600.00, '2022-11-11', TRUE),
('Marcos', 'Silveira', 2, 5900.00, '2022-03-08', TRUE),
('Leticia', 'Monteiro', 1, 4700.00, '2023-02-21', TRUE),
('Tiago', 'Nunes', NULL, 6300.00, '2023-07-14', FALSE),
('Camila', 'Souza', 2, 4100.00, '2023-06-04', TRUE);


 -- Exercicio 1
select Nome, Salario, Salario+500 as salario_aumento from funcionarios;

-- Exercicio 2
SELECT Nome, AVG(salario) - salario AS diferenca
FROM funcionarios
GROUP BY Nome, salario;

-- Exercicio 3
select Nome , salario * 0.10 as valor_bonus
from funcionarios;

-- Exercicio 4
select Nome , salario / 12 as valor_parcelas
from funcionarios;

-- Exercicio 5
select Nome , salario 
from funcionarios
where salario / 500 = 100;

-- Exercicio 6
select Nome , DepartamentoID
from funcionarios
where DepartamentoID = 1;

-- Exercicio 7
select Nome , salario 
from funcionarios
where salario > 5000;

-- Exercicio 8
select Nome , DataDeEntrada 
from funcionarios
where year(DataDeEntrada)  < 2023;

-- Exercicio 9
select Nome , salario 
from funcionarios
where salario <= 4500;

-- Exercicio 10
select Nome , salario 
from funcionarios
where salario < 4000;

-- Exercicio 11
select Nome , DepartamentoID
from funcionarios
where DepartamentoID != 3;

-- Exercicio 12
select Nome , salario
from funcionarios
where salario > 4000 AND Ativo = 1;

-- Exercicio 13
select Nome , DepartamentoID, salario
from funcionarios
where salario >= 6000 Or DepartamentoID = 1;

-- Exercicio 14
select Nome , Ativo
from funcionarios
where Ativo = 0;

-- Exercicio 15
select Nome , salario
from funcionarios
where salario BETWEEN 4500 AND 5000;

-- Exercicio 16
select Nome , DepartamentoID
from funcionarios
where DepartamentoID = 1 or DepartamentoID = 2 or DepartamentoID = 3;

-- exercicio 17
select Nome 
from funcionarios
where Nome like 'A%';

-- Exercicio 18
select Nome , DepartamentoID
from funcionarios
where DepartamentoID is null;

-- Exercicio 19
select Nome , DepartamentoID
from funcionarios
order by DepartamentoID;

-- Exercicio 20
select funcionarios.Nome , departamentos.Nome, funcionarios.salario
from funcionarios
inner join departamentos on funcionarios.DepartamentoID = departamentos.DepartamentoID;
