variable "project_name" {
  description = "The project name. Used to name and tag resources"
  type        = string
  default     = "demo"
}

variable "cluster_name" {
  description = "The name of the EKS Cluster. Used to name and tag resources"
  type        = string
  default     = "eks-cluster"
}

variable "environment" {
  description = "The environment name. Used to name and tag resources"
  type        = string
  default     = "dev"
}

variable "private_subnets_id" {
  description = "Private subnets id from the VPC/Network module"
  type        = list(string)
  default     = []
}

variable "nodes_instances_size" {
  description = "Node instance size. Default t3.large"
  type        = string
  default     = "t3.large"
}

variable "auto_scale_options" {
  description = "Set node group auto scale options - minimum, maximum and desired"
  type        = map(any)
  default = {
    min     = 2
    max     = 10
    desired = 2
  }
}

variable "auto_scale_cpu" {
  description = "Set node group scale up and down thresholds"
  type        = map(any)
  default = {
    scale_up_threshold  = 80
    scale_up_period     = 60
    scale_up_evaluation = 2
    scale_up_cooldown   = 300
    scale_up_add        = 2

    scale_down_threshold  = 40
    scale_down_period     = 120
    scale_down_evaluation = 2
    scale_down_cooldown   = 300
    scale_down_remove     = -1
  }
}