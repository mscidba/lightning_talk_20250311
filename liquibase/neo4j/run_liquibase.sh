#!/bin/bash
#set -x

if [ ! -f ./.lb_env ]
then
  echo Enter Neo4J username
  read LIQUIBASE_COMMAND_USERNAME
  export LIQUIBASE_COMMAND_USERNAME
  
  echo Enter Neo4J password
  read LIQUIBASE_COMMAND_PASSWORD
  export LIQUIBASE_COMMAND_PASSWORD
  
  echo Enter Neo4J endpoint
  read LIQUIBASE_COMMAND_ENDPOINT
  export LIQUIBASE_COMMAND_ENDPOINT
  
else
  . ./.lb_env
fi

export LIQUIBASE_COMMAND_URL="jdbc:neo4j:bolt://${NEO4J_ENDPOINT}:7687"

#liquibase clear-checksums 
#liquibase status 
#liquibase updateSQL 
liquibase update 
