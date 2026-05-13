/* Revenue by category */

SELECT	p.category,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

