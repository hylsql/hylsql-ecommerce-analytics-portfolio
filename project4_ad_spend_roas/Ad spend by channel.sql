/* Ad spend by channel */

SELECT	sales_channel,
		SUM(spend) AS total_ad_spend
FROM ad_spend
GROUP BY sales_channel
ORDER BY total_ad_spend DESC;