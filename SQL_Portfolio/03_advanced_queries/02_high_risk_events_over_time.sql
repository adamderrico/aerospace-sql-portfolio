--High-risk events per day
SELECT DATE (timestamp) AS reading_date,
	COUNT (*) AS high_risk_events
FROM maintenance
WHERE label = 'HighRisk'
GROUP BY DATE(timestamp)
ORDER BY reading_date;