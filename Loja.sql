-- Criação da tabela cliente
create table Cliente(
	codigo serial primary key,
	nome varchar(50),
	rua varchar(50),
	numero int
);

-- Criação da table pedido
create table Pedido(
	codigo serial primary key,
	cod_cliente int,
	descricao varchar(100),
	data date,
	constraint cod_do_cliente foreign key(cod_cliente)
		references Pedido(codigo)
		on delete cascade on update cascade
);

-- Criação da tabale produto
create table Produto(
	codigo serial primary key,
	descricao varchar(100),
	preco numeric
);

-- criacao da tabela item pedido
create table itemPedido(
	numero serial primary key,
	cod_pedido serial,
	cod_produto serial,
	quantidade numeric,
	valor numeric,
	constraint fk_cod_pedido foreign key(cod_pedido)
		references Pedido(codigo)
		on delete cascade on update cascade,
	constraint fk_cod_produto foreign key(cod_produto)
		references Produto(codigo)
);

-- inserindo dados na tabela cliente
insert into Cliente values 
	(1, 'Marcos', 'Brasília', 1),
	(2, 'Douglas', 'Brasília', 2),
	(3, 'André', 'Brasília', 3),
	(4, 'Manu', 'Brasília', 4),
	(5, 'Allysson', 'Brasília', 5)

-- inserindo dados na tabale produto
insert into Produto values
	(1, 'Monitor para Notebook', 200),
	(2, 'Mouse', 20),
	(3, 'CPU Game', 2.000),
	(4, 'Teclado', 50),
	(5, 'Hear Phones Wifi', 200)
	
	
-- inserindo dados na tabela pedido
insert into Pedido values
	(1, 1, 'Pedido 1', '20/08/2019'),
	(2, 1, 'Pedido 2', '21/08/2019'),
	(3, 2, 'Pedido 3', '22/08/2019')
	
-- // verificar os dados que foram entrados:
select * from cliente;
select * from itempedido;
select * from pedido;
select * from produto;

-- // tentando salvar uotro cliente já existente:
insert into Cliente values (1, 'Marcos', 'Brasília', 1)


-- // tentar entrar com dados de um pedido para um cliente codigo 54
insert into Pedido values (54, 1, 'Pedido 1', '20/08/2019')
	
-- // entrar com dados para itempedido:
insert into itemPedido values
	(1, 1, 1, 3, 30),
	(2, 1, 2, 5, 100),
	(1, 2, 3, 2, 60),
	(2, 2, 1, 1, 10),
	(1, 3, 3, 10, 100),
	(2, 3, 2, 20, 400),
	(3, 3, 1, 30, 900)