/* Advertising cost as a % of revenue */

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
    a.ad_spend,
	COALESCE(a.ad_spend,0)::numeric * 100.0 
	/ NULLIF(r.revenue,0) AS ad_spend_pct
FROM revenue_by_channel r
LEFT JOIN ad_spend_by_channel a
    ON r.channel = a.sales_channel
ORDER BY ad_spend_pct DESC;