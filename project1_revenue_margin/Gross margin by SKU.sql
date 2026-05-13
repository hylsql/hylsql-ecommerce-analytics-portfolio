/* Gross margin by SKU */

SELECT	p.sku,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue,
		SUM(p.standard_cost) AS cost,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount - p.standard_cost) AS gross_margin
FROM products p
JOIN order_items oi ON p.product_id = oi.order_item_id
GROUP BY p.sku
ORDER BY gross_margin DESC;