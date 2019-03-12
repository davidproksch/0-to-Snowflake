# 0 to Snowflake in 90 Minutes 

These workshop materials facilitate the learning of Snowflake in less than 90 minutes.  When the workshop completes, you will be an expert in:

For the Z2SF-Detroit Edition, use the following AWS information:
* **AWSAccessKeyId**: AKIAIXVETSISMFIO7IEQ
* **AWSSecretKey**: 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
* **URL**: s3://bmgsf/

* User Interface - How do I navigate the UI
* [Create a Database](https://github.com/davidproksch/0-to-Snowflake/blob/master/CreateDatabase.sql) - This is where the data lives
  * Schemas
  * [Tables](https://github.com/davidproksch/0-to-Snowflake/blob/master/CreateTable.sql)
  * [Stages](https://github.com/davidproksch/0-to-Snowflake/blob/master/CreateAWSStage.sql) - Stage for an AWS S3 bucket
  * [File Formats](https://github.com/davidproksch/0-to-Snowflake/blob/master/CreateFileFormat.sql) - A named file format that can be used for bulk loading data into (and unloading data out of) Snowflake tables
* [Create a Compute Cluster](https://github.com/davidproksch/0-to-Snowflake/blob/master/CreateVirtualWarehouse.sql) - A.K.A. Virtual Warehouses.  This is where the query and loading magic happens
* [Load Data](https://github.com/davidproksch/0-to-Snowflake/blob/master/LoadDataViaCopy.sql) - Use the COPY command to populate a table
* Handle JSON Data - An introduction to handling semi-structured data
  * [Loading](https://github.com/davidproksch/0-to-Snowflake/blob/master/LoadJsonData.sql) via COPY
  * [Query](https://github.com/davidproksch/0-to-Snowflake/blob/master/QueryJsonDataView.sql) via SQL
* BAR - Backup and Recovery as you've always wanted it:  Fast, Easy and at no-charge
* Data Sharing - Your Kindergarten teacher was right - it is good to share.



