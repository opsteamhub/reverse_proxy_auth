#!/bin/bash

NAMESPACE=echoserver

helm -n ${NAMESPACE} delete echoserver

kubectl delete ns ${NAMESPACE}