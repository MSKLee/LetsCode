/* CASTING */

SELECT * FROM funcionarios;
SELECT * FROM cargos;

CREATE OR REPLACE TEMP VIEW func_cargos AS
SELECT
	A.*,
	B.cargo
FROM funcionarios AS A
LEFT JOIN cargos AS B ON A.funcionarios_ID = B.funcionarios_ID
ORDER BY 1;

SELECT * FROM func_cargos;

SELECT * FROM func_cargos;

SELECT
	*,
	CAST(salario AS CHAR(10)) AS salario_int
FROM func_cargos;


/* CASE */

CREATE OR REPLACE TEMP VIEW tempo_exp AS
SELECT
	tempo_exp,
	CASE WHEN tempo_exp <= 3 THEN '1 - Pouca Experiência'
		 WHEN tempo_exp <= 6 THEN '2 - Experiência Média' ELSE '3 - Muita Experiência'END AS cat_tempo_exp,
	cargo,
	CASE WHEN cargo IS NOT NULL THEN 1 ELSE 0 END AS tem_cargo
FROM func_cargos;

SELECT
	cat_tempo_exp,
	COUNT(*)
FROM tempo_exp
GROUP BY 1
ORDER BY 1;


SELECT
	senioridade,
	CASE WHEN senioridade IN ('Junior', 'Pleno') THEN 'Entry-level'ELSE senioridade END AS cat_senior
FROM func_cargos

/* Contagens com CASE WHEN */

SELECT
	COUNT(CASE WHEN cargo IS NOT NULL THEN 1 ELSE 0 END) AS total
FROM func_cargos;

SELECT
	COUNT(CASE WHEN cargo IS NOT NULL THEN cargo END) AS total
FROM func_cargos;

/* WINDOW FUNCTION */

SELECT
	funcionarios_ID,
	departamento,
	senioridade,
	salario,
	SUM(salario) OVER (PARTITION BY departamento, senioridade ORDER BY departamento, senioridade) as sum_salarios
FROM func_cargos;

SELECT
	funcionarios_ID,
	departamento,
	senioridade,
	salario,
	AVG(salario) OVER (PARTITION BY departamento ORDER BY senioridade) as avg_salarios
FROM func_cargos;

