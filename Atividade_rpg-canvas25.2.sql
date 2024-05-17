-- Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.

CREATE TABLE tb_classes (
id BIGINT AUTO_INCREMENT,
nomeclasse VARCHAR(255),
raca VARCHAR(255),
PRIMARY KEY(id)
);
-- Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
-- Não esqueça de criar a Foreign Key da tabela tb_classes na tabela tb_personagens.

CREATE TABLE tb_personagens (
id BIGINT AUTO_INCREMENT,
nome VARCHAR(255),
poderataque BIGINT,
poderdefesa BIGINT,
genero VARCHAR(255),

tb_classes_id BIGINT,
PRIMARY KEY(id),
FOREIGN KEY (tb_classes_id) REFERENCES tb_classes(id)
);
DROP TABLE tb_personagens;
-- Insira 5 registros na tabela tb_classes.
INSERT INTO tb_classes(nomeclasse, raca)
VALUES("Mago","Elfo"),
("FERREIRO","Anão"),
("SAQUEADOR", "Fada"),
("Mago","Elfo Negro"),
("Guerreiro", "Orc"); 

-- Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
INSERT INTO tb_personagens(nome, poderataque, poderdefesa, genero, tb_classes_id)
VALUES("Ferdinando", 11000, 2500, "Masculino", 1),
("Raphi", 10000, 2000, "Feminino", 1),
("Guto", 12000, 2500, "Masculino", 4),
("Else", 12000, 3200, "Feminino", 2),
("Pelezinho", 50000, 3200, "Masculino", 4),
("Fefa", 20000, 3100, "Feminino", 5),
("Apelão", 29000, 2900, "Masculino", 2),
("Ruby", 280000, 3000, "Feminino", 3);

SELECT * FROM tb_classes;

-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE poderataque > 2000;

-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE poderdefesa BETWEEN 1000 AND 2000 ORDER BY poderdefesa ASC;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT *
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.tb_classes_id = tb_classes.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros)
SELECT * FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.tb_classes_id = tb_classes.id
WHERE tb_classes_id = 4;
