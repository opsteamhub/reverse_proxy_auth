variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "The project name. Used to name and tag resources"
  type        = string
  default     = "demo"
}

variable "cluster_name" {
  description = "The name of the EKS Cluster. Used to name and tag resources"
}

variable "environment" {
  description = "The environment name. Used to name and tag resources"
  type        = string
  default     = "test"
}

variable "cidr_network" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  type        = bool
  default     = true
}

variable "availability_zones" {
  description = "A List of public subnets inside the VPC"
  type        = list(string)

  validation {
    condition     = length(var.availability_zones) >= 1
    error_message = "Public subnets have to be in at least 3 availability zones."
  }
}