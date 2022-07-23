//
// Public subnets
//
locals {
  convert_az_list_to_map = toset([for az in var.availability_zones : tostring(az)]) # for_each must use map - not list.

  # make sure private and public subnets don't overlap
  subnet_netnum_factor = {
    public  = 0
    private = length(var.availability_zones)
  }
}

resource "aws_subnet" "public" {
  for_each = local.convert_az_list_to_map

  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 4, index(var.availability_zones, each.key) + local.subnet_netnum_factor.public)
  availability_zone       = each.key
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = {
    Name        = "${var.project_name}-${var.environment}-pub-subnet"
    Environment = var.environment
    Description = "Managed by Terraform"
    // This tag is mandatory for EKS - DO NOT remove it from here.
    "kubernetes.io/cluster/${var.project_name}-${var.environment}-${var.cluster_name}" = "shared"
  }
}

//
// Private subnets
//

resource "aws_subnet" "private" {
  for_each = local.convert_az_list_to_map

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 4, index(var.availability_zones, each.key) + local.subnet_netnum_factor.private)
  availability_zone = each.key


  tags = {
    Name        = "${var.project_name}-${var.environment}-priv-subnet"
    Environment = var.environment
    Description = "Managed by Terraform"
    // This tag is mandatory for EKS - DO NOT remove it from here.
    "kubernetes.io/cluster/${var.project_name}-${var.environment}-${var.cluster_name}" = "shared"
  }
}

//
// Route table association
//

resource "aws_route_table_association" "public" {
  for_each = local.convert_az_list_to_map

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.igw_route_table[each.key].id
}

resource "aws_route_table_association" "private" {
  for_each = local.convert_az_list_to_map

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.nat[each.key].id
}