-- 1 quantos clientes tem cadastrados:
select count(*) from cliente;

-- 2 quantos carros tem cadastrados:
select count(*) from automovel;

-- 3 quantas ocorrencias tem cadastrados:
select count(*) from ocorrencia;

-- 4 quantos clientes cadastrados com mais de 30 anos
select count(idade) from cliente where (idade > 30);

-- 5 Qual a soma de idade dos clientes cadastrados ?
select sum(idade) from cliente;

-- 6 Qual numero de carros cadastrados da fiat e da ford?
	-- Exibir o nome da fabricante e o numero de carros
select fabricante, count(modelo) from automovel group by fabricante;

-- 7 Qual cliente mais velho ?
select max(idade) as "Mais velho" from cliente;
select nome, idade from cliente where (idade = 60);

-- 8 Qual cliente mais novo ?
select min(idade) as "Mais novo" from cliente;
select nome, idade from cliente where (idade = 19);

-- 9 Qual carro cadastrado mais antigo de cada fabricante ?
	-- Exibir o nome da fabricante e o numero de carros
select fabricante, 
--min(anofab) as "Mais antigo",
count(modelo) as "Número de carros"
from automovel 
where anofab = 2016 or
	anofab = 2012
group by fabricante;

