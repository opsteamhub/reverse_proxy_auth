resource "aws_security_group" "cluster_master_sg" {

  name   = "${var.project_name}-${var.environment}-${var.cluster_name}-sg"
  vpc_id = var.vpc_id

  egress {
    from_port = 0
    to_port   = 0

    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-${var.cluster_name}-sg"
    Environment = var.environment
    Description = "Managed by Terraform"
  }

}

resource "aws_security_group_rule" "ingress_rules" {
  for_each = var.sg_ingress_rules

  security_group_id = aws_security_group.cluster_master_sg.id
  type              = "ingress"
  cidr_blocks       = each.value.cidr_blocks

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  description = each.value.description
}

# Security group rules with "source_security_group_id", but without "cidr_blocks" and "self"
resource "aws_security_group_rule" "ingress_with_source_security_group_id" {
  for_each = var.source_sg_ingress_rules

  security_group_id        = aws_security_group.cluster_master_sg.id
  type                     = "ingress"
  source_security_group_id = each.value.source_security_group_id

  from_port   = each.value.from_port
  to_port     = each.value.to_port
  protocol    = each.value.protocol
  description = each.value.description
}