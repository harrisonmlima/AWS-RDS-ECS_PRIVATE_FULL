# VPC Endpoints
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.${data.aws_region.current.name}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private.id]
  tags = {
    Name        = "s3-endpoint"
    Environment = "dev"
  }
}
resource "aws_vpc_endpoint" "dkr" {
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  security_group_ids = [
    aws_security_group.vpc_endpoint.id,
  ]
  subnet_ids = [aws_subnet.main-subnet-private-1a.id, aws_subnet.main-subnet-private-1b.id]
  tags = {
    Name        = "dkr-endpoint"
    Environment = "dev"
  }
}
resource "aws_vpc_endpoint" "dkr_api" {
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ecr.api"
  vpc_endpoint_type   = "Interface"
  security_group_ids = [
    aws_security_group.vpc_endpoint.id,
  ]
  subnet_ids = [aws_subnet.main-subnet-private-1a.id, aws_subnet.main-subnet-private-1b.id]
  tags = {
    Name        = "dkr-api-endpoint"
    Environment = "dev"
  }
}

resource "aws_vpc_endpoint" "rds" {
  vpc_id              = aws_vpc.main.id
  private_dns_enabled = true
  service_name        = "com.amazonaws.${data.aws_region.current.name}.rds"
  vpc_endpoint_type   = "Interface"
  security_group_ids = [
    aws_security_group.vpc_endpoint.id,
  ]
  subnet_ids = [aws_subnet.main-subnet-private-1a.id, aws_subnet.main-subnet-private-1b.id]
  tags = {
    Name        = "rds-endpoint"
    Environment = "dev"
  }
}
