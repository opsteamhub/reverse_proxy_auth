resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-${var.environment}-${var.cluster_name}"
  version  = var.k8s_version
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {

    endpoint_private_access = var.is_private == true ? true : false
    endpoint_public_access  = var.is_private == true ? false : true

    subnet_ids = var.private_subnets_id

    security_group_ids = [
      aws_security_group.cluster_master_sg.id
    ]

  }

  depends_on = [
    aws_iam_role.eks_cluster_role
  ]

  tags = {
    // This tag is mandatory - DO NOT remove it from here.
    "kubernetes.io/cluster/${var.project_name}-${var.environment}-${var.cluster_name}" = "shared"
  }
}