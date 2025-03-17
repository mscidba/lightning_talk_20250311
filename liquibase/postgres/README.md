# Setup Postgres utilizing Liquibase

## Assumptions:
* Liquibase is installed locally and in executing user's path
* Username specified in variable LIQUIBASE_COMMAND_USERNAME is granted role `rdsadmin`
* Postgres database specified in variable Postgres_DATABASE exists and user has required access 
* Postgres warehouse specified in variable Postgres_WAREHOUSE exists and user has required access 

## Preliminary Steps:
* Copy file `sample.lb_env` to `.lb_env` and set variable values as specified below
  * NOTE:  if you want to be prompted for all variables skip the this step

## Variables in file .lb_env:
* Postgres_DATABASE              : Postgres database where all objects are created
* Postgres_WAREHOUSE             : Postgres warehouse utilized to execute process
* LIQUIBASE_COMMAND_USERNAME      : Postgres user that has `rdsadmin` role granted
* LIQUIBASE_COMMAND_PASSWORD      : Password for user specified in LIQUIBASE_COMMAND_USERNAME

## Execution:
* Execute file `run_liquibase.sh`
* If parameter file `.lb_env` not utilized, respond to prompts for necessary information.   Prompts correspond to variables specified above
