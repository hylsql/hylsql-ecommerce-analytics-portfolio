/* Products with high return rate and meaningful sales volume */

SELECT	p.sku,
		p.product_name,
		p.category,
		SUM(oi.quantity) AS units_sold,
		COALESCE(SUM(r.return_quantity),0) AS units_returned,
		COALESCE(SUM(r.return_quantity),0)::numeric
		/ NULLIF(SUM(oi.quantity),0) AS return_rate
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id
GROUP BY p.sku, p.product_name, p.category
HAVING SUM(oi.quantity) >= 10
ORDER BY return_rate DESC
LIMIT 20;

