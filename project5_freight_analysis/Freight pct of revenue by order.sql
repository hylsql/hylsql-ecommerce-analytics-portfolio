/* Freight % of revenue by order */

WITH order_revenue AS (
    SELECT	order_id,
			SUM(quantity * unit_price - discount_amount) AS revenue
    FROM order_items
    GROUP BY order_id
),
order_freight AS (
    SELECT	order_id,
			SUM(freight_cost) AS freight_cost
    FROM shipments
    GROUP BY order_id
)
SELECT	o.order_id,
		o.sales_channel,
		COALESCE(f.freight_cost, 0) AS freight_cost,
		r.revenue,
		COALESCE(f.freight_cost, 0) / NULLIF(r.revenue, 0) AS freight_pct
FROM orders o
JOIN order_revenue r ON o.order_id = r.order_id
LEFT JOIN order_freight f ON o.order_id = f.order_id
ORDER BY freight_pct DESC;
