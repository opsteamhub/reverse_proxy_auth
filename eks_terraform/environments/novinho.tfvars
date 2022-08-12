aws_region   = "us-east-1"
environment  = "dev"
project_name = "novinho-labs"
cidr_network = "10.0.0.0/16"

#availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
availability_zones = ["us-east-1a", "us-east-1b"]

k8s_version          = "1.21"
cluster_name         = "eks-novinho"
nodes_instances_size = "t2.small"

##auto_scale_options = {
##  min     = 0
##  max     = 1
##  desired = 0
##}

auto_scale_options = {
  min     = 4
  max     = 5
  desired = 4
}



auto_scale_cpu = {
  scale_up_threshold  = 80
  scale_up_period     = 60
  scale_up_evaluation = 2
  scale_up_cooldown   = 300
  scale_up_add        = 2

  scale_down_threshold  = 40
  scale_down_period     = 120
  scale_down_evaluation = 2
  scale_down_cooldown   = 300
  scale_down_remove     = -1
}

is_private = false

sg_ingress_rules = {
  "https" = {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "Allow HTTPS from specific cidr_block range"
  }
}

source_sg_ingress_rules = {
  "SGAllowSSH" = {
    source_security_group_id = "sg-063d04813cd1c195f"
    from_port                = 22
    to_port                  = 22
    protocol                 = "tcp"
    description              = "Allow SSH from specific source Security Group"
  }
}