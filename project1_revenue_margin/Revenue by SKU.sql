/* Revenue by SKU */

SELECT	p.sku,
		p.product_name,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.sku, p.product_name
ORDER BY revenue DESC;

