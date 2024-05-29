USE EmpresaDB;

-- exercicio1
select now();

-- exercicio2
select curdate();

-- exercicio3
select nome, DataDeEntrada
from funcionarios
where day(DataDeEntrada)=15;

-- exercicio4
select nome, datediff(curdate(),DataDeEntrada)as "tempo"
from funcionarios;

-- exercicio5
select nome, abs(Salario - avg(Salario))  as diferença
from funcionarios
GROUP BY Nome, salario;

-- exercicio6
select nome, round(salario, 0)
from funcionarios;

-- exercicio7
select nome, ceiling(salario)
from funcionarios;

-- exercicio8
select nome, floor(salario)
from funcionarios;

-- exercicio9
select nome, char_length(nome)
from funcionarios;

-- exercicio10
select upper(nome)
from funcionarios;

-- exercicio11
select lower(nome)
from funcionarios;

-- exercicio12
select concat(Nome, " ",Sobrenome) as "nome interio"
from funcionarios;

-- exercicio13
select count(*) as "total de funcionario"
from funcionarios
where ativo = true;

-- exercicio14
select sum(salario) as "total de salario"
from funcionarios
where ativo = true;

-- exercicio15
select avg(salario) as "salario media"
from funcionarios
where DepartamentoID = 1;

-- exercicio16
select max(salario) as "maior salario"
from funcionarios;

-- exercicio17
select min(salario) as "maior salario"
from funcionarios