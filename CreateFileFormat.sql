--
-- Zero To Snowflake in 90 Minuites
--
-- Sample DDL to create a File Format.
--
-- The name of the file format is z2sf_ff.  This file format defines
-- a CSV file that is compressed using GZIP.  The fields are seperated 
-- by a "," and the rows are terminated by a newline '\n'.
-- This type of file has an intact header, and this header will be skipped.
-- This is denoted by setting SKIP_HEADER to 1.
--
-- A really great feature of the File Format is the ability to convert
-- Text Strings into NULLs.  For example, a file could contain ?, NN, or NA 
-- as values denoting NULL values.  The NULL_IF clause would be:
-- NULL_IF ('?','NN,'NA').  <- Pretty powerful stuff
--
CREATE FILE FORMAT CSV 
	TYPE = 'CSV' 
	COMPRESSION = 'GZIP' 
	FIELD_DELIMITER = ',' 
	RECORD_DELIMITER = '\n' 
	SKIP_HEADER = 1 
	FIELD_OPTIONALLY_ENCLOSED_BY = '\042' 
	TRIM_SPACE = FALSE 
	ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE 
	ESCAPE = 'NONE' 
	ESCAPE_UNENCLOSED_FIELD = '\134' 
	DATE_FORMAT = 'AUTO' 
	TIMESTAMP_FORMAT = 'AUTO' 
	NULL_IF = ('\\N');
