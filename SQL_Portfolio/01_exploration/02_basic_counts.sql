SELECT
--Count total rows in a dataset
(SELECT COUNT(*) FROM maintenance)AS total_rows,

--Count distinct sensors
(SELECT COUNT(DISTINCT sensor_id) FROM maintenance) AS unique_sensors,

--Count distinct sensor types
(SELECT COUNT(DISTINCT sensor_type) FROM maintenance) AS unique_sensor_type
;
