--Min and max reading values by sensor type
SELECT sensor_type,
	MIN(reading_value) AS min_value,
	MAX(reading_value) AS max_value
FROM maintenance
GROUP BY sensor_type
ORDER BY sensor_type;
