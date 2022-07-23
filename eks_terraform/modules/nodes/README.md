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
| [aws_autoscaling_policy.cpu_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.cpu_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.cpu_down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_eks_node_group.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_nodes_roles](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.eks_nodes_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scale_cpu"></a> [auto\_scale\_cpu](#input\_auto\_scale\_cpu) | Set node group scale up and down thresholds | `map(any)` | <pre>{<br>  "scale_down_cooldown": 300,<br>  "scale_down_evaluation": 2,<br>  "scale_down_period": 120,<br>  "scale_down_remove": -1,<br>  "scale_down_threshold": 40,<br>  "scale_up_add": 2,<br>  "scale_up_cooldown": 300,<br>  "scale_up_evaluation": 2,<br>  "scale_up_period": 60,<br>  "scale_up_threshold": 80<br>}</pre> | no |
| <a name="input_auto_scale_options"></a> [auto\_scale\_options](#input\_auto\_scale\_options) | Set node group auto scale options - minimum, maximum and desired | `map(any)` | <pre>{<br>  "desired": 2,<br>  "max": 10,<br>  "min": 2<br>}</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS Cluster. Used to name and tag resources | `string` | `"eks-cluster"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. Used to name and tag resources | `string` | `"dev"` | no |
| <a name="input_nodes_instances_size"></a> [nodes\_instances\_size](#input\_nodes\_instances\_size) | Node instance size. Default t3.large | `string` | `"t3.large"` | no |
| <a name="input_private_subnets_id"></a> [private\_subnets\_id](#input\_private\_subnets\_id) | Private subnets id from the VPC/Network module | `list(string)` | `[]` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project name. Used to name and tag resources | `string` | `"demo"` | no |

## Outputs

No outputs.
