-- Query 1: Top 10 Busiest Bikeshare Starting Stations
SELECT 
    start_station_name AS station_name,
    COUNT(*) AS total_trips,
    ROUND(AVG(duration_minutes), 2) AS avg_duration_minutes
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    start_station_name IS NOT NULL
    AND duration_minutes > 0
GROUP BY 
    start_station_name
ORDER BY 
    total_trips DESC,
    avg_duration_minutes DESC
LIMIT 10;


-- Query 2: Bottom 5 Least-Frequented Stations (with Minimum Activity Threshold)
SELECT 
    start_station_name AS station_name,
    COUNT(*) AS total_trips,
    ROUND(AVG(duration_minutes), 2) AS avg_duration_minutes
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    start_station_name IS NOT NULL
    AND duration_minutes > 0
GROUP BY 
    start_station_name
HAVING 
    total_trips >= 10              -- Step 1: Filter out test/noise stations using HAVING
ORDER BY 
    total_trips ASC,               -- Step 2: Ascending order for Bottom-N reporting
    station_name ASC               -- Step 3: Deterministic tie-breaker
LIMIT 5;                           -- Step 4: Restrict to exactly 5 rows


-- Query 3: Top-5 Ending Stations Report
SELECT 
    end_station_name AS End_Stations,
    COUNT(*) AS Total_Trips,
    ROUND(AVG(duration_minutes), 2) AS Avg_Duration_Minutes
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    end_station_name IS NOT NULL
    AND duration_minutes > 0
GROUP BY 
    end_station_name
HAVING 
    COUNT(*) >= 50
ORDER BY 
    Total_Trips DESC,
    Avg_Duration_Minutes DESC
LIMIT 5;