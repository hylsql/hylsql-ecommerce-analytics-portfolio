/* Monthly return rate */

 SELECT	DATE_TRUNC('month', o.order_date) AS order_month,
		SUM(oi.quantity) AS units_sold,
		COALESCE(SUM(r.return_quantity),0) AS retruned_units,
		COALESCE(SUM(r.return_quantity),0)::numeric
		/ NULLIF(SUM(oi.quantity),0) AS return_rate
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY order_month;



