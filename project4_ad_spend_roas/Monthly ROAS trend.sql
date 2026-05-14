/* Monthly ROAS trend */

WITH monthly_ad_spend AS(
	SELECT	DATE_TRUNC('month', ad_date) AS month,
			SUM(spend) AS total_ad_spend
	FROM ad_spend
	GROUP BY DATE_TRUNC('month', ad_date)
),
	monthly_revenue AS(
	SELECT	DATE_TRUNC('month', o.order_date) AS month,
			SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
	FROM orders o
	JOIN order_items oi ON o.order_id = oi.order_id
	GROUP BY DATE_TRUNC('month', o.order_date)
)
SELECT	r.month,
		r.revenue,
		a.total_ad_spend,
		r.revenue / NULLIF(a.total_ad_spend,0) AS roas
FROM monthly_revenue r
LEFT JOIN monthly_ad_spend a ON r.month = a.month
ORDER BY r.month;

		