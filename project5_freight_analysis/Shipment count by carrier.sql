/* Shipment count by carrier */

SELECT	carrier,
		COUNT(*) AS shipment_count
FROM shipments
GROUP BY carrier
ORDER BY shipment_count DESC;
