/* Return rate by sales channel */

SELECT	o.sales_channel,
		SUM(oi.quantity) AS units_sold,
		COALESCE(SUM(r.return_quantity),0) AS retruned_units,
		COALESCE(SUM(r.return_quantity),0)::numeric
		/ NULLIF(SUM(oi.quantity),0) AS return_rate
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id
GROUP BY o.sales_channel
ORDER BY return_rate DESC;

