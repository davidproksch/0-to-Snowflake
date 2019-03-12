--
-- Zero To Snowflake in 90 Minuites
-- 
-- Load JSON Data via COPY command that resides in an AWS S3 Stage
--
-- The stage name is ??????.  
--
-- Things to check:
-- 1.  Does the current schema contain the json_table table?
-- 2.  Does the current schema contain the stage?
-- 3.  Is the proper file format being used?
--
-- Let's take a look at what is in the stage
--
ls @json_challenge;

--
-- Only need a one column table, of type variant.  
--
create or replace table json_table (json_data variant);

--
-- Use the COPY INTO command to load data into the 
-- table.  No magic required from the user.  This processing
-- looks and acts just like regular tabular data.
--
copy into json_table 
from @json_challenge/ 
file_format = 'json';

--
-- Take a look at the first 10 rows of the table
--
select * from json_table limit 10;
