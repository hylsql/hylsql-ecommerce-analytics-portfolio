/* Inventory turnover by SKU */

SELECT	p.sku,
		p.product_name,
		p.category,
		SUM(i.quantity_on_hand) AS inventory_units,
		COALESCE(SUM(oi.quantity)) AS units_sold,
		COALESCE(SUM(oi.quantity))::numeric
		/ NULLIF(SUM(i.quantity_on_hand),0) AS inventory_turnover
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.sku, p.product_name, p.category
ORDER BY inventory_turnover DESC;

