DROP TABLE funcionarios;

CREATE TABLE funcionarios (
	funcionarios_ID INT NOT NULL,
	nome_funcionario VARCHAR(50),
	departamento VARCHAR(50),
	senioridade VARCHAR(20),
	tempo_exp INT,
	salario DECIMAL(9,2)
);

INSERT INTO funcionarios VALUES (10, 'Pedro', 'Analytics', 'Pleno', 3, 7000);
INSERT INTO funcionarios VALUES (11, 'Sarah', 'Comercial', 'Senior', 6, 7000);
INSERT INTO funcionarios VALUES (12, 'Sofia', 'Analytics', 'Junior', 1, 5000);
INSERT INTO funcionarios VALUES (13, 'Hanna', 'Comercial', 'Junior', 0, 3000);
INSERT INTO funcionarios VALUES (14, 'Luiza', 'Analytics', 'Pleno', 8, 7000);
INSERT INTO funcionarios VALUES (15, 'Lucas', 'Analytics', 'Junior', 2, 5000);
INSERT INTO funcionarios VALUES (16, 'Amanda', 'Data Science', 'Senior', 4, 11000);
INSERT INTO funcionarios VALUES (17, 'Paulo', 'Comercial', 'Senior', 7, 7000);
INSERT INTO funcionarios VALUES (18, 'Marcos', 'Data Science', 'Pleno', 5, 8000);
INSERT INTO funcionarios VALUES (19, 'Adriano', 'Analytics', 'Pleno', 4, 7000);
INSERT INTO funcionarios VALUES (20, 'Tiago', 'Data Science', 'Senior', 10, 11000);
INSERT INTO funcionarios VALUES (21, 'Juliana', 'Data Science', 'Junior', 2, 6000);
INSERT INTO funcionarios VALUES (22, 'Sergio', 'Data Science', 'Senior', 6, 11000);
INSERT INTO funcionarios VALUES (23, 'Sonia', 'Comercial', 'Senior', 8, 7000);
INSERT INTO funcionarios VALUES (24, 'Chen', 'Data Science', 'Pleno', 4, 8000);
INSERT INTO funcionarios VALUES (25, 'Ana', 'Comercial', 'Pleno', 6, 5000);
INSERT INTO funcionarios VALUES (26, 'Julia', 'Comercial', 'Senior', 6, 7000);
INSERT INTO funcionarios VALUES (27, 'Anderson', 'Data Science', 'Senior', 12, 11000);
INSERT INTO funcionarios VALUES (28, 'Leandro', 'Analytics', 'Pleno', 3, 7000);
INSERT INTO funcionarios VALUES (29, 'Rafael', 'Comercial', 'Senior', 5, 7000);
INSERT INTO funcionarios VALUES (30, 'André', 'Analytics', 'Senior', 8, 9000);
INSERT INTO funcionarios VALUES (31, 'João', 'Comercial', 'Senior', 9, 7000);
INSERT INTO funcionarios VALUES (32, 'Jessica', 'Comercial', 'Junior', 0, 3000);
INSERT INTO funcionarios VALUES (33, 'Henrique', 'Data Science', 'Senior', 4, 11000);
INSERT INTO funcionarios VALUES (34, 'Paulo', 'Data Science', 'Pleno', 2, 8000);
INSERT INTO funcionarios VALUES (35, 'Ana', 'Data Science', 'Senior', 9, 11000);
INSERT INTO funcionarios VALUES (36, 'Simas', 'Analytics', 'Pleno', 2, 7000);
INSERT INTO funcionarios VALUES (37, 'Julio', 'Analytics', 'Junior', 0, 5000);
INSERT INTO funcionarios VALUES (38, 'Jorge', 'Comercial', 'Senior', 7, 7000);
INSERT INTO funcionarios VALUES (39, 'Elisa', 'Comercial', 'Pleno', 4, 5000);
INSERT INTO funcionarios VALUES (40, 'Rodrigo', 'Comercial', 'Junior', 2, 3000);

SELECT
	*
FROM funcionarios;

/* Tabela Cargos*/

DROP TABLE IF EXISTS cargos;

CREATE TABLE cargos(
	funcionarios_ID INT NOT NULL,
	cargo			VARCHAR(225));

/* Insert da tabela cargos */

INSERT INTO cargos VALUES (20, 'Cientistas');
INSERT INTO cargos VALUES (21, 'Analista');
INSERT INTO cargos VALUES (22, 'Cientistas');
INSERT INTO cargos VALUES (23, 'Cientistas');
INSERT INTO cargos VALUES (24, 'Cientistas');
INSERT INTO cargos VALUES (25, 'Analista');
INSERT INTO cargos VALUES (26, 'Analista');
INSERT INTO cargos VALUES (27, 'Analista');
INSERT INTO cargos VALUES (28, 'Analista');
INSERT INTO cargos VALUES (29, 'Analista');
INSERT INTO cargos VALUES (30, 'Cientistas');

SELECT
	*
FROM cargos


/* Testando os Joins */

SELECT
	*,
	B.cargo
FROM funcionarios AS A
INNER JOIN cargos AS B ON A.funcionarios_ID = B.funcionarios_ID;

/* LEFT JOIN*/

SELECT
	*,
	B.cargo
FROM funcionarios AS A
LEFT JOIN cargos AS B ON A.funcionarios_ID = B.funcionarios_ID;

/* RIGHT JOIN*/

SELECT
	*,
	B.cargo
FROM funcionarios AS A
RIGHT JOIN cargos AS B ON A.funcionarios_ID = B.funcionarios_ID;

/* FULL JOIN*/

SELECT
	*,
	B.cargo
FROM funcionarios AS A
FULL JOIN cargos AS B ON A.funcionarios_ID = B.funcionarios_ID;



/*UNION*/

DROP TABLE IF EXISTS cargos2;

CREATE TABLE cargos2(
	funcionarios_ID INT NOT NULL,
	cargo			VARCHAR(225));

/* Insert da tabela cargos */

INSERT INTO cargos2 VALUES (41, 'Especialista');
INSERT INTO cargos2 VALUES (42, 'Especialista');
INSERT INTO cargos2 VALUES (43, 'Gerente');
INSERT INTO cargos2 VALUES (44, 'Especialista');
INSERT INTO cargos2 VALUES (45, 'Gerente');
INSERT INTO cargos2 VALUES (46, 'Especialista');
INSERT INTO cargos2 VALUES (47, 'Especialista');
INSERT INTO cargos2 VALUES (48, 'Gerente');
INSERT INTO cargos2 VALUES (49, 'Gerente');
INSERT INTO cargos2 VALUES (50, 'Analista');

SELECT
	*
FROM cargos2

/*UNION*/

SELECT * FROM cargos
UNION
SELECT * FROM cargos2
ORDER BY 1;




