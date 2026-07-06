SELECT
	cr."CURSO_ID" AS ID_Curso,
	cr."CURSO" AS Curso,
	COUNT(fv."VENTA_ID") AS N_Ventas,
	SUM(fv."PRECIO_NETO") AS T_Vendido

FROM fact_ventas AS fv

LEFT JOIN cursos AS cr
	ON fv."CURSO_ID" = cr."CURSO_ID"

GROUP BY ID_Curso, Curso

ORDER BY N_Ventas DESC, T_Vendido DESC;
