/* Prova 3 */

/* Exercício 1, 2 e 3 */

DROP TABLE IF EXISTS tb_clientes;

CREATE TABLE tb_clientes(
	cliente_id   INT NOT NULL,
	cartao_id INT NOT NULL
);

INSERT INTO tb_clientes (cliente_id, cartao_id)
VALUES
(125, 9009),
(126, 3306),
(127, 1009),
(128, 5432),
(129, 2863)


SELECT *
FROM tb_clientes


DROP TABLE IF EXISTS tb_transacao;

CREATE TABLE tb_transacao(
	cartao_id INT NOT NULL,
	vlr_transacao   INT NOT NULL
);

INSERT INTO tb_transacao (cartao_id, vlr_transacao)
VALUES
(2863, 50),
(5432, 20),
(9009, 80),
(2863, 125),
(2863, 40),
(5432, 65),
(9009, 15),
(9009, 45),
(2863, 205)

SELECT *
FROM tb_transacao


SELECT
    A.cliente_id,
    A.cartao_id,
    SUM(B.vlr_transacao) AS total_cliente
FROM tb_clientes AS A
INNER JOIN tb_transacao AS B ON A.cartao_id = B.cartao_id
GROUP BY 1, 2
ORDER BY 3 DESC;



/* Exercício 4 */

DROP TABLE IF EXISTS tb_jogos;

CREATE TABLE tb_jogos(
	jogo_id INT NOT NULL,
	nome_jogo VARCHAR(225),
	plataforma VARCHAR(225),
	preco INT NOT NULL
);

INSERT INTO tb_jogos (jogo_id, nome_jogo, plataforma, preco)
VALUES
(1, 'The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 400),
(2, 'Mario Kart 8 Deluxe', 'Nintendo Switch', 350),
(3, 'Kirby Star Allies', 'Nintendo Switch', 300),
(4, 'Splatoon 2', 'Nintendo Switch', 350),
(5, 'God of War', 'PS4', 200),
(6, 'The Last of Us 2', 'PS4', 180),
(7, 'Detroit Become Human', 'PS4', 120),
(8, 'Mortal Kombat X', 'Xbox One', 300),
(9 , 'Halo Infinite', 'Xbox One', 200),
(10, 'Minecraft', 'Xbox One', 50)

SELECT *
FROM tb_jogos;


DROP TABLE IF EXISTS tb_vendas;

CREATE TABLE tb_vendas(
	venda_id INT NOT NULL,
	jogo_id   INT NOT NULL
);

INSERT INTO tb_vendas (venda_id, jogo_id)
VALUES
(1, 1),
(1, 2),
(2, 5),
(3, 3),
(3, 8),
(3, 10),
(4, 3),
(4, 4),
(5, 10),
(6, 9),
(7, 1),
(7, 3),
(7, 5),
(7, 6),
(7, 7),
(8, 2),
(8, 4),
(8, 8),
(9, 6),
(9, 7),
(10, 1),
(10, 5),
(10, 10)

SELECT *
FROM tb_vendas;


SELECT 
	A.plataforma,
	COUNT(*) AS total_vendas
FROM tb_jogos AS A
INNER JOIN tb_vendas AS B ON A.jogo_id = B.jogo_id
GROUP BY plataforma
ORDER BY 2 DESC;


/* Exercício 5 */

SELECT 
	A.nome_jogo,
	SUM(A.preco)
FROM tb_jogos AS A
INNER JOIN tb_vendas AS B ON A.jogo_id = B.jogo_id
GROUP BY A.nome_jogo
ORDER BY 2 DESC;



/* Exercício 6 */

SELECT 
	B.venda_id,
	count(*) AS qtd_vendas
FROM tb_jogos AS A
INNER JOIN tb_vendas AS B ON A.jogo_id = B.jogo_id
GROUP BY venda_id
ORDER BY 1;


SELECT 
	B.venda_id,
	A.nome_jogo,
	A.preco
FROM tb_jogos AS A
INNER JOIN tb_vendas AS B ON A.jogo_id = B.jogo_id
ORDER BY B.venda_id;


SELECT 
	B.venda_id,
	SUM(A.preco)
FROM tb_jogos AS A
INNER JOIN tb_vendas AS B ON A.jogo_id = B.jogo_id
GROUP BY B.venda_id
ORDER BY B.venda_id;



/* Exercício 7 */

SELECT 
	A.plataforma,
	SUM(A.preco)
FROM tb_jogos AS A
INNER JOIN tb_vendas AS B ON A.jogo_id = B.jogo_id
GROUP BY A.plataforma
ORDER BY 2;