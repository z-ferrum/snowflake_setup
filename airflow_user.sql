/*

Describes setting up airflow role for airflow itself and for airflow users

*/

-- create the airflow role
create role airflow_role;

-- base usage permissions on the database, schema and warehouse
grant usage on database analytics to role airflow_role;
grant usage on schema analytics.raw to role airflow_role;
grant usage on warehouse airflow_wh to role airflow_role;

-- permissions to the stage
grant usage, read, write on stage analytics.raw.raw_prod to role airflow_role;

-- grant permissions to insert into, update, delete, and select from the tables
-- update - under question, for larger data you may want to append only
grant select, insert, update, delete on all tables in schema analytics.raw to role airflow_role;
grant select, insert, update, delete on future tables in schema analytics.raw to role airflow_role;

-- Create a new user for Airflow and give it the role
create user airflow_bot
email = 'xxx@gmail.com'
password = 'xxx'
default_role = airflow_role -- ex. the role above
default_warehouse = airflow_wh
must_change_password = false;

-- grant the airflow_role to a specific user or another role
grant role airflow_role to user airflow_bot;