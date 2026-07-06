SELECT
	DISTINCT(rv."RESPONSABLE_VENTA") AS Vendedor,
	COUNT(fv."VENTA_ID") AS T_Ventas,
	SUM(fv."PRECIO_NETO") AS T_Vendido

FROM fact_ventas AS fv

LEFT JOIN clientes as cl
	ON fv."CLIENTE_ID" = cl."CLIENTE_ID"
LEFT JOIN responsable_venta as rv
	ON rv."RESPONSABLE_VENTA_ID" = fv."RESPONSABLE_VENTA_ID"
LEFT JOIN genero as gn
	ON gn."GENERO_ID" = cl."GENERO_ID"

GROUP BY Vendedor

ORDER BY T_Ventas DESC, T_Vendido DESC
;