create database if not exists senaiBank;
use senaiBank;

CREATE TABLE IF NOT EXISTS Endereco (
    id int auto_increment primary key,
    cep int,
    numero_casa int,
    bairro varchar(100),
    estado varchar(100),
    rua varchar(100)
);

CREATE TABLE IF NOT EXISTS Cliente(
	id int auto_increment primary key,
    nome varchar(255),
    cpf int,
    email varchar(255),
    telefone int,
    enderecoFK int,
    FOREIGN KEY (enderecoFK) REFERENCES Endereco(id)
);

CREATE TABLE IF NOT EXISTS Conta(
	id int auto_increment primary key,
	tipo varchar(100),
    status boolean,
    clienteFK int,
    valor float,
    FOREIGN KEY (clienteFK) REFERENCES Cliente(id)    
);

CREATE TABLE IF NOT EXISTS Cartao(
	id int auto_increment primary key,
	numero int,
    data_validade date,
    cod_seguranca int,
    status boolean,
    ContaFK int,
    FOREIGN KEY (  ContaFK) REFERENCES Conta(id)    
);


CREATE TABLE IF NOT EXISTS tipo(
	id int auto_increment primary key,
    nome varchar(255)    
);

CREATE TABLE IF NOT EXISTS CartaoTipo(
	id int auto_increment primary key,
	cartaoFK int,
	tipoFK int,
	FOREIGN KEY (cartaoFK) REFERENCES Cartao(id),   
	FOREIGN KEY (tipoFK) REFERENCES tipo(id)   
);

CREATE TABLE IF NOT EXISTS Transacao(
	id int auto_increment primary key,
    tipo varchar(200),
    data_hora datetime,
    conta_enviouFK int,
    conta_recebeuFK int,
    FOREIGN KEY (conta_enviouFK) REFERENCES Conta(id),   
	FOREIGN KEY (conta_recebeuFK) REFERENCES Conta(id)       

);

CREATE TABLE IF NOT EXISTS Investimento(
	id int auto_increment primary key,
    nome varchar(200),
    riscos varchar(200),
    retorno float
);

CREATE TABLE IF NOT EXISTS ClienteInvestiu(
	id int auto_increment primary key,
    clienteFK int,
    investimentoFK int,
    valor float,
    data date,
    FOREIGN KEY (clienteFK) REFERENCES Cliente(id),  
    FOREIGN KEY (investimentoFK) REFERENCES Investimento(id)
);



