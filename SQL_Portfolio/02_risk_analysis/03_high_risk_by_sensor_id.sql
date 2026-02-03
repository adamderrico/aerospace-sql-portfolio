--High-risk events by individual sensor
SELECT sensor_id,
	COUNT (*) AS high_risk_events
FROM maintenance
WHERE label = 'HighRisk'
GROUP BY sensor_id
ORDER BY high_risk_events DESC;