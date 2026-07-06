WITH ventas2026 AS (
	SELECT
		DISTINCT(cr."CURSO") as curso,
		COUNT(fv."VENTA_ID") as T_cursos,
		SUM(fv."PRECIO_NETO") as Total2026
	FROM fact_ventas as fv
	
	LEFT JOIN cursos as cr
		ON fv."CURSO_ID" = cr."CURSO_ID"
	
	WHERE fv."FECHA_DE_PAGO" >= '2026-01-01'
	AND fv."FECHA_DE_PAGO" <= '2026-12-31'
	
	GROUP BY 
		cr."CURSO"
	
	ORDER BY T_cursos DESC, Total2026 DESC
	),
ventas2025 AS (
	SELECT
		DISTINCT(cr."CURSO") as curso,
		COUNT(fv."VENTA_ID") as T_cursos,
		SUM(fv."PRECIO_NETO") as Total2025
	FROM fact_ventas as fv
	
	LEFT JOIN cursos as cr
		ON fv."CURSO_ID" = cr."CURSO_ID"
	
	WHERE fv."FECHA_DE_PAGO" >= '2025-01-01'
	AND fv."FECHA_DE_PAGO" <= '2025-12-31'
	
	GROUP BY 
		cr."CURSO"
	
	ORDER BY T_cursos DESC, Total2025 DESC
	),
ventas2024 AS (
	SELECT
		DISTINCT(cr."CURSO") as curso,
		COUNT(fv."VENTA_ID") as T_cursos,
		SUM(fv."PRECIO_NETO") as Total2024
	FROM fact_ventas as fv
	
	LEFT JOIN cursos as cr
		ON fv."CURSO_ID" = cr."CURSO_ID"
	
	WHERE fv."FECHA_DE_PAGO" >= '2024-01-01'
	AND fv."FECHA_DE_PAGO" <= '2024-12-31'
	
	GROUP BY 
		cr."CURSO"
	
	ORDER BY T_cursos DESC, Total2024 DESC
	)
SELECT
	COALESCE(v25.curso, v26.curso) AS Cursos,
	COALESCE(v24.T_cursos, 0) AS Cursos_2024,
	COALESCE(v24.Total2024, 0) AS Vendido_2024,
	COALESCE(v25.T_cursos, 0) AS Cursos_2025,
	COALESCE(v25.Total2025, 0) AS Vendido_2025,
	COALESCE(v26.T_cursos, 0) AS Cursos_2026,
	COALESCE(v26.Total2026, 0) AS Vendido_2026
	
FROM ventas2026 AS v26

FULL JOIN ventas2025 AS v25
	ON v26.curso = v25.curso
FULL JOIN ventas2024 AS v24
	ON v26.curso = v24.curso

;
	