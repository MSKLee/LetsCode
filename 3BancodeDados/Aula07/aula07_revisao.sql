/*
AULA REVISÃO
*/

/* CREATE TABLE */
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes(
	cliente_id   INT NOT NULL,
	nome_cliente VARCHAR(255),
	cidade       VARCHAR(255),
	estado       VARCHAR(2)
);
	
SELECT * FROM clientes;


/* INSERT */
/*1 FORMA*/
INSERT INTO clientes VALUES (0001, 'João Pedro Filho', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes VALUES (0002, 'Maria Luiza de Souza', 'Parati', 'RJ');
INSERT INTO clientes VALUES (0003, 'Rafael Cardoso', 'São Paulo', 'SP');
INSERT INTO clientes VALUES (0004, 'Andrei Punski', 'Rio de Janeiro', 'RJ');
INSERT INTO clientes VALUES (0005, 'Mathias Cerqueira', 'São Paulo', 'RJ');
INSERT INTO clientes VALUES (0006, 'Lucas da Silva', 'São José dos Campos', NULL);
INSERT INTO clientes VALUES (0007, 'Cintia Almeida', 'São Paulo', 'SP');

/* 2 FORMA */
INSERT INTO clientes (cliente_id, nome_cliente, cidade, estado)
VALUES
	(0001, 'João Pedro Filho', 'Rio de Janeiro', 'RJ'),
	(0002, 'Maria Luiza de Souza', 'Parati', 'RJ'),
	(0003, 'Rafael Cardoso', 'São Paulo', 'SP'),
	(0004, 'Andrei Punski', 'Rio de Janeiro', 'RJ'),
	(0005, 'Mathias Cerqueira', 'São Paulo', 'RJ'),
	(0006, 'Lucas da Silva', 'São José dos Campos', NULL),
	(0007, 'Cintia Almeida', 'São Paulo', 'SP');


/* CONSULTAS COM QUERY - SELECT */
SELECT 
	* 
FROM clientes;


/* UPDATE */
UPDATE clientes
SET estado = 'SP'
WHERE cliente_id IN (5, 6);

SELECT
	*
FROM clientes
ORDER BY cliente_id;


/* DELETE */
DELETE FROM clientes WHERE estado = 'RJ';

SELECT
	*
FROM clientes;


/* CONSULTAS CUSTOMIZADAS */
SELECT
	*
FROM orders;


/* LIMIT */
SELECT
	*
FROM orders
LIMIT 5;


/* DISTINCT */
SELECT DISTINCT
	ship_city
FROM orders;


/* WHERE */
SELECT
	*
FROM orders
WHERE ship_city = 'Paris';


/* WHERE COM LIKE*/
SELECT
	ship_city
FROM orders
WHERE ship_city LIKE 'S%';


/* WHERE COM 2 CONDIÇÕES OU MAIS */
SELECT
	*
FROM orders
WHERE freight > 50 AND order_date BETWEEN '1996-07-01' AND '1996-07-31';


/* CALCULOS - EM TODA A TABELA*/
/* MEDIA */
SELECT
	AVG(freight) AS media_frete
FROM orders;


/* CONTAGEM */
SELECT
	COUNT(*) AS cnt
FROM orders;


/* SOMA */
SELECT
	SUM(freight) AS total_frete
FROM orders;


/* MAXIMO E MINIMO */
SELECT
	MIN(order_date) AS min_order_date,
	MAX(order_date) AS max_order_date
FROM orders;


/* CALCULOS COM AGRUPAMENTOS (GROUP BY) */
SELECT
	ship_city,
	SUM(freight) AS total_vlr_frete
FROM orders
GROUP BY ship_city
ORDER BY SUM(freight) DESC;


/* ROUND */
SELECT
	ship_city,
	ROUND(SUM(freight)) AS total_vlr_frete
FROM orders
GROUP BY 1
ORDER BY 2 DESC;


/* CAST */
SELECT
	ship_city,
	ROUND(CAST(SUM(freight) AS NUMERIC), 2) AS total_vlr_frete
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

SELECT
	freight,
	CAST(freight AS INT) AS frete_inteiro,
	CAST(freight AS CHAR(3)) AS frete_texto
FROM orders;


/* CASE */
SELECT
	order_id,
	freight AS frete_original,
	CASE WHEN freight > 100 THEN 0.6 * freight ELSE 0.8 * freight END AS novo_frete
FROM orders;
	

/* MANIPULANDO DATA */
SELECT
	order_date,
	DATE_PART('day', order_date)   AS dia_pedido,
	DATE_PART('month', order_date) AS mes_pedido,
	DATE_PART('year', order_date)  AS ano_pedido,
	DATE_TRUNC('month', order_date) AS mes_trunc,
	TO_CHAR(order_date, 'YYYY-MM') AS safra
FROM orders;

SELECT
	TO_CHAR(order_date, 'YYYY-MM') AS safra,
	COUNT(*) AS cnt
FROM orders
GROUP BY 1
ORDER BY 1;


/* MANIPULANDO TEXTO */
SELECT
	*
FROM customers
WHERE contact_name LIKE '%A%';

SELECT
	*
FROM customers
WHERE contact_name ~'^[A]';


/* JOINS */
SELECT
	A.product_name,
	B.order_id
FROM products AS A
LEFT JOIN order_details AS B ON A.product_id = B.product_id
ORDER BY 1, 2;


/* UNION */
SELECT DISTINCT
	ship_city
FROM orders;

SELECT DISTINCT
	city
FROM customers;

SELECT DISTINCT ship_city FROM orders
UNION ALL
SELECT DISTINCT city FROM customers
ORDER BY 1;


/* WINDOW FUNCTION */
SELECT
	ship_country,
	ship_city,
	freight,
	SUM(freight) OVER (PARTITION BY ship_country, ship_city ORDER BY ship_country, ship_city) AS total_frete
FROM orders
WHERE freight > 100;




