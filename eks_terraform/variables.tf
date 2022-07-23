variable "aws_region" {
  description = "AWS Region"
}

variable "environment" {
  description = "The environment name. Used to name and tag resources"
}

variable "project_name" {
  description = "The project name. Used to name and tag resources"
}

variable "cidr_network" {
  description = "The CIDR block for the VPC"
}

variable "availability_zones" {
  description = "A list of public subnets inside the VPC. It requires a minimum of at least 3 subnets"
}

# variable "private_subnets" {
#   description = "A list of private subnets inside the VPC. It requires a minimum of at least 3 subnets"
# }

variable "k8s_version" {
  description = "Set EKS cluster version"
}

variable "cluster_name" {
  description = "The name of the EKS Cluster. Used to name and tag resources"
}

variable "nodes_instances_size" {
  description = "Node instance size. Default t3.large"
}

variable "auto_scale_options" {
  description = "Set node group auto scale options - minimum, maximum and desired"
}

variable "auto_scale_cpu" {
  description = "Set node group scale up and down thresholds"
}

variable "is_private" {
  description = "Set whether the EKS API will be private or public. Default is true"
}

variable "sg_ingress_rules" {
  description = "List of ingress rules to create where 'cidr_blocks' is used"
  type = map(object({
    cidr_blocks = list(string)
    from_port   = number
    to_port     = number
    protocol    = string
    description = string
  }))
}

variable "source_sg_ingress_rules" {
  description = "List of ingress rules to create where 'source_security_group_id' is used"
  type = map(object({
    source_security_group_id = string
    from_port                = number
    to_port                  = number
    protocol                 = string
    description              = string
  }))
}