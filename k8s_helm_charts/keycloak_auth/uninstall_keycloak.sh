#!/bin/bash

NAMESPACE=keycloak

helm -n ${NAMESPACE} delete keycloak

kubectl delete ns ${NAMESPACE}