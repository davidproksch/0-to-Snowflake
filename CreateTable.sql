--
-- Zero To Snowflake in 90 Minuites
-- 
-- Create Table Sample DDL.  The table name is "crimes".
--
-- It is important to note what IS MISSING:  Indexes, Partitioning Key, 
-- HASH/DISTRIBUTION KEYS!
--
create or replace table crimes (
 id float NOT NULL
, case_number STRING
, crime_date STRING
, block STRING
, iucr STRING
, primary_type STRING
, crime_desc STRING
, location_desc STRING
, arrest STRING
, domestic STRING
, beat STRING
, district STRING
, ward STRING
, community_area STRING
, fbi_code STRING
, x_coord FLOAT
, y_coord FLOAT
, year INTEGER
, updated_on STRING
, latitude FLOAT
, longitude FLOAT
, location STRING)
