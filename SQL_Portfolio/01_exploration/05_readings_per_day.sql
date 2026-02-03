--Total readings per day
SELECT DATE(timestamp) AS reading_date, COUNT (*) AS total_readings
FROM maintenance
GROUP BY DATE(timestamp)
ORDER BY reading_date;