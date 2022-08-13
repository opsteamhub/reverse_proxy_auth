#!/bin/bash

NAMESPACE=keycloak-external-db

helm -n ${NAMESPACE} delete keycloak

kubectl delete ns ${NAMESPACE}
