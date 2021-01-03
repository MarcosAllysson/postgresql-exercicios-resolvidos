-- CONVERTER TUDO PARA LETRAS MAIÚSCULA - UPPER(). Exemplo select nome from cliente where upper(nome) like '%E%';

-- 1. listar nome dos clientes começandos com letra 'B';
select nome from cliente where nome like 'B%'; -- seleciona cliente que começa com letra B

-- 2. listar nome dos clientes que tenham 'E' em seus nomes;
select nome from cliente where nome like '%e%'; -- seleciona cliente que tenha 'e' no meio do nome

-- 3. listar as descrições de ocorrencias com a palavra 'bateria'
select descricao from ocorrencia where descricao like '%bateria%'; -- seleciona descricao que tenha 'bateria' na descrição

-- 4. listar os clientes que possuem apenas 5 letras;
select nome from cliente where nome like '_____'; -- seleciona nome com 5 caracteres

-- 5. listar os carros com nome do fabricantes formado por 4 letras e terminado em t;
select fabricante from automovel where fabricante like '___t'; -- seleciona fabricante que tenha 4 letras terminando com t




-- 1. listar os clientes que idade seja 25, 30, 60 ordenado por nome
select nome from cliente where idade in (25, 30, 60) order by nome; -- seleciona cliente com idade entre as idades ordenado por nome

-- 2. listar os carros fabricados nos anos 2013 e 2019:
select modelo from automovel where anofab in(2013, 2019); -- seleciona os carros fabricados em 2013 ou 2019

-- 3. listar o modelo, ano e fabricante dos carros fabricados nos anos 2013, 2018 e 2019 da fabricante fiat ordenados por modelo
select modelo, anofab, fabricante from automovel where anofab in(2013, 2018, 2019) and fabricante = 'fiat' order by modelo;
-- seleciona modelo, ano e fabricando dos carros fabricandos em 2013, 2019 ou 2018 da fabricando fiat ordenado por modelo

-- 4. descreve uma tabela e elabore uma consulta usando os operadores in e link
select modelo from automovel where anofab in(2012, 2018) and modelo like 'p%'; -- seleciona modelo dos automoveis fabricado em 2012 ou 2018 com modelo que começa com a letra p


