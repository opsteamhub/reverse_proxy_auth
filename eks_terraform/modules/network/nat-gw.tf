resource "aws_eip" "vpc_eip" {
  for_each = local.convert_az_list_to_map

  vpc = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-eip"
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_nat_gateway" "nat" {
  for_each = local.convert_az_list_to_map

  allocation_id = aws_eip.vpc_eip[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [
    aws_eip.vpc_eip,
    aws_internet_gateway.gw
  ]

  tags = {
    Name        = "${var.project_name}-${var.environment}-nat-gw"
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_route_table" "nat" {
  for_each = local.convert_az_list_to_map

  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-rt"
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_route" "nat_access" {
  for_each = local.convert_az_list_to_map

  route_table_id         = aws_route_table.nat[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[each.key].id
}