-- criação da tabela funcionario
create table funcionario(
	codigo serial primary key,
	codigo_f serial,
	nome varchar(50),
	rua varchar(50),
	constraint fk_codigo foreign key(codigo_f)
		references departamento(codigo)
);

-- criação da tabela departamento
create table departamento(
	codigo serial primary key,
	descricao varchar(50)
);

-- criação da tabela dependente
create table dependente(
	numero serial primary key,
	codigo_f serial,
	nome varchar(50),
	grau_parentesco int,
	constraint fk_codigo foreign key(codigo_f)
		references funcionario(codigo)
);

-- adicionando novo departamento 'obras' e 'gerencia'
insert into departamento values
	(default, 'Obras'),
	(default, 'Gerencia')
	
-- inserindo machado
insert into funcionario values(default, 'Jacinto Machado', 'Brasília')

-- jacinto trabalha em obras
insert into funcionario values() 

-- gumercinda é dependente
insert into dependente values(default, default, 'Gumercindo Machado', 1)

-- filho é dependente
insert into dependente values(default, default, 'Machado Filho', 2)

-- alteração do nome
update dependente set nome = 'Gumercito Filho' where nome = 'Machado Filho';

-- jacinto trabalho em gerencia
update funcionario set codig_f = 'Gerencia' where codigo = 'Obras';

-- jacinto divorciou
delete from dependente where nome = 'Gumercindo Machado';

-- desvinculado da empresa / depentende / dado da empresa
delete from funcionario where nome = 'Jacinto Machado';
