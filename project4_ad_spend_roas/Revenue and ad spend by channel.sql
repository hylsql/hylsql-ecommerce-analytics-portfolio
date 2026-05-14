/* Revenue and ad spend by channel */

WITH revenue_by_channel AS (
	SELECT	o.sales_channel AS channel,
			SUM(oi.quantity * oi.unit_price - oi.discount_amount) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.sales_channel
),
ad_spend_by_channel AS (
    SELECT	sales_channel,
			SUM(spend) AS ad_spend
    FROM ad_spend
    GROUP BY sales_channel
)
SELECT
    r.channel,
    r.revenue,
    a.ad_spend
FROM revenue_by_channel r
LEFT JOIN ad_spend_by_channel a
    ON r.channel = a.sales_channel
ORDER BY r.revenue DESC;