/*
  ==================================================
  WEEK 1: FUNDAMENTALS & BASIC SYNTAX (Days 1 - 4)
  Platform: Google BigQuery (Public Datasets)
  Target: Google AI Data Analyst Preparation
  ==================================================
*/

-- ==================================================
-- DAY 2 PRACTICE: Basic SELECT and FROM
-- Exploring the Shakespeare word frequency table
-- ==================================================
SELECT 
    word, 
    word_count
FROM 
    `bigquery-public-data.samples.shakespeare`
LIMIT 5;


-- ==================================================
-- DAY 3 PRACTICE: Understanding Data Types
-- Notice the data types in the results:
--   - word (STRING / TEXT)
--   - word_count (INTEGER / NUMBER)
-- ==================================================
SELECT 
    word, 
    word_count,
    corpus AS play_name
FROM 
    `bigquery-public-data.samples.shakespeare`
LIMIT 5;


-- ==================================================
-- DAY 4 PRACTICE: Column Aliases (AS)
-- Renaming messy or generic database headers into 
-- clean, professional output labels for reporting
-- ==================================================
SELECT 
    name AS baby_first_name, 
    number AS total_births_registered,
    state AS us_state_code
FROM 
    `bigquery-public-data.usa_names.usa_1910_2013`
LIMIT 5;