/*
  ==================================================
  WEEK 1 - DAY 5: Precision Filtering (WHERE Clause)
  Target: Google AI Data Analyst Preparation
  Platform: Google BigQuery
  Dataset: Austin Bikeshare Public Data
  ==================================================
*/

SELECT 
    trip_id,
    start_station_name,
    end_station_name,
    duration_minutes,
    subscriber_type
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    start_station_name = '2nd & Congress'
    AND duration_minutes > 60
    AND subscriber_type IS NOT NULL
LIMIT 10;