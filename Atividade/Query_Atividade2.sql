-- Criando banco de dados db_pizzaria_legal

create database db_pizzaria_legal;

-- Criando tabelas tb_categoria & tb_pizza, usando o banco de dados db_pizzaria_legal

use db_pizzaria_legal;

create table tb_categoria(

id_categoria bigint(5) auto_increment,
tamanho varchar(50),
borda boolean not null,
primary key (id_categoria)

);

create table tb_pizza(

id_pizza bigint(8) auto_increment,
sabor varchar(100) not null,
bebida varchar(100) not null,
preco decimal(5 , 2) not null,
fk_id_categoria bigint not NULL,
primary key (id_pizza),
foreign key (fk_id_categoria) references tb_categoria (id_categoria) -- Definir coluna fk_id_categoria como Foreign key e referenciando a tb_categoria coluna id_categoria
);

-- Populando tabelas 

-----  Categoria
INSERT INTO tb_categoria (tamanho, borda) VALUES ("Grande", 1);
INSERT INTO tb_categoria (tamanho, borda) VALUES ("Media", 1);
INSERT INTO tb_categoria (tamanho, borda) VALUES ("Broto", 1);
INSERT INTO tb_categoria (tamanho, borda) VALUES ("Grande", 0);
INSERT INTO tb_categoria (tamanho, borda) VALUES ("Media", 0);
INSERT INTO tb_categoria (tamanho, borda) VALUES ("Broto", 0);

----- Pizza 
INSERT INTO tb_pizza (sabor, bebida, preco, fk_id_categoria) VALUES ("Calabresa", "Agua", 60, 1);
INSERT INTO tb_pizza (sabor, bebida, preco, fk_id_categoria) VALUES ("Mussarela", "Coca-Cola", 45, 2);
INSERT INTO tb_pizza (sabor, bebida, preco, fk_id_categoria) VALUES ("Chocolate", "Guarana", 55, 4);
INSERT INTO tb_pizza (sabor, bebida, preco, fk_id_categoria) VALUES ("Frango c/ Catupiry", "Sprite", 40, 5);
INSERT INTO tb_pizza (sabor, bebida, preco, fk_id_categoria) VALUES ("Atum", "Fanta Laranja", 35, 3);
INSERT INTO tb_pizza (sabor, bebida, preco, fk_id_categoria) VALUES ("Calabresa", "Pepsi", 30, 6);
INSERT INTO tb_pizza (sabor, bebida, preco, fk_id_categoria) VALUES ("Portuguesa", "Suco de Maracuja", 60, 1);
INSERT INTO tb_pizza (sabor, bebida, preco, fk_id_categoria) VALUES ("Doce de Leite", "Suco de Limão", 55, 4);


-- Faça um select que retorne os Produtos com o valor maior do que 45 reais.

select * from tb_pizza  where preco > 45;

-- Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.

select * from tb_pizza  where preco > 29 AND preco < 60;

-- Faça um select  utilizando LIKE buscando os Produtos com a letra C.

select * from tb_pizza where sabor like '%C%';

-- Faça um um select com Inner join entre  tabela categoria e pizza.

select * from  tb_categoria inner join tb_pizza on tb_categoria.id_categoria = tb_pizza.fk_id_categoria;

-- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são pizza doce).

select * from  tb_categoria inner join tb_pizza on tb_categoria.id_categoria = tb_pizza.fk_id_categoria where borda = 1;