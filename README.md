
# reverse_proxy_auth_poc

This repository is for POC using Reverse Proxy Auth tools like OpenID, JWT, Oauth2, etc.

## How initiate terraform

```sh
terraform init

export TFVARS_FILE="environments/novinho.tfvars"

terraform apply -var-file=${TFVARS_FILE}
```

## How to connect to the cluster

```sh
export CLUSTER_REGION=us-east-1
export CLUSTER_NAME=novinho-labs-dev-eks-novinho

alias novinho_eks_cluster="aws eks --region ${CLUSTER_REGION} update-kubeconfig --name ${CLUSTER_NAME}"

novinho_eks_cluster
```

