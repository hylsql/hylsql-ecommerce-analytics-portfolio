/* Gross margin % by category */

WITH margin AS(
	SELECT	p.category,
			SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue,
			SUM(p.standard_cost * oi.quantity) AS cost
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
)
SELECT	category,
		cost,
		revenue,
		revenue - cost AS gross_margin,
		(revenue - cost) / NULLIF(revenue,0) AS gross_margin_pct
FROM margin
ORDER BY gross_margin_pct DESC;
