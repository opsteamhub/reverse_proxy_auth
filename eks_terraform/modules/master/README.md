## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.cluster_master_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.ingress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_with_source_security_group_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_iam_policy_document.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS Cluster. Used to name and tag resources | `string` | `"eks-cluster"` | no |
| <a name="input_cluster_vpc_id"></a> [cluster\_vpc\_id](#input\_cluster\_vpc\_id) | VPC ID from the VPC/Network module. Used by Security Group | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. Used to name and tag resources | `string` | `"dev"` | no |
| <a name="input_is_private"></a> [is\_private](#input\_is\_private) | Set whether the EKS API will be private or public. Default is true | `bool` | `true` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Set EKS cluster version. Default 1.21 | `string` | `"1.21"` | no |
| <a name="input_private_subnets_id"></a> [private\_subnets\_id](#input\_private\_subnets\_id) | Private subnets id from the VPC/Network module | `list(string)` | `[]` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name. Used to name and tag resources | `string` | `"demo"` | no |
| <a name="input_sg_ingress_rules"></a> [sg\_ingress\_rules](#input\_sg\_ingress\_rules) | List of ingress rules to create where 'cidr\_blocks' is used | <pre>map(object({<br>    cidr_blocks = list(string)<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    description = string<br>  }))</pre> | n/a | yes |
| <a name="input_source_sg_ingress_rules"></a> [source\_sg\_ingress\_rules](#input\_source\_sg\_ingress\_rules) | List of ingress rules to create where 'source\_security\_group\_id' is used | <pre>map(object({<br>    source_security_group_id = string<br>    from_port                = number<br>    to_port                  = number<br>    protocol                 = string<br>    description              = string<br>  }))</pre> | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Cluster VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster_id"></a> [eks\_cluster\_id](#output\_eks\_cluster\_id) | n/a |
