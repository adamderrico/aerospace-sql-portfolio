--Final Insights: Identify sensors that show both elevated readings
--and disproportionately high-risk behavior
WITH sensor_stats AS (
	SELECT
		sensor_id,
		sensor_type,
		--Safely compute average reading
		AVG(
			CASE
				WHEN reading_value ~ '^[0-9.+-]+$' THEN reading_value::FLOAT
				ELSE NULL
			END
		) AS avg_reading,
		COUNT (*) AS total_readings,
		COUNT (*) FILTER (WHERE label = 'HighRisk') AS high_risk_events
	FROM maintenance
	GROUP BY sensor_id, sensor_type
),

global_stats AS (
	SELECT
		AVG(avg_reading::FLOAT) AS global_avg_reading,
		AVG(high_risk_events) AS global_avg_risk
	FROM sensor_stats
),

ranked_sensors AS (
	SELECT
		s.sensor_id,
		s.sensor_type,
		s.avg_reading,
		s.high_risk_events,
		s.total_readings,
		--Compare each sensor to global averages
		CASE WHEN s.avg_reading > g.global_avg_reading THEN 'Above Avg Reading'
			ELSE 'Normal Reading'
		END AS reading_status,
		CASE WHEN s.high_risk_events > g.global_avg_risk THEN 'Above Avg Risk'
			ELSE 'Normal Risk'
		END AS risk_status,
		--Rank sensors by high-risk contribution
		RANK() OVER (ORDER BY s.high_risk_events DESC) AS risk_rank
	FROM sensor_stats s
	CROSS JOIN global_stats g
)

SELECT *
FROM ranked_sensors
WHERE reading_status = 'Above Avg Reading'
   OR risk_status = 'Above Avg Risk'
ORDER BY risk_rank, avg_reading DESC;