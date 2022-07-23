data "aws_iam_policy_document" "eks_nodes_role" {

  version = "2012-10-17"

  statement {

    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }

  }
}

resource "aws_iam_role" "eks_nodes_roles" {
  name               = "${var.project_name}-${var.environment}-eks-nodes"
  assume_role_policy = data.aws_iam_policy_document.eks_nodes_role.json

  depends_on = [
    data.aws_iam_policy_document.eks_nodes_role
  ]
}

// VPC permission to create network abstraction in the EKS cluster
resource "aws_iam_role_policy_attachment" "cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_nodes_roles.name

  depends_on = [
    aws_iam_role.eks_nodes_roles
  ]
}

resource "aws_iam_role_policy_attachment" "node" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_nodes_roles.name

  depends_on = [
    aws_iam_role.eks_nodes_roles
  ]
}

resource "aws_iam_role_policy_attachment" "ecr" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_nodes_roles.name

  depends_on = [
    aws_iam_role.eks_nodes_roles
  ]
}