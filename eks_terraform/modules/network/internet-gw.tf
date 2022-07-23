resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_vpc.main
  ]

  tags = {
    Name        = "${var.project_name}-${var.environment}-internet-gw"
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_route_table" "igw_route_table" {
  for_each = local.convert_az_list_to_map

  vpc_id = aws_vpc.main.id

  depends_on = [
    aws_internet_gateway.gw
  ]

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-rt"
    Environment = var.environment
    Description = "Managed by Terraform"
  }
}

resource "aws_route" "public_internet_access" {
  for_each = local.convert_az_list_to_map

  route_table_id         = aws_route_table.igw_route_table[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id

  depends_on = [
    aws_route_table.igw_route_table
  ]
}