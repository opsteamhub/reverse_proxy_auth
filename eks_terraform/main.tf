module "network" {
  source = "./modules/network"

  project_name = var.project_name
  aws_region   = var.aws_region
  environment  = var.environment
  cidr_network = var.cidr_network

  cluster_name       = var.cluster_name
  availability_zones = var.availability_zones
}

module "master" {
  source = "./modules/master"

  project_name = var.project_name
  cluster_name = var.cluster_name
  environment  = var.environment
  k8s_version  = var.k8s_version

  cluster_vpc_id          = module.network.vpc_id
  private_subnets_id      = module.network.private_subnets_id
  is_private              = var.is_private
  sg_ingress_rules        = var.sg_ingress_rules

  # Add the following variable here if you want to create security group rules with source_security_group_id
  # source_sg_ingress_rules = var.source_sg_ingress_rules

  vpc_id = module.network.vpc_id

  depends_on = [
    module.network
  ]
}

module "nodes" {
  source = "./modules/nodes"

  project_name = var.project_name
  cluster_name = var.cluster_name
  environment  = var.environment

  private_subnets_id   = module.network.private_subnets_id
  nodes_instances_size = var.nodes_instances_size
  auto_scale_options   = var.auto_scale_options

  auto_scale_cpu = var.auto_scale_cpu

  depends_on = [
    module.master
  ]
}