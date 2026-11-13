-- Query 1: Single-Column Grouping (Count per Complaint Description)
SELECT 
    complaint_description,
    COUNT(*) AS total_requests
FROM 
    `bigquery-public-data.austin_311.311_service_requests`
GROUP BY 
    complaint_description
ORDER BY 
    total_requests DESC;


-- Query 2: Multi-Column Grouping (Breakdown by Description and Status)
SELECT 
    complaint_description,
    status,
    COUNT(*) AS request_count
FROM 
    `bigquery-public-data.austin_311.311_service_requests`
GROUP BY 
    complaint_description,
    status
ORDER BY 
    request_count DESC;

-- Query 3: Numeric Aggregations (Average Latitude & Longitude per Complaint)
SELECT 
    complaint_description,
    COUNT(*) AS total_requests,
    AVG(latitude) AS avg_latitude,
    AVG(longitude) AS avg_longitude
FROM 
    `bigquery-public-data.austin_311.311_service_requests`
WHERE 
    latitude IS NOT NULL 
    AND longitude IS NOT NULL
GROUP BY 
    complaint_description
ORDER BY 
    total_requests DESC;

-- Query 4: Comprehensive Numeric Aggregations (SUM, MIN, MAX) per Station
SELECT 
    start_station_name,
    COUNT(*) AS total_trips,
    SUM(duration_minutes) AS total_duration_minutes,
    MIN(duration_minutes) AS shortest_trip_minutes,
    MAX(duration_minutes) AS longest_trip_minutes
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    duration_minutes > 0 
    AND start_station_name IS NOT NULL
GROUP BY 
    start_station_name
ORDER BY 
    total_trips DESC;