/* Revenue by order */

SELECT	o.order_id,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY o.order_id;