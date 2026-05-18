/* Full SKU-level inventory KPI table */

WITH sales AS (
    SELECT	product_id,
			SUM(quantity) AS units_sold,
			SUM(quantity * unit_price - discount_amount) AS revenue
	FROM order_items
    GROUP BY product_id
),

inventory_summary AS (
    SELECT	product_id,
			SUM(quantity_on_hand) AS inventory_units
    FROM inventory
    GROUP BY product_id
)

SELECT	p.sku,
    	p.product_name,
    	p.category,
		COALESCE(i.inventory_units, 0) AS inventory_units,
		COALESCE(s.units_sold, 0) AS units_sold,
		COALESCE(s.revenue, 0) AS revenue,
		COALESCE(s.units_sold, 0) * p.standard_cost AS cogs,
		COALESCE(s.revenue, 0) - COALESCE(s.units_sold, 0) * p.standard_cost AS gross_margin,
		COALESCE(i.inventory_units, 0) * p.standard_cost AS inventory_value,
		COALESCE(s.units_sold, 0)::numeric / NULLIF(COALESCE(i.inventory_units, 0), 0) AS inventory_turnover,
		365 / 
		NULLIF(COALESCE(s.units_sold, 0)::numeric / NULLIF(COALESCE(i.inventory_units, 0), 0), 0) AS days_on_hand
FROM products p
LEFT JOIN inventory_summary i ON p.product_id = i.product_id
LEFT JOIN sales s ON p.product_id = s.product_id
ORDER BY days_on_hand DESC;
