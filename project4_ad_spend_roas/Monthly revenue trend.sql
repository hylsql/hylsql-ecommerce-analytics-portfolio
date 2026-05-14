/* Monthly revenue trend */

SELECT	DATE_TRUNC('month', o.order_date) AS month,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_item_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;