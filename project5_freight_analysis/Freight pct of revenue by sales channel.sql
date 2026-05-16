/* Freight % of revenue by sales channel */

WITH order_revenue AS (
    SELECT
        order_id,
        SUM(quantity * unit_price - discount_amount) AS revenue
    FROM order_items
    GROUP BY order_id
),
	order_frights AS(
	SELECT	order_id,
	SUM(freight_cost) AS freight_cost
    FROM shipments
    GROUP BY order_id
	)
SELECT	o.sales_channel,
		SUM(ofr.freight_cost) AS shipping_cost,
		SUM(orv.revenue) AS revenue,
		SUM(ofr.freight_cost) / NULLIF(SUM(orv.revenue), 0) AS freight_pct
FROM orders o
JOIN order_revenue orv ON o.order_id = orv.order_id
JOIN order_frights ofr ON ofr.order_id = o.order_id
GROUP BY o.sales_channel
ORDER BY shipping_cost DESC;

