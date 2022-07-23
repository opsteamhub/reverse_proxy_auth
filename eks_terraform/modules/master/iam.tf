data "aws_iam_policy_document" "eks_cluster_role" {

  version = "2012-10-17"

  statement {

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

  }

}

resource "aws_iam_role" "eks_cluster_role" {
  name               = "${var.project_name}-${var.environment}-eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.eks_cluster_role.json
}

///
/// These two roles MUST be managed by AWS and therefore CANNOT be created via Terraform.
///

resource "aws_iam_role_policy_attachment" "eks-cluster-cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "eks-cluster-service" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_cluster_role.name
}