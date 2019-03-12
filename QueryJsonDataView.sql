--
-- Zero To Snowflake in 90 Minuites
-- 
-- Query JSON Data via a view
--

--
-- Things to watch for:
-- 1.  Is the json_table in the current schema?
-- 2.  Are you ready for some really powerfull, cool SQL?!?!
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

