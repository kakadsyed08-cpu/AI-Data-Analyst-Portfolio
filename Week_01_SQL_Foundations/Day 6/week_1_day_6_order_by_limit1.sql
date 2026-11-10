SELECT 
    date,
    primary_type,
    description,
    location_description,
    arrest
FROM 
    `bigquery-public-data.chicago_crime.crime`
WHERE 
    arrest = TRUE
ORDER BY 
    primary_type ASC,
    date DESC
LIMIT 15;