/* Average shipping cost by carrier */

SELECT	carrier,
		AVG(freight_cost) AS avg_shipping_cost
FROM shipments
GROUP BY carrier
ORDER BY avg_shipping_cost DESC;
