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