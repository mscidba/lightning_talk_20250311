-- liquibase formatted sql

-- changeset jeff.pell:misc-0001 endDelimiter=/ runAlways:True 
Copy (Select * From state_border) To '/tmp/movedata/State.csv' With CSV DELIMITER ',' HEADER;

