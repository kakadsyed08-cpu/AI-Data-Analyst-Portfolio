/*
  ==================================================
  WEEK 1 - DAY 6: Multi-Column ORDER BY with NULLS LAST
  Target: Google AI Data Analyst Preparation
  Platform: Google BigQuery
  Dataset: Austin Bikeshare Public Data
  ==================================================
*/

SELECT 
    trip_id,
    subscriber_type,
    start_station_name,
    duration_minutes
FROM 
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE 
    subscriber_type IS NOT NULL
ORDER BY 
    subscriber_type ASC,
    duration_minutes DESC NULLS LAST
LIMIT 20;