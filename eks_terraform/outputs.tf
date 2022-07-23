output "vpc_id" {
  description = "Get VPC ID from network module"
  value       = module.network.vpc_id
}

output "public_subnets_id" {
  description = "Get public subnets id from network module"
  value       = module.network.public_subnets_id
}

output "private_subnets_id" {
  description = "Get private subnets id from network module"
  value       = module.network.private_subnets_id
}

output "configure_kubectl" {
  description = "Kubectl command to configure access to the EKS cluster"
  value       = "aws eks --region ${var.aws_region} update-kubeconfig --name ${var.project_name}-${var.environment}-${var.cluster_name}"
}