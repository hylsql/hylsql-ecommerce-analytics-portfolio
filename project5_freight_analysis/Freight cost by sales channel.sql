/* Freight cost by sales channel */

SELECT	o.sales_channel,
		SUM(s.freight_cost) AS total_shipping_cost
FROM orders o
JOIN shipments s ON s.order_id = o.order_id
GROUP BY o.sales_channel
ORDER BY total_shipping_cost DESC;