# Troubleshootinh

## Giving EKS Cluster Permission to specific users

```sh
aws sts get-caller-identity

kubectl edit configmap aws-auth --namespace kube-system
print


mapUsers: |
    - userarn: arn:aws:iam::770831555164:user/gilvan
      username: gilvan
      groups:
        - system:masters

mapUsers: |
    - userarn: arn:aws:iam::7770831555164:user/bruno.luis
      username: bruno.luis
      groups:
        - system:masters
```

[EKS Login Troubeshooting](https://aws.amazon.com/pt/premiumsupport/knowledge-center/eks-api-server-unauthorized-error/)
