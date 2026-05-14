/* Returned units by SKU */

SELECT	p.sku,
		p.product_name,
		p.category,
		SUM(r.return_quantity) AS retruned_units,
		SUM(r.refund_amount) AS total_refund
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN returns r ON oi.order_item_id = r.order_item_id
GROUP BY p.sku, p.product_name, p.category
ORDER BY retruned_units DESC;

