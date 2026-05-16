/* Freight cost by carrier */

SELECT	carrier,
		SUM(freight_cost) AS total_freight_cost
FROM shipments
GROUP BY carrier
ORDER BY total_freight_cost DESC;
