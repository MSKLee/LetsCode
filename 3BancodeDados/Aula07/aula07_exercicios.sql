/*
EXercicio 1

Crie a tabela produtos_mercado com as seguintes colunas:
- product_id = id do produto
- segment_name: nome do segmento do produto
- product_name: nome do produto
- unit_price: preço por unidade
- unit: unidade de medida do produto
*/

DROP TABLE IF EXISTS produtos_mercado;

CREATE TABLE produtos_mercado(
	product_id INT GENERATED BY DEFAULT AS IDENTITY,
	segment_name VARCHAR(225),
	product_name VARCHAR(225),
	unit_price NUMERIC (16, 2),
	unit VARCHAR(225)	
);

SELECT *
FROM produtos_mercado;

/*
Exercicio 2
Preencha a tabela anterior com os seguintes dados:

	('Laticínios', 'Queijo', 12, '200 gramas'),
	('Laticínios', 'Leite', 5, '1 litro'),
	('Laticínios', 'Iogurte', 8.50, '4 x 50 gramas'),
	('Laticínios', 'Manteiga', 7.50, '500 gramas'),
	('Laticínios', 'Doce de Leite', 18, '400 gramas'),
	('Carnes e Aves', 'Carne Moída', 40, '500 gramas'),
	('Carnes e Aves', 'Peito de Frango', 25, '1 quilo'),
	('Carnes e Aves', 'Bisteca', 40, '1 quilo'),
	('Grãos', 'Arroz', 22.50, '5 quilos'),
	('Grãos', 'Feijão', 10.50, '1 quilo'),
	('Grãos', 'Lentilha', 7.50, '500 gramas'),
	('Grãos', 'Milho', 4.50, '500 gramas'),
	('Bebidas', 'Cerveja', 2, '350 ml'),
	('Bebidas', 'Refrigerante', 10, '2 litros'),
	('Bebidas', 'Suco', 8, '1 litro'),
	('Diversos', 'Chocolate', 10, '150 gramas'),
	('Diversos', 'Bolo', 6.50, '300 gramas'),
	('Diversos', 'Salgadinho', 7, '150 gramas'),
	('Diversos', 'Bala', 4, '100 gramas'),
	('Diversos', 'Pirulito', 5, '150 gramas');

*/


INSERT INTO produtos_mercado(segment_name, product_name, unit_price, unit)
VALUES
	('Laticínios', 'Queijo', 12, '200 gramas'),
	('Laticínios', 'Leite', 5, '1 litro'),
	('Laticínios', 'Iogurte', 8.50, '4 x 50 gramas'),
	('Laticínios', 'Manteiga', 7.50, '500 gramas'),
	('Laticínios', 'Doce de Leite', 18, '400 gramas'),
	('Carnes e Aves', 'Carne Moída', 40, '500 gramas'),
	('Carnes e Aves', 'Peito de Frango', 25, '1 quilo'),
	('Carnes e Aves', 'Bisteca', 40, '1 quilo'),
	('Grãos', 'Arroz', 22.50, '5 quilos'),
	('Grãos', 'Feijão', 10.50, '1 quilo'),
	('Grãos', 'Lentilha', 7.50, '500 gramas'),
	('Grãos', 'Milho', 4.50, '500 gramas'),
	('Bebidas', 'Cerveja', 2, '350 ml'),
	('Bebidas', 'Refrigerante', 10, '2 litros'),
	('Bebidas', 'Suco', 8, '1 litro'),
	('Diversos', 'Chocolate', 10, '150 gramas'),
	('Diversos', 'Bolo', 6.50, '300 gramas'),
	('Diversos', 'Salgadinho', 7, '150 gramas'),
	('Diversos', 'Bala', 4, '100 gramas'),
	('Diversos', 'Pirulito', 5, '150 gramas');

SELECT *
FROM produtos_mercado;

/*
Exercicio 3
Cria a tabela vendas_mercado com as seguintes colunas:
- vendas_id = id da venda
- product_id: id do produto
- quantity: quantidade do produto
*/


DROP TABLE IF EXISTS vendas_mercado;

CREATE TABLE vendas_mercado(
	vendas_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT NOT NULL
);


/*
Exercicio 4
Preencha a tabela do exercicio 3 com os seguintes dados:

	(0001, 0002, 12),
	(0001, 0005, 1),
	(0001, 0006, 1),
	(0001, 0009, 1),
	(0001, 0010, 2),
	(0001, 0013, 24),
	(0001, 0014, 2),
	(0002, 0012, 5),
	(0002, 0015, 3),
	(0002, 0016, 4),
	(0002, 0019, 1),
	(0003, 0001, 3),
	(0003, 0003, 1),
	(0003, 0004, 1),
	(0003, 0008, 2),
	(0003, 0011, 1),
	(0003, 0017, 2),
	(0003, 0020, 1),
	(0004, 0001, 2),
	(0004, 0004, 1),
	(0004, 0015, 2),
	(0004, 0017, 3),
	(0004, 0019, 4),
	(0005, 0013, 36),
	(0005, 0014, 6),
	(0006, 0005, 2),
	(0006, 0006, 1),
	(0006, 0008, 3),
	(0006, 0009, 1),
	(0006, 0011, 2),
	(0006, 0014, 1),
	(0007, 0009, 1),
	(0007, 0010, 1),
	(0007, 0007, 2),
	(0008, 0012, 4),
	(0008, 0014, 2),
	(0008, 0017, 3),
	(0008, 0018, 6);
*/

INSERT INTO vendas_mercado (vendas_id, product_id, quantity)
VALUES
	(0001, 0002, 12),
	(0001, 0005, 1),
	(0001, 0006, 1),
	(0001, 0009, 1),
	(0001, 0010, 2),
	(0001, 0013, 24),
	(0001, 0014, 2),
	(0002, 0012, 5),
	(0002, 0015, 3),
	(0002, 0016, 4),
	(0002, 0019, 1),
	(0003, 0001, 3),
	(0003, 0003, 1),
	(0003, 0004, 1),
	(0003, 0008, 2),
	(0003, 0011, 1),
	(0003, 0017, 2),
	(0003, 0020, 1),
	(0004, 0001, 2),
	(0004, 0004, 1),
	(0004, 0015, 2),
	(0004, 0017, 3),
	(0004, 0019, 4),
	(0005, 0013, 36),
	(0005, 0014, 6),
	(0006, 0005, 2),
	(0006, 0006, 1),
	(0006, 0008, 3),
	(0006, 0009, 1),
	(0006, 0011, 2),
	(0006, 0014, 1),
	(0007, 0009, 1),
	(0007, 0010, 1),
	(0007, 0007, 2),
	(0008, 0012, 4),
	(0008, 0014, 2),
	(0008, 0017, 3),
	(0008, 0018, 6);
	

SELECT *
FROM vendas_mercado;


/*
Exercicio 5
Ordene a tabela de vendas de acordo com o valor da venda,
ou seja da maior venda para a menor venda
*/

SELECT
	A.vendas_id,
	SUM(A.quantity * B.unit_price) AS total_vendas
FROM vendas_mercado AS A
LEFT JOIN produtos_mercado AS B ON A.product_id = B.product_id
GROUP BY 1
ORDER BY 2 DESC;




/*
Exercicio 6

Ordene os produtos de acordo com os que mais venderam, 
de acordo com a quantidade de produtos
*/

CREATE OR REPLACE TEMP VIEW vendas_product_id AS
SELECT product_id,
	SUM(quantity)
FROM vendas_mercado
GROUP BY product_id
ORDER BY product_id;

ALTER TABLE vendas_product_id 
RENAME COLUMN sum TO qtd_total;

SELECT *
FROM vendas_product_id;


SELECT
	A.segment_name,
	A.product_name,
	A.unit_price,
	B.qtd_total,
	(A.unit_price * B.qtd_total) AS total_vendas

FROM produtos_mercado AS A
LEFT JOIN vendas_product_id AS B ON A.product_id = B.product_id
ORDER BY 4 DESC;



/*
Exercicio 7

Ordene os produtos de acordo com os que mais venderam, 
de acordo com o valor total das venda do produto
*/

SELECT
	A.segment_name,
	A.product_name,
	A.unit_price,
	B.qtd_total,
	(A.unit_price * B.qtd_total) AS total_vendas

FROM produtos_mercado AS A
LEFT JOIN vendas_product_id AS B ON A.product_id = B.product_id
ORDER BY 5 DESC;





/*
Exercicio 8

Calcule a média de vendas de acordo com o segmento do produto
e ordene os segmentos dos que menos venderam para os que mais venderam
*/


SELECT
	A.segment_name,
	ROUND(AVG(A.unit_price * B.quantity), 2) AS media_vendas

FROM produtos_mercado AS A
LEFT JOIN vendas_mercado AS B ON A.product_id = B.product_id
GROUP BY 1
ORDER BY 2;




/*
Exercicio 9

Quais são os 5 produtos mais baratos?
*/


SELECT product_name, unit_price
FROM produtos_mercado
ORDER BY unit_price
LIMIT 5;



/*
Exercicio 10

Usando consultas, crie uma tabela com as seguintes colunas:
- vendas_id
- product_name
- total_produto = unit_price * quantity
- total_compra: valor total da compra

Dica: Utilize window function
*/

SELECT
	B.vendas_id,
	A.product_name,
	A.unit_price * B.quantity AS total_produto,
	SUM(A.unit_price * B.quantity) OVER (PARTITION BY B.vendas_id) AS total_compra
FROM produtos_mercado AS A
LEFT JOIN vendas_mercado AS B ON A.product_id = B.product_id;




