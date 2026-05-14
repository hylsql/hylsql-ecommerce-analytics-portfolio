/* Monthly refund trend */

 SELECT	DATE_TRUNC('month', r.return_date) AS return_month,
		SUM(r.refund_amount) AS total_refunds,
		SUM(r.return_quantity) AS units_returned,
		COUNT(*) AS return_count
FROM returns r
GROUP BY DATE_TRUNC('month', r.return_date)
ORDER BY return_month;