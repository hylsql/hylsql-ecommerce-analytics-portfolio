/* Freight % of revenue by sales channel */

SELECT	o.sales_channel,
		SUM(s.freight_cost) AS shipping_cost,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue,
		SUM(s.freight_cost) * 100.0
		/ NULLIF(SUM(oi.unit_price * oi.quantity - oi.discount_amount),0) AS shipping_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN shipments s ON s.order_id = o.order_id
GROUP BY o.sales_channel
ORDER BY shipping_pct DESC;

