/* Best-performing channel by ROAS */

WITH total_ad_spend AS(
	SELECT	sales_channel,
			SUM(spend) AS ad_spend
	FROM ad_spend
	GROUP BY sales_channel
),
	total_revenue AS(
	SELECT	o.sales_channel AS channel,
			SUM(oi.unit_price * oi.quantity - oi.discount_amount) AS revenue
	FROM orders o
	JOIN order_items oi ON o.order_id = oi.order_id
	GROUP BY channel
)
SELECT	r.channel,
		r.revenue,
		ad_spend,
		r.revenue / NULLIF(a.ad_spend,0) AS roas        
FROM total_revenue r
LEFT JOIN total_ad_spend a ON r.channel = a.sales_channel
GROUP BY r.channel, r.revenue, a.ad_spend
ORDER BY roas DESC
LIMIT 1;

		