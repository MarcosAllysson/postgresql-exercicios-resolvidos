-- questao 4 
create table ossosdoesqueleto(
	cod serial primary key,
	segmento varchar(30),
	regiao varchar(30),
	nomeosso varchar(30),
	quantidade int
);

-- criação da tabela osssosdoesqueleto
insert into ossosdoesqueleto values
(default, 'memb. Sup', 'Braço', 'Umero', 2),
(default, 'memb. Sup', 'Mão', 'falanges médias', 8),
(default, 'memb. Inf', 'Perna', 'Tíbia', 2);

-- a: qual comando sql pode ser utilizado para listar o nome e a regiao dos ossos com nome terminado com a letra a
select nomeosso, regiao from ossosdoesqueleto where nomeosso like '%a';

-- b: qual comando sql pode ser utilizado para listar as diferentes regioes cadastradas o banco e o numero de ossos (nomeosso) associados a cada regiao?
select regiao, count (quantidade) from ossosdoesqueleto group by regiao;

-- c: qual comando sql pode ser utilizado para listar a quantidade de ossos por regiao?
select sum (quantidade) from ossosdoesqueleto group by regiao;

-- d: qual comando sql pode ser utilizado para listar o numero de regioes por segmento?
select count (regiao) from ossosdoesqueleto group by (segmento);

-- e: qual comando sql pode ser utilizado para listar as regioes com mais de 10 ossos (quantidade)?
select regiao, sum(quantidade) from ossosdoesqueleto group by regiao having sum(quantidade) > 7;


-- questao 6
create table vendas(
	venda_id serial primary key,
	produto_id int,
	quantidade int,
	valor_unitario numeric
);

-- inserção dos dados na tabela vendas
insert into vendas values
	(default, 3, 2, 10.00),
	(default, 3, 5, 10.00),
	(default, 1, 3, 15.00),
	(default, 2, 2, 30.00),
	(default, 3, 10, 10.00);
	
-- questão: escreve uma consulta sql que apresente como resultado o valor total das vendas relacionado ao produto_id = 3
select sum (quantidade * valor_unitario) from vendas where produto_id = 3;





-- Exercício:
-- 1. Exibir o nome dos clientes cadastrados e o modelo dos carros associados a cada cliente
select nome, modelo from cliente, automovel where(cliente.codigo = automovel.codcliente);

-- 2. Exibir o modelo do carro e a descrição das ocorrências associadas a cada modelo
select modelo, descricao from automovel, ocorrencia where (automovel.codcliente = ocorrencia.numero);

-- 3. Exibir o nome dos clientes cadastrados e o numero de carros que ele possui
select nome as "Cliente", count(modelo) as "Número de Carros" from cliente, automovel where (cliente.codigo = automovel.codcliente) group by nome;

-- 4. Exibir o nome dos clientes e as ocorrências associadas a cada cliente
select nome, descricao from cliente, ocorrencia where (cliente.codigo = ocorrencia.numero);

-- 5. Criar uma consulta ao banco
	-- exibindo nome, cidade, modelo, fabricante, descricao, das 3 tables, onde há atributos em comum
select nome, cidade, modelo, fabricante, descricao from cliente, automovel, ocorrencia where(cliente.codigo = automovel.codcliente and automovel.codcliente = ocorrencia.numero);

-- numero de ocorrencia por cliente
select nome as "Cliente", count(descricao) as "Número de ocorrências" from cliente, ocorrencia, automovel 
where (automovel.placa = ocorrencia.autoplaca) and automovel.codcliente = cliente.codigo 
group by codigo;
