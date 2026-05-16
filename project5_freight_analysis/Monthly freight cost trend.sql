/* Monthly freight cost trend */

SELECT	DATE_TRUNC('month', ship_date) AS month,
		SUM(freight_cost) AS total_freight_cost
FROM shipments
GROUP BY DATE_TRUNC('month', ship_date)
ORDER BY month;

