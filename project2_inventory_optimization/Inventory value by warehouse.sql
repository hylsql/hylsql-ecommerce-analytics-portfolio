/* Inventory value by warehouse */

SELECT	i.warehouse,
		SUM(i.quantity_on_hand) AS total_inventory,
		SUM(i.quantity_on_hand * p.standard_cost) AS inventory_value		
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY i.warehouse
ORDER BY inventory_value DESC;

