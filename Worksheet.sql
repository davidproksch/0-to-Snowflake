--
-- Zero To Snowflake in 90 Minuites
-- 
-- Create Table Sample DDL 
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
, location STRING);

--
--
-- Information Needed to Create CRIMES_STAGE
--
-- AWSAccessKeyId: AKIAIXVETSISMFIO7IEQ
--
-- AWSSecretKey: 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
--
-- URL: s3://bmgsf/
--

--
-- Validate successful creation of the CRIMES_STAGE
--
ls @crimes_stage;
ls @crimes_stage/crimes/;
ls @crimes_stage/json/;

--
-- Validate successful creation of the FILE_FORMAT
--
--select t.$1 from @crimes_stage/crimes/crimes00.csv (file_format=>csv) t;

-- 
-- LOAD TABULAR DATA
--
copy into crimes 
from @crimes_stage/crimes/
file_format = 'csv'
on_error = 'continue' 
--pattern='crimes[0-1][0-9].*'
-- validation_mode = 'return_all_errors'
purge = false;

--
--  Query Fun!
--
select count(*) from crimes limit 22;
select * from crimes limit 22;
select primary_type, count(*) from crimes group by 1 order by 2 desc;

-- 
-- LOAD JSON DATA
--
create or replace table json_table (json_data variant);

copy into json_table 
from @crimes_stage/json/
file_format = 'json';

--
-- Query the json_table
--
-- Click on a row in the results.  It is hyperlinked and will bring up the 
-- formatted JSON
--
select * from json_table limit 22;

--
-- Create a VIEW on top of the JSON data.  It will make the BI tools happy.
--
-- Let's break down the projection:
-- <ColumnName>:<JSONPath>::<DataType> <alias>
-- Pretty simple.  Pretty Powerful.
--
create or replace view vw_json as (
select 
  json_data:address.city::string city
, json_data:address.state::string state
, json_data:address.streetAddress::string address
, json_data:address.zip::string zip
, json_data:ip::string ip
, json_data:recDate::timestamp rec_date
, json_data:fname::string first_name
, json_data:lname::string lname
, json_data:comments::string comments
, list.value:cust_value::float cust_value
from json_table a,
lateral flatten(input => a.json_data:cust_values) list
);

--
-- Let's do some simple queries
--
select distinct state from vw_json limit 22;
select state, count(*) from vw_json group by 1 order by 2 desc;

--
-- Sharing Data ....
--
select * from crimes limit 22;

--
-- BAR:  Extra Credit
--

--
-- Drop/Recover without going to a backup
--
drop table crimes;
undrop table crimes;

--
-- Purge the table!
--
truncate table crimes;

--
-- Nothing is there
--
select count(*) from crimes;

--
-- Recover before the TRUNCATE was executed
--
create table clone_recover clone crimes before (statement => '9da1725a-0a4d-4920-a5b3-a3bc78bfd577');

--
-- We have our data back
--
select count(*) from clone_recover;

--
-- Out with old, in with the new
--
alter table clone_recover swap with crimes;

--
-- Trust, but verify
--
select count(*) from crimes;


