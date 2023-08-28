/*

Describes configs of DBs and warehouse computing resources allocation

*/


-- db for dbt jobs, airflow jobs, bi requests, and analysts
create database analytics;

-- stage for airflow to send files into
use database analytics;
create stage raw_prod;
create schema marts;  -- for setting bi tools access

-- warehouses

-- for airflow jobs (keep smaller for cost efficiency, scale when needed)
create warehouse airflow_wh
with warehouse_size = 'xsmall' auto_suspend = 600 auto_resume = true;

-- for dbt automated jobs (keep smaller for cost efficiency, scale when needed)
create warehouse dbt_wh
with warehouse_size = 'xsmall' auto_suspend = 600 auto_resume = true;

-- for analysts (keep smaller for cost efficiency, scale when needed)
create warehouse analyst_wh 
with warehouse_size = 'xsmall' auto_suspend = 600 auto_resume = true;

-- for bi tools (should be bigger to faster respond to bi querries, but keep smaller for cost efficiency, scale when needed)
create warehouse bi_wh
with warehouse_size = 'large' auto_suspend = 600 auto_resume = true;

-- check
show warehouses;
show databases;
use database analytics;
show schemas;