-- Create the database if it doesn’t exist
CREATE DATABASE taxi_db;
-- Create a new user with a password

CREATE USER taxi_user WITH PASSWORD 'taxi_pass';


-- Grant privileges on the database
GRANT ALL PRIVILEGES ON DATABASE taxi_db TO taxi_user;

-- Connect to the new database (this part won't work inside an SQL script)
-- \c taxi_db;

-- The rest must be executed inside taxi_db
\connect taxi_db;

-- Create the schema inside the new database
CREATE SCHEMA IF NOT EXISTS taxi_schema;

-- Grant privileges on the schema
GRANT ALL PRIVILEGES ON SCHEMA taxi_schema TO taxi_user;