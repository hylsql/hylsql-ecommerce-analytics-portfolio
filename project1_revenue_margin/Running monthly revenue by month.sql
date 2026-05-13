/* Running monthly revenue*/

WITH monthly AS(
	SELECT	DATE_TRUNC('month', o.order_Date) AS month,
			SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
	FROM orders o
	JOIN order_items oi ON o.order_id = oi.order_id
	GROUP BY DATE_TRUNC('month', o.order_Date)
)
SELECT	month,
		revenue,
		SUM(revenue) OVER(ORDER BY month) AS running_revenue
FROM monthly;
