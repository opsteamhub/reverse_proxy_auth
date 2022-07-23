resource "aws_eks_node_group" "cluster" {

  cluster_name    = "${var.project_name}-${var.environment}-${var.cluster_name}"
  node_group_name = "${var.project_name}-${var.environment}-node-group"
  node_role_arn   = aws_iam_role.eks_nodes_roles.arn

  // Getting private subnets list/size from the VPC module
  subnet_ids = var.private_subnets_id

  instance_types = [var.nodes_instances_size]

  scaling_config {
    desired_size = lookup(var.auto_scale_options, "desired")
    max_size     = lookup(var.auto_scale_options, "max")
    min_size     = lookup(var.auto_scale_options, "min")
  }

  depends_on = [
    aws_iam_role.eks_nodes_roles,
    aws_iam_role_policy_attachment.cni,
    aws_iam_role_policy_attachment.node,
    aws_iam_role_policy_attachment.ecr
  ]

  tags = {
    // This tag is mandatory - DO NOT remove it from here.
    "kubernetes.io/cluster/${var.project_name}-${var.environment}-${var.cluster_name}" = "owned"
  }
}