--Compare risk levels for rows with and without maintenance
SELECT 
	CASE
		WHEN maintenance_history IS NULL OR maintenance_history = '' THEN 'No Maintenance Notes'
		ELSE 'Has Maintenance Notes'
	END AS maintenance_status,
	COUNT (*) FILTER (WHERE label = 'HighRisk') AS high_risk_count,
	COUNT (*) FILTER (WHERE label = 'LowRisk') AS low_risk_count
FROM maintenance
GROUP BY maintenance_status;