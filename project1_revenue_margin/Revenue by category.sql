/* Revenue by sales channel */

SELECT	o.sales_channel,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.sales_channel
ORDER BY revenue DESC;

