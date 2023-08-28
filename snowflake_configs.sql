/*

Describes configs of DBs and warehouse computing resources allocation

*/


-- DB for dbt jobs, airflow jobs, bi requests, and analysts
CREATE DATABASE ANALYTICS;

-- Stage for airflow to send files into
USE DATABASE RAW;
CREATE STAGE RAW_PROD;

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
USE DATABASE ANALYTICS;
SHOW SCHEMAS;