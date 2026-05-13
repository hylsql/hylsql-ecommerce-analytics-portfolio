/* Inventory value by category */

SELECT	p.category,
		SUM(i.quantity_on_hand) AS total_inventory,
		SUM(i.quantity_on_hand * p.standard_cost) AS inventory_value		
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY p.category
ORDER BY inventory_value DESC;

