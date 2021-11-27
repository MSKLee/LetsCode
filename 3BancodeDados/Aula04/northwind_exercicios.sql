/*
Exercícios
*/

SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM products;
SELECT * FROM customers;

/*
1. Obtenha uma tabela que contenha o id do pedido e o valor total do mesmo.
*/

/* Consulta de dados da tabela*/
/* Preço Unitário na Tabela "products"*/
CREATE OR REPLACE VIEW products_price AS
SELECT
	product_id,
	unit_price
FROM products;

/* Frete na Tabela "orders"*/
CREATE OR REPLACE VIEW products_freight AS
SELECT
	order_id,
	freight
FROM orders;


/* Solução Exercício 1 */
SELECT orders.order_id,
ROUND(SUM((products.unit_price * order_details.quantity * (1 - order_details.discount))) + AVG(orders.freight)) as total_order_price

FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id
LEFT JOIN products ON order_details.product_id = products.product_id

GROUP BY orders.order_id
ORDER BY orders.order_id;



/*
2. Obtenha uma lista dos 10 clientes que realizaram o maior número de pedidos, bem como o número de pedidos de cada, ordenados em ordem decrescente de nº de pedidos.
*/

/* Solução Exercício 2 */
SELECT customers.company_name,
COUNT(order_details.product_id)
FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id

GROUP BY order_details.order_id, customers.company_name
ORDER BY count DESC
LIMIT 10;



/*
3. Obtenha uma tabela que contenha o id e o valor total do pedido e o nome do cliente que o realizou.
*/

/* Solução Exercício 3 */
SELECT 
	orders.order_id,
	customers.contact_name,
	
ROUND(SUM((products.unit_price * order_details.quantity * (1 - order_details.discount))) + AVG(orders.freight)) as total_order_price

FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id
LEFT JOIN products ON order_details.product_id = products.product_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY orders.order_id, customers.contact_name
ORDER BY contact_name;

/*
4. Obtenha uma tabela que contenha o país do cliente e o valor da compra que ele realizou.
*/


/* Solução Exercício 4 */

SELECT 
	customers.country,
	customers.contact_name,
	
ROUND(SUM((products.unit_price * order_details.quantity * (1 - order_details.discount))) + AVG(orders.freight)) as total_order_price

FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id
LEFT JOIN products ON order_details.product_id = products.product_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.contact_name, customers.country
ORDER BY country;


/*
5. Obtenha uma tabela que contenha uma lista dos países dos clientes e o valor total de compras realizadas em cada um dos países. Ordene a tabela, na order descrescente, considerando o valor total de compras realizadas por país.
*/

/* Solução Exercício 5 */

SELECT 
	customers.country,
	
ROUND(SUM((products.unit_price * order_details.quantity * (1 - order_details.discount))) + AVG(orders.freight)) as total_order_price

FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id
LEFT JOIN products ON order_details.product_id = products.product_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customers.country
ORDER BY total_order_price DESC;


/*
6. Obtenha uma tabela com o valor médio das vendas em cada mês (ordenados do mês com mais vendas para o mês com menos vendas)
*/

SELECT
	DATE_PART('month', orders.order_date),
	
ROUND((SUM((products.unit_price * order_details.quantity * (1 - order_details.discount))) + AVG(orders.freight)) / COUNT(orders.order_id)) as mean_order_price

FROM orders
LEFT JOIN order_details ON orders.order_id = order_details.order_id
LEFT JOIN products ON order_details.product_id = products.product_id
GROUP BY DATE_PART('month', orders.order_date)
ORDER BY 2 DESC;
