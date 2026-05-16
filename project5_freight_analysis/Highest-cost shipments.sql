/* Highest-cost shipments */

SELECT	order_id,
		carrier,
		SUM(freight_cost) AS total_freight_cost
FROM shipments
GROUP BY order_id, carrier
ORDER BY total_freight_cost DESC
LIMIT 20;

