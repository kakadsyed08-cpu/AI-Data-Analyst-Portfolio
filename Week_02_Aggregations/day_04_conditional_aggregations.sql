/*******************************************************************************
* Script Name: day_04_conditional_aggregations.sql
* Author: AI Data Analyst Portfolio Candidate
* Description: Week 2, Day 4 - Using CASE WHEN inside aggregates to pivot data
* Target Dataset: bigquery-public-data.austin_bikeshare.bikeshare_trips
*******************************************************************************/

SELECT 
    start_station_name AS station_name,
    COUNT(*) AS total_trips,
    
    -- Conditional Count 1: Short trips (< 15 minutes)
    COUNT(CASE WHEN duration_minutes < 15 THEN 1 END) AS short_trips,
    
    -- Conditional Count 2: Long trips (>= 15 minutes)
    COUNT(CASE WHEN duration_minutes >= 15 THEN 1 END) AS long_trips

FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    start_station_name IS NOT NULL
    AND duration_minutes > 0
GROUP BY 
    start_station_name
ORDER BY 
    total_trips DESC,
    station_name ASC
LIMIT 10;

-- Query 2: Cumulative Ride Duration by Rider Type (SUM with CASE WHEN)
SELECT 
    start_station_name AS station_name,
    COUNT(*) AS total_trips,
    
    -- Cumulative minutes for Subscribers
    SUM(CASE WHEN subscriber_type = 'Subscriber' THEN duration_minutes ELSE 0 END) AS subscriber_total_minutes,
    
    -- Cumulative minutes for Casual riders
    SUM(CASE WHEN subscriber_type != 'Subscriber' THEN duration_minutes ELSE 0 END) AS casual_total_minutes

FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    start_station_name IS NOT NULL
    AND duration_minutes > 0
GROUP BY 
    start_station_name
ORDER BY 
    total_trips DESC
LIMIT 5;


-- Query 3: Station Ride-Type Pivot Report (Top 5 Busiest Stations)
SELECT 
    start_station_name AS Busiest_Starting_Stations,
    COUNT(*) AS Total_Rides,
    COUNT(CASE WHEN subscriber_type = 'Subscriber' THEN 1 END) AS Subscriber_Volume,
    COUNT(CASE WHEN subscriber_type != 'Subscriber' THEN 1 END) AS Casual_Volume
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    start_station_name IS NOT NULL
    AND duration_minutes > 0
GROUP BY 
    start_station_name
ORDER BY 
    Total_Rides DESC,
    Subscriber_Volume DESC,
    Busiest_Starting_Stations ASC
LIMIT 5;