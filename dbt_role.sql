/*

Describes setting up dbt role for dbt itself and for dbt users

*/


-- Create a datawarehouse for DBT
create warehouse dbt_wh with warehouse_size='MEDIUM'  -- you can choose your size

-- Create a role for all DBT developers
create role <role name>;

-- Rights for DBT devs

-- Selecting raw data
-- grant IMPORTED PRIVILEGES on database analytics to role dbt_role  -- for shares only
grant usage on schema analytics.raw to role dbt_role
grant select on all tables in schema analytics.raw to role dbt_role

-- Building analytics schema
grant usage on database analytics to role dbt_role
-- grant reference_usage on database analytics to role dbt_role  -- for shares only
grant modify on database analytics to role dbt_role
grant monitor on database analytics to role dbt_role
grant create schema on database analytics to role dbt_role

-- Access to dbt_wh
grant operate on warehouse dbt_wh to role dbt_role
grant usage on warehouse dbt_wh to dbt_role

-- Grant this role to yourself
grant role dbt_role to user <user_name>

-- Create a new user for DBT and give it the role
create user dbt_bot
email = 'xxx@gmail.com'
password = 'xxx'
default_role = dbt_role -- ex. the role above
default_warehouse = dbt_wh
must_change_password = false;

grant role dbt_role to user dbt_bot