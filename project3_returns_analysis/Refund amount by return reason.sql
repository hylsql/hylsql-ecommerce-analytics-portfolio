/* Refund amount by return reason */

SELECT	return_reason,
		SUM(refund_amount) AS total_refund,
		COUNT(*) AS return_count
FROM returns
GROUP BY return_reason
ORDER BY total_refund DESC;

