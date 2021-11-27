/* Dropar a tabela caso exista*/
DROP TABLE IF EXISTS tb_produtos;

/*Criando uma tabela*/
CREATE TABLE tb_produtos(
	id SERIAL NOT NULL,
	nome_produto varchar(40),
	valor_produto numeric(16,2),
	data_compra date);

/*
Alterando a tabela de dados
ALTER TABLE tb_produtos ADD nome_fabricante varchar(50);
*/

/*
Visualizando os dados da tabela*/
SELECT * FROM tb_produtos;