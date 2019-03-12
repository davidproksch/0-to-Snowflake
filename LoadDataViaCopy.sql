--
-- Zero To Snowflake in 90 Minuites
-- 
-- Load Data via COPY command that resides in an AWS S3 Stage
--
-- The stage name is z2sfz_stage.  
--
-- Things to check:
-- 1.  Does the current schema contain the crimes table?
-- 2.  Does the current schema contain the stage?
-- 3.  Is the proper file format being used?
--
copy into crimes 
from @stage1/crime_data/
file_format = 'csv1'
on_error = 'continue' 
pattern='crimes[0-9].*'
-- validation_mode = 'return_all_errors'
purge = false;

