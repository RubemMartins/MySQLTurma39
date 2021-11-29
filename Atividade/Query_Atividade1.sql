-- Criando banco de dados db_generation_game_online

create database db_generation_game_online

-- Criando tabelas tb_personagem & tb_classes, usando o banco de dados db_generation_game_online

use db_generation_game_online;

create table tb_classe(

id_classe bigint(5) auto_increment,
nivel varchar(50),
estrelas varchar(50),
patente varchar(50),
primary key (id_classe)

);

create table tb_personagem(

id_personagem bigint(8),
nome varchar(100) not null,
elemento varchar(100) not null,
cla varchar(100) not null,
arma varchar(100) not null,
fk_id_classe bigint not NULL,
primary key (id_personagem),
foreign key (fk_id_classe) references tb_classe (id_classe) -- Definir coluna fk_id_classe como Foreign key e referenciando a tb_classe coluna id_classe
);

----- Adicionando poder de ataque e poder de defesa na tabela personagem

alter table tb_personagem add poderataque int;

alter table tb_personagem add poderdefesa int;

-- Populando tabelas 

-----  Classe
INSERT INTO tb_classe (nivel, estrelas, patente) VALUES ("Ouro", "Quatro Estrelas", "Zika");
INSERT INTO tb_classe (nivel, estrelas, patente) VALUES ("Prata", "Tres Estrelas", "Bom");
INSERT INTO tb_classe (nivel, estrelas, patente) VALUES ("Bronze", "Duas Estrelas", "Mais ou menos");
INSERT INTO tb_classe (nivel, estrelas, patente) VALUES ("Latão", "Uma Estrela", "Precisa melhorar");
INSERT INTO tb_classe (nivel, estrelas, patente) VALUES ("Diamante", "Cinco Estrelas", "Brabo");

----- Personagem 
INSERT INTO tb_personagem (nome, elemento, cla, arma, fk_id_classe,poderataque, poderdefesa) VALUES ("Cesinha", "Agua", "Zika", "Flecha", 4, 500, 400);
INSERT INTO tb_personagem (nome, elemento, cla, arma, fk_id_classe,poderataque, poderdefesa) VALUES ("Zezinho", "Fogo", "Só brabo", "Martelo", 3,2500, 900);
INSERT INTO tb_personagem (nome, elemento, cla, arma, fk_id_classe,poderataque, poderdefesa) VALUES ("Huguinho", "Ar", "Top", "Espada", 2,3000, 2000);
INSERT INTO tb_personagem (nome, elemento, cla, arma, fk_id_classe,poderataque, poderdefesa) VALUES ("Maria", "Terra", "Só brabo", "Lança", 2,1900, 2700);
INSERT INTO tb_personagem (nome, elemento, cla, arma, fk_id_classe,poderataque, poderdefesa) VALUES ("Josias", "Agua", "Só brabo", "Flecha", 1,1700, 4000);
INSERT INTO tb_personagem (nome, elemento, cla, arma, fk_id_classe,poderataque, poderdefesa) VALUES ("Tais", "Terra", "Só brabo", "Martelo", 5,4000, 5000);
INSERT INTO tb_personagem (nome, elemento, cla, arma, fk_id_classe,poderataque, poderdefesa) VALUES ("Carla", "Fogo", "Só brabo", "Espada", 5,7000, 9000);
INSERT INTO tb_personagem (nome, elemento, cla, arma, fk_id_classe,poderataque, poderdefesa) VALUES ("Joãozinho", "Fogo", "Só brabo", "Lança", 3,1000, 900);

-------- Alterando id_personagem para auto_increment

alter table tb_personagem modify id_personagem bigint(8)auto_increment;

-- Faça um select que retorne os personagens com o poder de ataque maior do que 2000.

select * from tb_personagem  where poderataque > 2000;

-- Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.

select * from tb_personagem  where poderdefesa > 1000 AND poderdefesa < 2000;

-- Faça um select  utilizando LIKE buscando os personagens com a letra C.

select * from tb_personagem where nome like '%C%';

-- Faça um um select com Inner join entre  tabela classe e personagem.

select * from  tb_classe inner join tb_personagem on tb_classe.id_classe = tb_personagem.fk_id_classe;

-- Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que são arqueiros).

select * from  tb_classe inner join tb_personagem on tb_classe.id_classe = tb_personagem.fk_id_classe where nivel = "Diamante";

