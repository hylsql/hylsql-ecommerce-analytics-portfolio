/* Return rate by SKU */

SELECT	p.sku,
		p.product_name,
		p.category,
		SUM(oi.quantity) AS units_sold,
		COALESCE(SUM(r.return_quantity),0) AS retruned_units,
		COALESCE(SUM(r.return_quantity),0)::numeric
		/ NULLIF(SUM(oi.quantity),0) AS return_rate
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id
GROUP BY p.sku, p.product_name, p.category
ORDER BY return_rate DESC;

