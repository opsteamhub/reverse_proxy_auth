#!/bin/bash


export RDS_HOSTNAME="keycloak.csq3a574pjti.us-east-1.rds.amazonaws.com"
export RDS_PORT=5432
export RDS_USERNAME="keycloak"



if [[ $(which psql) ]]; then
    echo -e "\npsql installed, continuing database creation...\n"
    else
    echo -e "\npsql not installed!!\n"
    exit 1
fi

PGPASSWORD=${TF_VAR_db_password} \
    psql -h ${RDS_HOSTNAME} \
     -p ${RDS_PORT} \
     -U ${RDS_USERNAME} \
     -d postgres \
     -c "CREATE DATABASE keycloak"

echo -e "\nListing Databases...\n"

PGPASSWORD=${TF_VAR_db_password} \
    psql -h ${RDS_HOSTNAME} \
     -p ${RDS_PORT} \
     -U ${RDS_USERNAME} \
     -d postgres \
     -c "\list"
