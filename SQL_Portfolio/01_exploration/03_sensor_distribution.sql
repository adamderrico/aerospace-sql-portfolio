--Number of readings per sensor type
SELECT sensor_type, COUNT (*) AS reading_count
FROM maintenance
GROUP BY sensor_type
ORDER BY reading_count DESC;