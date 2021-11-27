/*
Exercícios
*/

SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM products;
SELECT * FROM customers;

/*
1. Obtenha uma tabela que contenha o id do pedido e o valor total do mesmo.

(products.unit_price * order_details.quantity * (1 - order_details.discount) + (orders.freight) as total_order_price

*/

CREATE OR REPLACE TEMP VIEW orders_price AS
SELECT
	A.order_id,
	A.product_id,
	A.quantity,
	A.discount,
	B.unit_price
FROM order_details AS A
LEFT JOIN products AS B ON A.product_id = B.product_id;

SELECT * FROM orders_price;

CREATE OR REPLACE TEMP VIEW orders_frete AS
SELECT
	A.*,
	B.freight
FROM orders_price AS A
LEFT JOIN orders  AS B ON A.order_id = B.order_id;

SELECT * FROM orders_frete;

/*CREATE OR REPLACE TEMP VIEW total_orders AS*/
SELECT
	order_id,
	ROUND(SUM(unit_price * quantity * (1 - discount)) + AVG(freight)) AS total_order_price
FROM orders_frete
GROUP BY 1
ORDER BY 1;


/* VOLTANDO OS DADOS NA TABELA ORIGINAL*/
SELECT
	A.*,
	B.total_order_price
FROM orders_frete AS A
LEFT JOIN total_orders AS B ON A.order_id = B.order_id;

/* MAneira Otimizada*/

SELECT
	A.order_id,
	ROUND(SUM(B.unit_price * A.quantity * (1 - A.discount)) + AVG(C.freight)) AS total_order_price
FROM order_details AS A
LEFT JOIN products AS B ON A.product_id = B.product_id
LEFT JOIN orders   AS C ON A.order_id = C.order_id
GROUP BY 1
ORDER BY 1;


/*
2. Obtenha uma lista dos 10 clientes que realizaram o maior número de pedidos, bem como o número de pedidos de cada, 
ordenados em ordem decrescente de nº de pedidos.
*/

/*
COLUNAS:
customer_id
total_pedidos
*/

SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM products;
SELECT * FROM customers;

SELECT
	customer_id,
	COUNT(order_id) AS total_pedidos
FROM orders
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


/*
3. Obtenha uma tabela que contenha o id e o valor total do pedido e o nome do cliente que o realizou.
*/

SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM products;
SELECT * FROM customers;

CREATE OR REPLACE TEMP VIEW total_pedidos AS
SELECT
	A.order_id,
	ROUND(SUM(B.unit_price * A.quantity * (1 - A.discount)) + AVG(C.freight)) AS total_order_price
FROM order_details AS A
LEFT JOIN products AS B ON A.product_id = B.product_id
LEFT JOIN orders   AS C ON A.order_id = C.order_id
GROUP BY 1
ORDER BY 1;

CREATE OR REPLACE TEMP VIEW pedidos_clientes AS
SELECT
	A.order_id,
	B.company_name
FROM orders AS A
LEFT JOIN customers AS B ON A.customer_id = B.customer_id;

SELECT
	A.*,
	B.company_name
FROM total_pedidos AS A
LEFT JOIN pedidos_clientes AS B ON A.order_id = B.order_id;


/*
4. Obtenha uma tabela que contenha o país do cliente e o valor da compra que ele realizou.
*/

SELECT * FROM customers;

CREATE OR REPLACE TEMP VIEW pedidos_pais AS
SELECT
	A.order_id,
	B.country
FROM orders AS A
LEFT JOIN customers AS B ON A.customer_id = B.customer_id;

SELECT
	B.country,
	A.total_order_price
FROM total_pedidos AS A
LEFT JOIN pedidos_pais AS B ON A.order_id = B.order_id;

/*
5. Obtenha uma tabela que contenha uma lista dos países dos clientes e o valor total de compras realizadas em cada um dos países. 
Ordene a tabela, na order descrescente, considerando o valor total de compras realizadas por país.
*/

SELECT
	B.country,
	SUM(A.total_order_price) AS total_pais
FROM total_pedidos AS A
LEFT JOIN pedidos_pais AS B ON A.order_id = B.order_id
GROUP BY 1
ORDER BY 2 DESC;

/*
6. Obtenha uma tabela com o valor médio das vendas em cada mês 
(ordenados do mês com mais vendas para o mês com menos vendas)
*/


CREATE OR REPLACE TEMP VIEW total_pedidos AS
SELECT
	A.order_id,
	ROUND(SUM(B.unit_price * A.quantity * (1 - A.discount)) + AVG(C.freight)) AS total_order_price
FROM order_details AS A
LEFT JOIN products AS B ON A.product_id = B.product_id
LEFT JOIN orders   AS C ON A.order_id = C.order_id
GROUP BY 1
ORDER BY 1;

SELECT * FROM orders;

SELECT
	TO_CHAR(B.order_date, 'YYYY-MM') AS safra,
	ROUND(AVG(A.total_order_price))  AS media_mes
FROM total_pedidos AS A
LEFT JOIN orders   AS B ON A.order_id = B.order_id
GROUP BY 1
ORDER BY 2 DESC;
	








.