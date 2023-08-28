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

-- for analysts (keep smaller for cost efficiency, scale when needed)
create warehouse analyst_wh 
with warehouse_size = 'xsmall' auto_suspend = 600 auto_resume = true;

-- for airflow jobs (no need for top speed, but heavy pipelines still need to run in time)
create warehouse airflow_wh
with warehouse_size = 'medium' auto_suspend = 600 auto_resume = true;

-- for dbt automated jobs (no need for top speed, but heavy pipelines still need to run in time)
create warehouse dbt_wh
with warehouse_size = 'medium' auto_suspend = 600 auto_resume = true;

-- for bi tools (should be bigger to faster respond to bi querries, but keep smaller for cost efficiency, scale when needed)
create warehouse bi_wh
with warehouse_size = 'large' auto_suspend = 600 auto_resume = true;

-- check
show warehouses;
show databases;
use database analytics;
show schemas;