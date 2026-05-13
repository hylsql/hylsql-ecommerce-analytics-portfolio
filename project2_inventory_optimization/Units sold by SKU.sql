/* Units sold by SKU */

SELECT	p.sku,
		p.product_name,
		p.category,
		SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.sku, p.product_name, p.category
ORDER BY units_sold DESC;

