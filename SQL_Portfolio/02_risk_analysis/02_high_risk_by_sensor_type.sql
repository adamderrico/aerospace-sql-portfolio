--High-risk readings grouped by sensor
SELECT sensor_type,
	COUNT (*) AS high_risk_count
FROM maintenance
GROUP BY sensor_type
ORDER BY high_risk_count DESC;