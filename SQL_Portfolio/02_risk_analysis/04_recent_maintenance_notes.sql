-- Rows that include maintenance history
SELECT *
FROM maintenance
WHERE maintenance_history IS NOT NULL
AND maintenance_history <> '';