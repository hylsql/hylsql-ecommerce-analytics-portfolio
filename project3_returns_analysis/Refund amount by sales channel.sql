/* Refund amount by sales channel */

SELECT	o.sales_channel,
		SUM(r.refund_amount) AS total_refund
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id
GROUP BY o.sales_channel
ORDER BY total_refund DESC;



