-- criando tabela chamada tbCliente:
create table tbCliente(
	nome_cli varchar(100),
	codigo_cli int,
	CPF_cli varchar(11),
	data_cadastro date,
	cidade_cli varchar(50),
	UF_cli varchar(2),
	constraint pk_codigo_cli primary key (codigo_cli)
);

-- criando tabela chamada tbCategoria:
create table tbCategoria(
	codigo_categoria int,
	nome_categoria varchar(200),
	constraint pk_tbCategoria primary key (codigo_categoria)
);

-- criando tabela chamada tbClasse:
create table tbClasse(
	codigo_classe int,
	nome_classe varchar(20) not null,
	preco_classe numeric(4,2) not null,
	constraint pk_NomeClasse primary key (codigo_classe)
);

-- criando tabela chamada tbTitulo:
create table tbTitulo(
	codigo_titulo int,
	nome_titulo varchar(50) not null,
	ano numeric(4),
	codigo_categoria int,
	codigo_classe int,
	constraint pk_tbTitulo primary key (codigo_titulo),
	constraint fk_tbTitulo_tbCategoria foreign key (codigo_categoria)
		references tbCategoria (codigo_categoria)
		on delete cascade on update cascade,
	constraint fk_tbtitulo_tbClasse foreign key (codigo_classe)
		references tbClasse (codigo_classe)
		on delete cascade on update cascade
);

-- criando tabela chamada tbFilme:
create table tbFilme(
	codigo_filme int,
	codigo_titulo int,
	nome_distribuidor varchar(20),
	constraint pk_tbFilme primary key (codigo_filme),
	constraint pk_tbFilme_codigo_filme foreign key (codigo_titulo)
		references tbTitulo (codigo_titulo)
);

-- criando tabela chamada tbEmprestimo_devolucao:
create table tbEmprestimo_devolucao(
	codigo_cli int,
	codigo_filme int,
	data_emprestimo date,
	data_devolucao_prevista date,
	data_devolucao_efetiva date,
	valor_multa numeric,
	constraint pk_tbEmprestimo_ primary key (data_emprestimo),
	constraint pk_tbEmprestimo foreign key (codigo_cli)
		references tbCliente (codigo_cli),
	constraint pk_tbEmprestimo_devolucao foreign key (codigo_filme)
		references tbFilme (codigo_filme)
);


-- Exercício 3:

-- 1. Alterar nome de uma tabela	
alter table tbCliente rename to tbClientes;
-- Comando acima renomeia a tabela tbCliente para tbClientes;



-- 2. Alterar nome de uma coluna da	tabela 
alter table tbClientes rename column nome_cli to nome_cliente;
-- Comando acima renomeia a coluna nome_cli para nome_cliente;


-- 3. Remover	uma	tabela 
drop table tbFilme;
-- Comando acima delete a tabela chamada tbFilme



-- 4. Inserir	nova	tabela	
create table tbFilme(
	codigo_filme int,
	codigo_titulo int,
	nome_distribuidor varchar(20),
	constraint pk_tbFilme primary key (codigo_filme),
	constraint pk_tbFilme_codigo_filme foreign key (codigo_titulo)
		references tbTitulo (codigo_titulo)
);
-- Comando acima cria uma tabela chamada tbFilme;



-- 5. Remover	uma	coluna	
alter table tbClientes drop column cidade_cli cascade;
-- Comando acima delete uma coluna da tabela tbClientes, chamada cidade_cli. 



-- 6. Inserir	uma	nova	coluna	em	uma	tabela	
alter table tbFilme add column diretor varchar(50);
-- Comando acima inseta uma nova coluna na tabela tbFilme, chamada diretor, do tipo varchar;



-- 7. Inserir	uma	restrição	na	tabela	
alter table tbFilme add constraint pk_tbFilme_codigo_filme_del foreign key (codigo_titulo)
		references tbTitulo (codigo_titulo);
-- Comando acima insere uma restrição na tabela tbFilme, chamada 'pk_tbFilme_codigo_filme_del'



-- 8. Alterar	o	tipo	de	dados	de	uma	coluna 
alter table tbEmprestimo_devolucao alter column valor_multa type int;
-- Comando acima altera o tipo de dados da coluna valor_multa, da coluna tbEmprestimo_devolucao;



-- 9. Definir	o	valor	padrão	de	uma	coluna	(DEFAULT)
alter table tbClientes alter column UF_cli set default 'Brasília';
-- Comando acima altera o valor padrão da coluna UF_cli, da coluna tbClientes, de modo que,
-- se o usuário não colocar algum valor, o mesmo receberá como valor padrão, o dado 'Brasília'.










