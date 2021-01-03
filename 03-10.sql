create table cliente(
	codigo serial primary key,
	nome varchar(200) not null,
	idade int not null,
	rg int not null,
	cpf int,
	telefone varchar(15),
	rua varchar(30),
	numero int,
	cep int default 79200000,
	cidade varchar(20) default 'Brasília',
	estado varchar(2) default 'DF'
);

create table automovel(
	placa varchar(8) primary key,
	renavam int,
	anofab int,
	fabricante varchar(10),
	modelo varchar(25),
	codCliente int references cliente(codigo) not null
);

create table ocorrencia(
	numero serial primary key,
	local varchar(50),
	descricao varchar(200),
	data date,
	autoPlaca varchar(8) references automovel(placa) not null
);

insert into cliente values 
	(default, 'Bruna', 25, 20700),
	(default, 'Anderson', 19, 130000),
	(default, 'Caio', 32, 1200),
	(default, 'Andre', 30, 1036000),
	(default, 'Rafael', 50, 6000000),
	(default, 'Lucas', 60, 90000);
	
insert into automovel values
	('aaa1111', 100000, 2016, 'fiat', 'palio', 1),
	('aaa2222', 200000, 2019, 'fiat', 'bravo', 1),
	('aaa3333', 500000, 2013, 'ford', 'focus', 2),
	('aaa4444', 30000, 2012, 'ford', 'ka', 3),
	('aaa5555', 3000, 2018, 'fiat', 'punto', 4);
	
insert into ocorrencia (descricao, autoPlaca) values
	('colisão lateral', 'aaa3333'),
	('pneu furou', 'aaa4444'),
	('bateria fraca', 'aaa2222'),
	('ligar pro guincho', 'aaa3333');

-- exercício:
-- 1. Listar	os	nomes	dos	Clientes
select nome from cliente;

-- 2. Listar	os	nomes	dos	Clientes	em	ordem	
select nome from cliente order by nome;

-- 3. Listar	nome	e	Cidade	dos	Cliente	ordenando	por	nome
select nome, cidade from cliente order by nome;

-- 4. Listar	todos	os	carros	(Modelo	e	placa)	ordenando	por	modelo
select modelo, placa from automovel order by modelo;

-- 5. Listar	todas	as	ocorrências	cadastradas
select descricao from ocorrencia;



-- exercicio:
-- 1. Listar	nome	e	RG	dos	clientes	que	moram	Brasilia
select nome, rg from cliente where cidade = 'Brasília';

-- 2. Listar	modelo	e	placa	dos	carros	da	fabricante	fiat ordenando	placa	
select modelo, placa from automovel where fabricante = 'fiat' order by placa;

-- 3. Listar	Clientes	com	mais	de	40	anos
select nome from cliente where(idade > 40);

-- 4. Listar	Clientes	com	menos	de	30	anos	
select nome from cliente where(idade < 30);




-- exercicio:
-- 1. Listar	nome	e	RG	dos	clientes	que	moram	Brasilia e	tem	mais	de	30	anos
select nome, rg from cliente where cidade = 'Brasília' and idade > 30;

-- 2. Listar	Clientes	com	idade	entre	30	e	40	anos
select nome from cliente where idade >= 30 and idade <= 40;

-- 3. Listar	modelo	dos	carros	fabricados	a	partir	de	2017	da	marca	fiat
select modelo from automovel where fabricante = 'fiat' and anofab > '2017';

-- 4. Monte	uma	consulta	para	o	banco	seguradora	usando	com	duas	condições		usando	a	o	operador	AND	
select nome, cidade from cliente where idade > 10 and idade <= 47;



-- exercicio:
-- 1. Listar	nome	e	idade	dos	clientes	que	moram	em	Brasilia e	tem	60	ou	19	anos
select nome, idade from cliente where cidade = 'Brasília' and idade = 60 or idade = 19;

-- 2. Monte	uma	consulta	para	o	banco	seguradora	usando	a	o	operador	AND	e	o	operador	OR	
select nome from cliente where idade > 20 and cidade = 'Brasília' or cidade = 'São Paulo';

-- 3. Monte	uma	consulta	para	o	banco	seguradora	usando	a	o	operador	OR	
select modelo from automovel where anofab = 2019 or anofab = 2013;




-- exercicios:
-- 1. Criar	BD	(mínimo	4	tabelas	)
-- criacao tabela chamada 'cliente padoca'
create table clientePadoca(
	codigo serial primary key,
	nome varchar(50),
	rua varchar(50),
	numero int
);

-- criacao tabela pedido
create table pedido(
	codigo serial primary key,
	cod_cliente serial references clientepadoca(codigo),
	descricao varchar,
	data date
);

-- criacao tabela produto
create table produto(
	codigo serial primary key,
	descricao varchar(50),
	preco numeric
);

-- criacao tabela item pedido
create table itempedido(
	numero serial primary key,
	cod_pedido serial references pedido(codigo),
	cod_produto serial references produto(codigo),
	quantidade int,
	valor numeric
);


-- 2. Inserir	dados	(mínimo	6	entradas/tabela)
-- inserindo dados na tabela clientepadoca
insert into clientepadoca values
	(default, 'Andre', 'Gama', '101'),
	(default, 'Douglas', 'Sudo', '102'),
	(default, 'Marcos', 'Paranoa', '103'),
	(default, 'Caio', 'Asa', '104'),
	(default, 'Joyce', 'Águas', '105'),
	(default, 'Josiel', 'Val', '106');

-- inserindo dados na tabela pedido
insert into pedido(descricao, data) values
	('suco', '08/11/2019'),
	('pastel', '05/07/2018'),
	('bolo', '02/09/2017'),
	('lasanha', '20/11/2016');
	
-- inserindo dados na tabela produto
insert into produto(descricao, preco) values
	('suco', 2.50),
	('pastel', 2.50),
	('bolo', 2.50),
	('lasanha', 2.50);

-- inserindo dados na tabela itempedido
insert into itempedido(quantidade, valor)values
	(3, 6.70),
	(4, 7.70),
	(6, 3.70);
	
-- 3. Elaborar	20	consultas	com	base	no	que	já aprendemos.
-- selecionando tudo da tabela cliente
1. select * from clientepadoca;

-- selecionando tudo da tabela cliente ordenado pelo nome
2. select * from clientepadoca order by nome;

-- selecionando tudo do cliente pelo numero
3. select * from clientepadoca order by numero;

-- selecionando nomes do cliente
4. select nome from clientepadoca;

-- selecionando nome do cliente de quem moram em brasilia
5. select nome from cliente where cidade = 'Brasília';

-- selecionando nome e cidade do cliente ordenado pelos nomes
6. select nome, cidade from cliente order by nome;

-- selecionando tudo da tabela produto
7. select * from produto;

-- selecionando descricao e preco da tabela produto ordenado pelo preço
8. select descricao, preco from produto order by preco; 

-- selecionando nome do cliente que mora no paranoa
9. select nome from clientepadoca where rua = 'Paranoa';

-- selecionando tudo do cliente onde numero for maior qye 103 ordenado pelo nome
10. select * from clientepadoca where numero > 103 order by nome;

-- selecionando descricao e preco do produto que custa mais que 2
11. select descricao, preco from produto where preco > 2;

-- selecionando preco do produto descrito como suco
12. select preco from produto where descricao = 'suco';

-- selecionando nome e rua do cliente onde numero menor que 103
13. select nome, rua from clientepadoca where numero < 103;

-- selecionando nome e rua do cliente de quem mora entre 103 e 104
14. select nome, rua from clientepadoca where numero >= 103 and numero < 104;

-- selecionando nome do cliente dos que moram no ap superior a 102 e inferior a 103
15. select nome from clientepadoca where numero > 102 or numero < 103;

-- selecionando nome e tua do cliente de quem mora no ap superior ou igual a 103 e no gama
16. select nome, rua from clientepadoca where numero >= 103 and rua = 'Gama';

-- selecionando rua e numero do cliente ordenado pelo nome
17. select rua, numero from clientepadoca order by nome;

-- selecionando ap diferentes do cliente
18. select distinct numero from clientepadoca;

-- selecionando nome, rua e numero do cliente de quem mora entre os ap 102 e 104
19. select nome, rua, numero from clientepadoca where numero between 102 and 104;

-- selecionando tudo do cliente de quem mora no ap igual ou superior a 104 ordenado pelo nome
20. select * from clientepadoca where numero >= 104 order by nome;


-- 4. Entregar	SQL	pelo	NEAD
-- beleza.







