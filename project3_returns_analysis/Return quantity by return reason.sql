/* Return quantity by return reason */

SELECT	return_reason,
		SUM(return_quantity) AS total_units_returned
FROM returns
GROUP BY return_reason
ORDER BY total_units_returned DESC;

