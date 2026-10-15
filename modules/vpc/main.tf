########################################
# VPC
########################################

resource "aws_vpc" "this" {

  cidr_block = var.vpc_cidr

  tags = merge(
    var.common_tags,
    {
      Name = "adam-capstone-vpc"
    }
  )
}

########################################
# Subnets
########################################

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(
    var.common_tags,
    {
      Name = "adam-public-${each.key}"
    }
  )
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = merge(
    var.common_tags,
    {
      Name = "adam-private-${each.key}"
    }
  )
}

########################################
# Gateways
########################################

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.common_tags,
    {
      Name = "adam-igw"
    }
  )
}

resource "aws_eip" "this" {
  domain = "vpc"

  tags = merge(
    var.common_tags,
    {
      Name = "adam-nat-eip"
    }
  )
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id = aws_subnet.public[var.nat_gateway_subnet_key].id

  tags = merge(
    var.common_tags,
    {
      Name = "adam-nat"
    }
  )
}

########################################
# Route Tables
########################################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.default_route_cidr
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "adam-public-rt"
    }
  )
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = var.default_route_cidr
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "adam-private-rt"
    }
  )
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}

