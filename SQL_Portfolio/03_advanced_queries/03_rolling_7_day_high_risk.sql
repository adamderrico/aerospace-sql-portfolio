--Rolling 7-day average of high-risk events
WITH daily_risk AS (
	SELECT DATE(timestamp) AS reading_date,
		COUNT(*) AS high_risk_events
	FROM maintenance
	WHERE label = 'HighRisk'
	GROUP BY DATE(timestamp)
)
SELECT
	reading_date,
	high_risk_events,
	AVG(high_risk_events) OVER (
		ORDER BY reading_date
		ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
	) AS rolling_avg_7
FROM daily_risk
ORDER BY reading_date;