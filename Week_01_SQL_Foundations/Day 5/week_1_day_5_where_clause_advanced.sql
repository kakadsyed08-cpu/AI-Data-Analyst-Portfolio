SELECT 
    date,
    primary_type,
    description,
    location_description,
    arrest
FROM 
    `bigquery-public-data.chicago_crime.crime`
WHERE 
    (primary_type = 'NARCOTICS' OR primary_type = 'LIQUOR LAW VIOLATION')
    AND location_description = 'STREET'
LIMIT 15;


SELECT 
    trip_id,
    start_station_name,
    end_station_name,
    duration_minutes,
    subscriber_type
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    start_station_name IN ('2nd & Congress', 'Howard & University', 'ACC - West 12th St')
LIMIT 15;



SELECT 
    trip_id,
    start_station_name,
    duration_minutes,
    subscriber_type
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    duration_minutes BETWEEN 15 AND 30
    AND subscriber_type != 'Single Trip'
LIMIT 15;