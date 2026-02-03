--Count of high-risk vs low-risk reading
SELECT label, COUNT (*) AS COUNT
FROM maintenance
GROUP BY label
ORDER BY count DESC;