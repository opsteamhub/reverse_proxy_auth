# Terraform - Manage AWS RDS

This is a companion repository for the [Manage RDS Instances
guide](https://learn.hashicorp.com/tutorials/terraform/aws-rds) on [HashiCorp
Learn](https://learn.hashicorp.com/). It contains Terraform conifguration files
for you to use to learn how to provision and manage AWS RDS resources using
Terraform.

[Hashicorp Learn Link](https://learn.hashicorp.com/tutorials/terraform/aws-rds?in=terraform/aws)

## DB Password

```sh
export TF_VAR_db_password="KeycloAk123"
```

## RDS Keycloak Informations

```sh
- name: DB_ADDR
    value: keycloak.csq3a574pjti.us-east-1.rds.amazonaws.com
- name: DB_PORT
    value: "5432"
- name: DB_DATABASE
    value: keycloak
- name: DB_USER
    value: keycloak
- name: DB_PASSWORD
    value: "KeycloAk123"
```
