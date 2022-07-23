#!/bin/bash

# https://hub.docker.com/r/ealen/echo-server

helm repo add ealenn https://ealenn.github.io/charts
helm repo update

# Setting usefull variables
NAMESPACE=echoserver

# Create Nginx Namespace
kubectl create ns ${NAMESPACE} || true


helm upgrade --install echoserver \
             --namespace ${NAMESPACE} \
             ealenn/echo-server

#helm install --set ingress.enable=true --name echoserver ealenn/echo-server


# curl -I echoserver.novinho.com

# curl --header 'X-ECHO-BODY: amazing' echoserver.novinho.com