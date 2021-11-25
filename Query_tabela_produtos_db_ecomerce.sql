use db_ecomerce;

create table tb_produtos (
id_produto bigint (5) auto_increment,
preco decimal (5,2),
tipo varchar(50),
marca varchar(50),
validade date,
primary key (id_produto)
);