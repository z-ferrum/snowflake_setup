/*

Describes setting up BI role for airflow a bi system (tableau, Power BI) and for BI users

*/


-- create the bi role
create role bi_role;

-- grant usage permissions on the database and schema
grant usage on database analytics to role bi_role;
grant usage on schema analytics.marts to role bi_role;
grant usage on warehouse bi_wh to role bi_role;  --(optional but often required to run queries)


-- grant read permissions on all current and future tables in the marts schema
grant select on all tables in schema analytics.marts to role bi_role;
grant select on future tables in schema analytics.marts to role bi_role;

-- Create a new user for BI system and give it the role
create user bi_bot
email = 'xxx@gmail.com'
password = 'xxx'
default_role = airflow_role -- ex. the role above
default_warehouse = airflow_wh
must_change_password = false; 

-- grant the bi_role to a specific user or another role
grant role bi_role to user bi_bot;
