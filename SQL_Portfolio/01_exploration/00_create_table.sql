--Recreate the table for the aircraft maintenance dataset
DROP TABLE IF EXISTS maintenance;
CREATE TABLE maintenance (
	idx INT,
	timestamp TIMESTAMP,
	sensor_id TEXT, 
	sensor_type TEXT,
	reading_value TEXT, 
	operational_parameter TEXT, 
	maintenance_history TEXT,
	label TEXT
);
