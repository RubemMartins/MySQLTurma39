use db_empresa;

create table funcionarios(
id bigint(5) auto_increment, 
nome varchar(30) not null,
nascimento date not null,
sexo varchar (30) not null,
salario float not null,
funcao varchar(30) not null,
primary key (id)
);
