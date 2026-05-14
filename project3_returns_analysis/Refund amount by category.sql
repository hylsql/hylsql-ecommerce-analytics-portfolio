/* Refund amount by category */

SELECT	p.category,
		SUM(r.refund_amount) AS total_refunds
FROM products p
JOIN order_items oi ON oi.product_id = p.product_id
JOIN returns r ON oi.order_item_id = r.order_item_id
GROUP BY p.category
ORDER BY total_refunds DESC;

