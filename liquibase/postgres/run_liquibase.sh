#!/bin/bash
#set -x

if [ ! -f ./.lb_env ]
then
  echo Enter Postgres username
  read LIQUIBASE_COMMAND_USERNAME
  export LIQUIBASE_COMMAND_USERNAME
  
  echo Enter Postgres password
  read LIQUIBASE_COMMAND_PASSWORD
  export LIQUIBASE_COMMAND_PASSWORD
  
  echo Enter Postgres endpoint
  read LIQUIBASE_COMMAND_ENDPOINT
  export LIQUIBASE_COMMAND_ENDPOINT
  
  echo Enter Postgres database
  read POSTGRES_DATABASE
  export POSTGRES_DATABASE
  
  echo Enter Postgres schema
  read POSTGRES_SCHEMA
  export POSTGRES_SCHEMA

else
  . ./.lb_env
fi

export LIQUIBASE_COMMAND_URL="jdbc:postgresql://${POSTGRES_ENDPOINT}:5432/${POSTGRES_DATABASE}"

#liquibase clear-checksums 
#liquibase status 
#liquibase updateSQL 
liquibase update 


cp ../../docker/postgres/files/State.csv ../../docker/neo4j/import/State.csv
