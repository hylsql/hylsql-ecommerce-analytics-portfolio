/* Revenue by sales channel */

SELECT	o.sales_channel,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
GROUP BY o.sales_channel
ORDER BY revenue DESC;