/*
  ==================================================
  WEEK 1 - DAY 6: Sorting & Limiting Data (ORDER BY & LIMIT)
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
    subscriber_type = 'Subscriber'
    AND duration_minutes IS NOT NULL
ORDER BY 
    duration_minutes DESC
LIMIT 10;