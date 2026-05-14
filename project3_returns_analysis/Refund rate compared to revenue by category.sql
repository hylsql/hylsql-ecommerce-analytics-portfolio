/* Refund rate compared to revenue by category */

SELECT	p.category,
		SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue,
		COALESCE(SUM(r.refund_amount),0) AS total_refunds,
		COALESCE(SUM(r.refund_amount),0)::numeric
		/ NULLIF(SUM(oi.unit_price * oi.quantity - oi.discount_amount),0) AS refund_rate
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN returns r ON r.order_item_id = oi.order_item_id
GROUP BY p.category
ORDER BY refund_rate DESC;

