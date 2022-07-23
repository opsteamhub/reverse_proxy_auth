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

variable "k8s_version" {
  description = "Set EKS cluster version. Default 1.21"
  type        = string
  default     = "1.21"
}

variable "cluster_vpc_id" {
  description = "VPC ID from the VPC/Network module. Used by Security Group"
  type        = string
  default     = ""
}

variable "private_subnets_id" {
  description = "Private subnets id from the VPC/Network module"
  type        = list(string)
  default     = []
}

variable "is_private" {
  description = "Set whether the EKS API will be private or public. Default is true"
  default     = true
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

  default = {}
}

variable "vpc_id" {
  description = "Cluster VPC ID"
  type        = string
}