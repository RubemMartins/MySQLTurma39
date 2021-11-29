-- Criando banco de dados db_cidade_das_frutas

create database db_cidade_das_frutas;

-- Criando tabelas tb_categoria & tb_pizza, usando o banco de dados db_cidade_das_frutas

use db_cidade_das_frutas;

create table tb_categoria(

id_categoria bigint(5) auto_increment,
tamanho varchar(50),
gosto varchar(50),
primary key (id_categoria)

);

create table tb_produto(

id_produto bigint(8) auto_increment,
nome varchar(100) not null,
cor varchar(100) not null,
preco decimal(5 , 2) not null,
fk_id_categoria bigint not NULL,
primary key (id_produto),
foreign key (fk_id_categoria) references tb_categoria (id_categoria) -- Definir coluna fk_id_categoria como Foreign key e referenciando a tb_categoria coluna id_categoria
);

-- Populando tabelas 

-----  Categoria
INSERT INTO tb_categoria (tamanho, gosto) VALUES ("Grande", "Doce");
INSERT INTO tb_categoria (tamanho, gosto)  VALUES ("Média", "Doce");
INSERT INTO tb_categoria (tamanho, gosto)  VALUES ("Pequena", "Doce");
INSERT INTO tb_categoria (tamanho, gosto)  VALUES ("Grande", "Azeda");
INSERT INTO tb_categoria (tamanho, gosto) VALUES ("Media", "Azeda");
INSERT INTO tb_categoria (tamanho, gosto) VALUES ("Pequena", "Azeda");


----- Pizza 
INSERT INTO tb_produto (nome, cor, preco, fk_id_categoria) VALUES ("Banana", "Amarela", 5, 2);
INSERT INTO tb_produto (nome, cor, preco, fk_id_categoria) VALUES ("Maçã", "Vermelha", 2, 6);
INSERT INTO tb_produto (nome, cor, preco, fk_id_categoria) VALUES ("Jaca", "Marrom", 10, 1);
INSERT INTO tb_produto (nome, cor, preco, fk_id_categoria) VALUES ("Melancia", "Verde", 15, 1);
INSERT INTO tb_produto (nome, cor, preco, fk_id_categoria) VALUES ("Pessego", "Amarela", 5, 2);
INSERT INTO tb_produto (nome, cor, preco, fk_id_categoria) VALUES ("Manga", "Vermelha", 3, 2);
INSERT INTO tb_produto (nome, cor, preco, fk_id_categoria) VALUES ("Uva", "Roxa", 8, 3);
INSERT INTO tb_produto (nome, cor, preco, fk_id_categoria) VALUES ("Laranja", "Laranja", 10, 6);


-- Faça um select que retorne os Produtos com o valor maior do que 50 reais.

select * from tb_produto  where preco > 50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

select * from tb_produto  where preco > 3 AND preco < 60;

-- Faça um select  utilizando LIKE buscando os Produtos com a letra C.

select * from tb_produto where sabor like '%C%';

-- Faça um um select com Inner join entre  tabela categoria e produto.

select * from  tb_categoria inner join tb_produto on tb_categoria.id_categoria = tb_produto.fk_id_categoria;

-- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são aves ou legumes).

select * from  tb_categoria inner join tb_produto on tb_categoria.id_categoria = tb_produto.fk_id_categoria where fk_id_categoria = 2;