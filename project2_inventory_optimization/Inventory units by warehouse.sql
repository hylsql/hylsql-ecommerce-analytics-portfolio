/* Inventory units by warehouse */

SELECT	warehouse,
		SUM(quantity_on_hand) AS total_inventory
FROM inventory
GROUP BY warehouse
ORDER BY total_inventory DESC;