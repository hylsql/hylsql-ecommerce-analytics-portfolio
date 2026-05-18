/* TOP 20 SKUs by inventory value */

SELECT	p.sku,
		p.product_name,
		p.category,
		SUM(i.quantity_on_hand) AS inventory_units,
		p.standard_cost,
		SUM(i.quantity_on_hand * p.standard_cost) AS inventory_value
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.sku, p.product_name, p.category, p.standard_cost
ORDER BY inventory_value DESC
LIMIT 20;