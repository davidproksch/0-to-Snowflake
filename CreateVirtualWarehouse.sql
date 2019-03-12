--
-- Zero To Snowflake in 90 Minuites
--
-- Sample DDL to create a virtual warehouse.
-- In this sample, the database name is "z2sf_wh".
-- The comment field is filled out, but COMMENT = <Comment> is optional
--
-- This warehouse is:
-- 1.  SMALL
-- 2.  STANDARD
-- 3.  Will automatically suspend after 600 seconds (10 minutes) of inactivity
-- 4.  Will automatically restart upon initial connection after auto suppend
-- 5.  Is not a MCW, it has a MAX|MIN count of 1.  If it were a MCW, it would
--     have a MAX|MIN of a different count.
-- 6.  The scaling policy is not applicable since it is not a MCW.
--
CREATE WAREHOUSE z2sf_wh WITH 
	WAREHOUSE_SIZE = 'SMALL' 
	WAREHOUSE_TYPE = 'STANDARD' 
	AUTO_SUSPEND = 600 
	AUTO_RESUME = TRUE 
	MIN_CLUSTER_COUNT = 1 
	MAX_CLUSTER_COUNT = 1 
	SCALING_POLICY = 'STANDARD' 
COMMENT = 'Zero To Snowflake Warehouse';
