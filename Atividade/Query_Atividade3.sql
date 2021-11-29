-- Criando banco de dados db_farmacia_do_bem

create database db_farmacia_do_bem;

-- Criando tabelas tb_categoria & tb_pizza, usando o banco de dados db_pizzaria_legal

use db_farmacia_do_bem;

create table tb_categoria(

id_categoria bigint(5) auto_increment,
tipo varchar(50),
generico boolean not null,
primary key (id_categoria)

);

create table tb_produto(

id_produto bigint(8) auto_increment,
nome varchar(100) not null,
faixaetaria varchar(100) not null,
preco decimal(5 , 2) not null,
fk_id_categoria bigint not NULL,
primary key (id_produto),
foreign key (fk_id_categoria) references tb_categoria (id_categoria) -- Definir coluna fk_id_categoria como Foreign key e referenciando a tb_categoria coluna id_categoria
);

-- Populando tabelas 

-----  Categoria
INSERT INTO tb_categoria (tipo, generico) VALUES ("Medicamento", 1);
INSERT INTO tb_categoria (tipo, generico)  VALUES ("Medicamento", 0);
INSERT INTO tb_categoria (tipo, generico)  VALUES ("Perfumaria", 0);
INSERT INTO tb_categoria (tipo, generico)  VALUES ("Alimento", 0);
INSERT INTO tb_categoria (tipo, generico) VALUES ("Higiene", 0);


----- Pizza 
INSERT INTO tb_produto (nome, faixaetaria, preco, fk_id_categoria) VALUES ("Tylenol", "Adulto", 25, 2);
INSERT INTO tb_produto (nome, faixaetaria, preco, fk_id_categoria) VALUES ("Fralda", "Bebe", 40, 5);
INSERT INTO tb_produto (nome, faixaetaria, preco, fk_id_categoria) VALUES ("Cimegripe", "Adulto", 25, 1);
INSERT INTO tb_produto (nome, faixaetaria, preco, fk_id_categoria) VALUES ("Gillete", "Adulto", 15, 3);
INSERT INTO tb_produto (nome, faixaetaria, preco, fk_id_categoria) VALUES ("Desodorante", "Adulto", 10, 5);
INSERT INTO tb_produto (nome, faixaetaria, preco, fk_id_categoria) VALUES ("Chocolate", "Livre", 5, 4);
INSERT INTO tb_produto (nome, faixaetaria, preco, fk_id_categoria) VALUES ("Escova de dentre", "Livre", 10, 5);
INSERT INTO tb_produto (nome, faixaetaria, preco, fk_id_categoria) VALUES ("Roacutan", "Adulto", 55, 2);


-- Faça um select que retorne os Produtos com o valor maior do que 45 reais.

select * from tb_produto  where preco > 50;

-- Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.

select * from tb_produto  where preco > 3 AND preco < 60;

-- Faça um select  utilizando LIKE buscando os Produtos com a letra C.

select * from tb_produto where sabor like '%B%';

-- Faça um um select com Inner join entre  tabela categoria e produto.

select * from  tb_categoria inner join tb_produto on tb_categoria.id_categoria = tb_produto.fk_id_categoria;

-- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são cosméticos).

select * from  tb_categoria inner join tb_produto on tb_categoria.id_categoria = tb_produto.fk_id_categoria where generico = 1;