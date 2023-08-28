/*

Describes configs of DBs and warehouse computing resources allocation

*/


-- DB for dbt jobs and analysts
CREATE DATABASE ANALYTICS;

-- Raw data and files database for incoming data from Airflow
CREATE DATABASE RAW;

-- Stage for airflow to send files into
USE DATABASE RAW;
CREATE SCHEMA STAGE;

-- Warehouses

-- for airflow jobs (keep smaller for cost efficiency, scale when needed)
CREATE WAREHOUSE AIRFLOW_WH
WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE;

-- for DBT automated jobs (keep smaller for cost efficiency, scale when needed)
CREATE WAREHOUSE DBT_WH
WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE;

-- for analysts (keep smaller for cost efficiency, scale when needed)
CREATE WAREHOUSE ANALYST_WH 
WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE;

-- for BI tools (Should be bigger to faster respond to BI querries, but keep smaller for cost efficiency, scale when needed)
CREATE WAREHOUSE BI_WH
WITH WAREHOUSE_SIZE = 'LARGE' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE;



-- Check
SHOW WAREHOUSES;
SHOW DATABASES;
USE DATABASE RAW;
SHOW SCHEMAS;