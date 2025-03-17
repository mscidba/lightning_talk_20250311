# Sample code for lightning_talk_20250311

## Overview
Quick and simple example of the differences in following connected data to identify "paths".  Utilizing a data set of all US states, and the bordering states for each, compute the least number of states to traverse from a starting state to an ending state.

Postgres requires utilizing some manner of recursion to perform this task.  In this example CTE (common table expression) were utilized.

Neo4j is designed for this type of data access.

## Tools utilized
- Docker : simple instances of Postgres and Neo4j
- DBeaver : access both database instances
- Liquibase : manage structure and data movement from primary (Postgres) to secondary (Neo4j)

## Notes
- Ensure the Liquibase add-on for Neo4j is installed.
- Passwords for the Docker database instances are simple, not secure and for demonstration purposes only.

## Basic instructions
- Start both Docker database instances
- Using DBeaver, or your preferred database access tool, confirm ability to contect to the databases.
- Precreate the Postgres database `lightning_talk`.   If you utilize a different name the Liquibase configuration must me modified to reflect this change.
- Execute the `run_liquibase.sh` file in each folder (docker/neo4j and docker/postgres).   Execute the postgres first.
- Run the sample SQL in the `sql` folder in each database, changing the placeholders "StartStateNameHere" and "EndStateNameHere" for your desired test case(s).
