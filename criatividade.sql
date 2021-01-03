-- criação da tabela
create table rockbands(
	cod serial primary key,
	nome varchar(30) not null,
	integrantes int not null,
	origem varchar(30) not null,
	qntmusicas int not null,
	grandessucessos int not null,
	grammy int not null,
	videoclipes int not null,
	faclube int not null,
	participacoestv int not null,
	lucroanual int not null
);

-- inserção dos valores na tabela
insert into rockbands values
	(default, 'AC DC', 4, 'Inglaterra', 200, 50, 3, 2250, 3, 120, 3000000),
	(default, 'Behemoth', 6, 'Irlanda', 300, 60, 3, 2450, 3, 73, 2000000),
	(default, 'Guns n Roses', 7, 'França', 400, 76, 4, 2150, 4, 12, 10000000),
	(default, 'Foo Fighters', 3, 'Inglaterra', 250, 2, 6, 7250, 360, 90, 3600000),
	(default, 'Rolling Stones', 2, 'Inglaterra', 2100, 102, 6, 150, 6, 94, 2800000),
	(default, 'Slipknot', 6, 'EUA', 201, 21, 5, 343, 1, 32, 90070000),
	(default, 'Queen', 9, 'Inglaterra', 432, 75, 4, 576, 5, 76, 15000000),
	(default, 'Pink Floyd', 8, 'França', 980, 123, 2, 552, 34, 43, 1000000),
	(default, 'Lez Zepellin', 4, 'Inglaterra', 99, 321, 1, 312, 8, 32, 900000),
	(default, 'Aerosmith', 6, 'França', 378, 34, 3, 444, 9, 12, 500000),
	(default, 'Metallica', 2, 'Inglaterra', 123, 45, 1, 114, 9, 53, 670000),
	(default, 'U2', 4, 'EUA', 781, 34, 1, 756, 1, 40, 3100000),
	(default, 'Black Sabbath', 4, 'EUA', 312, 86, 3, 321, 5, 24, 6913000),
	(default, 'The Who', 9, 'Inglaterra', 412, 98, 7, 221, 530, 77, 2576900),
	(default, 'Nirvana', 12, 'Inglaterra', 341, 91, 2, 322, 130, 15, 3000000),
	(default, 'Deep Purple', 3, 'Inglaterra', 234, 12, 3, 111, 65, 87, 3000210),
	(default, 'Eagles', 4, 'França', 543, 4, 3, 345, 6, 34, 303000),
	(default, 'The Doors', 6, 'Inglaterra', 234, 67, 4, 99, 8, 67, 120321),
	(default, 'Pearl Jam', 8, 'EUA', 166, 90, 2, 65, 1, 259, 413432),
	(default, 'Scorpions', 9, 'Inglaterra', 499, 11, 3, 321, 5, 70, 901232),
	(default, 'Red Hot Chilli Peppers', 3, 'Inglaterra', 520, 34, 3, 122, 6, 31, 9003211);
	
-- removendo uma entrada
delete from rockbands where cod = 10;
select * from rockbands;

-- atualizando uma tupla
update rockbands set nome = 'Aerosmith' where cod = 20;

-- order by
select * from rockbands order by nome; -- ordenando pelo nome
select nome, origem, grandessucessos as "Grandes Sucessos" from rockbands order by nome; -- nome, origem e grandes sucessos ordenados pelo nome

-- and e or
select nome as "Bandas de Rock" from rockbands where integrantes > 3 and integrantes < 7; -- banddas com integrantes entre 3 e 7
select nome, origem from rockbands where origem = 'Inglaterra' or origem = 'França' order by origem; -- bandas das inglaterra ou frança ordenado pela origem

-- distinct
select distinct origem from rockbands order by origem; -- origem das bandas
select distinct grammy from rockbands order by grammy; -- quantidade de grammies

-- operadores aritmeticos +, -, *, /
	-- simulando descont de 12%
select nome, lucroanual, lucroanual - (lucroanual*0.12) as "Preço Desconto Apresentação" from rockbands;
	-- simulando descont de 50%
select nome, lucroanual, lucroanual - (lucroanual*0.50) as "Preço Desconto Apresentação" from rockbands;

-- between
select * from rockbands where qntmusicas between 250 and 750 order by nome; -- bandas com músicas entre 250 e 750
select nome, origem, lucroanual from rockbands where lucroanual between 500000 and 999000 order by nome; -- bandas com lucro entre 500000 e 999000

-- like
select * from rockbands where upper(nome) like 'A%'; -- bandas que começam com a letra a
select * from rockbands where upper(nome) like '_____'; -- bandas com 5 caracteres

-- in
select * from rockbands where origem in('França', 'EUA') order by origem; -- bandas de origem francesa ou america ordenado pela origem
select nome, origem, grammy as "Grammies" from rockbands where grammy in(3, 7) order by grammy; -- bandas que ganharam 3 ou 7 grammies ordenado por grammy

-- not in
select nome, origem, qntmusicas, videoclipes from rockbands where origem not in('França', 'EUA') order by origem; -- bandas de origem não francesa e americana
select * from rockbands where grammy not in(3, 7) order by grammy; -- bandas que não ganharam 3 ou 7 grammies

-- count
select count(*) as "Número de bandas Cadastradas" from rockbands; -- quantiade de bandas cadastradas
select count(faclube) from rockbands where origem = 'Inglaterra'; -- quantidade de bandas da inglaterra

-- sum
select sum(grandessucessos) as "Grandes Sucessos" from rockbands where grammy > 4; -- soma dos grandes sucessos das bandas com grammies superior a 4
select sum(qntmusicas) as "Quantidade de Músicas" from rockbands; -- soma da quantidade de musicas

-- max
select max(participacoestv) as "Maior Participações na TV" from rockbands; -- maior aparições na tv
select max(lucroanual) as "Maior lucro anual" from rockbands; -- maior lucro anual

-- min
select min(qntmusicas) as "Banda com menor número de músicas" from rockbands; -- banda com menor número de musicas
select min(faclube) as "Menor Fã clube" from rockbands; -- menor fã clube

-- avg
select avg(lucroanual) as "Média dos lucros anuais" from rockbands; -- média do lucro anual
select avg(videoclipes) as "Médias de vídeos feitos por bandas" from rockbands; -- média de vídeos clipes feitos pelas bandas

-- group by
select origem, count(*) from rockbands group by origem; -- contagem das bandas agrupados pela origem
select integrantes, count(*) as "Quantidade de integrantes" from rockbands group by integrantes order by integrantes; -- soma da quantidade de integrantes agrupado pela quantidade de integrantes

-- having 
select grammy, count(*) from rockbands group by grammy having (grammy > 5); -- ordenação das bandas pela qnt de grammies, que tenham ganhado mais que 5 grammies 
select qntmusicas, count(*) from rockbands group by qntmusicas having (qntmusicas > 600); -- ordenando pelo quantidade de músicas, agrupado pelo quantidade quando o número de músicas for superior a 600
