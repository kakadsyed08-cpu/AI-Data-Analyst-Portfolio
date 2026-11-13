-- query 1: Find station names with more than 1000 trips
SELECT 
    start_station_name,
    COUNT(*) AS total_trips
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    start_station_name IS NOT NULL
GROUP BY 
    start_station_name
HAVING 
    COUNT(*) > 1000
ORDER BY 
    total_trips DESC;

-- query 2: Advanced HAVING filtering by multiple aggregate metrics
SELECT 
    start_station_name,
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
    COUNT(*) >= 100
    AND AVG(duration_minutes) > 15
ORDER BY 
    avg_duration_minutes DESC;

-- query 3: Write a query to find stations with more than 500 trips
SELECT
     start_station_name AS station_name,
     COUNT(*) AS total_trips
FROM
     `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE
      start_station_name IS NOT NULL
GROUP BY
      start_station_name
HAVING
      total_trips > 500
ORDER BY
      total_trips DESC; 

-- query 4 : Find subscriber types where the total volume is high, and the average trip duration exceeds 15 minutes
SELECT
     subscriber_type,
     COUNT(*) as total_trips,
     ROUND(avg(duration_minutes),2) as average_trip_duration
FROM
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
     subscriber_type IS NOT NULL
GROUP BY 
     subscriber_type
HAVING 
     average_trip_duration > 15
ORDER BY 
     total_trips desc, average_trip_duration desc