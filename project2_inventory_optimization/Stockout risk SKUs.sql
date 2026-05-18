/* Stockout risk SKUs */

WITH sales AS(
	SELECT	product_id,
			SUM(quantity) AS units_sold
	FROM order_items
	GROUP BY product_id
),
inventory_summary AS(
	SELECT	product_id,
			SUM(quantity_on_hand) AS inventory_units
	FROM inventory
	GROUP BY product_id
)
SELECT	p.sku,
		p.product_name,
		p.category,
		COALESCE(s.units_sold, 0) AS units_sold,
		COALESCE(i.inventory_units, 0) AS inventory_units
FROM products p
LEFT JOIN inventory_summary i ON i.product_id = p.product_id
LEFT JOIN sales s ON s.product_id = p.product_id
WHERE COALESCE(i.inventory_units, 0) < 20 AND COALESCE(s.units_sold, 0) >= 50
ORDER BY units_sold DESC;
