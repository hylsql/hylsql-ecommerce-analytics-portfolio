/* SKUs with inventory but no sales */

SELECT	p.sku,
		p.product_name,
		p.category,
		SUM(i.quantity_on_hand) AS inventory_units
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.sku, p.product_name, p.category
HAVING SUM(i.quantity_on_hand) > 0 AND COUNT(oi.order_item_id) = 0
ORDER BY inventory_units DESC;

