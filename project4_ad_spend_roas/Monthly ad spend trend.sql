/* Monthly ad spend trend */

SELECT	DATE_TRUNC('month', ad_date) AS month,
		SUM(spend) AS total_ad_spend
FROM ad_spend
GROUP BY DATE_TRUNC('month', ad_date)
ORDER BY month;