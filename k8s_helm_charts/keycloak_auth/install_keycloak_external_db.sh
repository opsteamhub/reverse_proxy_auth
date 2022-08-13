#!/bin/bash

# https://artifacthub.io/packages/helm/codecentric/keycloak

helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo update

# Setting usefull variables
NAMESPACE=keycloak-external-db

# Create Keycloak Namespace
kubectl create ns ${NAMESPACE} || true


helm upgrade --install keycloak \
             --namespace ${NAMESPACE} \
             -f values_external_db.yaml \
             codecentric/keycloak

## Create a port-forwarding with the following commands:
# export POD_NAME=$(kubectl get pods --namespace keycloak -l "app.kubernetes.io/name=keycloak,app.kubernetes.io/instance=keycloak" -o name)
# echo "Visit http://127.0.0.1:8080 to use your application"
# kubectl --namespace keycloak port-forward "$POD_NAME" 8080
