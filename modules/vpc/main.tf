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

resource "aws_subnet" "public_az1" {
  vpc_id            = aws_vpc.this.id
  cidr_block = var.public_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]

  tags = merge(
    var.common_tags,
    {
      Name = "adam-public-az1"
    }
  )
}

resource "aws_subnet" "public_az2" {
  vpc_id            = aws_vpc.this.id
  cidr_block = var.public_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]

  tags = merge(
    var.common_tags,
    {
      Name = "adam-public-az2"
    }
  )
}

resource "aws_subnet" "public_az3" {
  vpc_id            = aws_vpc.this.id
  cidr_block = var.public_subnet_cidrs[2]
  availability_zone = var.availability_zones[2]

  tags = merge(
    var.common_tags,
    {
      Name = "adam-public-az3"
    }
  )
}

resource "aws_subnet" "private_az1" {
  vpc_id            = aws_vpc.this.id
  cidr_block = var.private_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]

  tags = merge(
    var.common_tags,
    {
      Name = "adam-private-az1"
    }
  )
}

resource "aws_subnet" "private_az2" {
  vpc_id            = aws_vpc.this.id
  cidr_block = var.private_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]

  tags = merge(
    var.common_tags,
    {
      Name = "adam-private-az2"
    }
  )
}

resource "aws_subnet" "private_az3" {
  vpc_id            = aws_vpc.this.id
  cidr_block = var.private_subnet_cidrs[2]
  availability_zone = var.availability_zones[2]

  tags = merge(
    var.common_tags,
    {
      Name = "adam-private-az3"
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
  subnet_id     = aws_subnet.public_az1.id

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

resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_az1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az2" {
  subnet_id      = aws_subnet.public_az2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az3" {
  subnet_id      = aws_subnet.public_az3.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_az1" {
  subnet_id      = aws_subnet.private_az1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_az2" {
  subnet_id      = aws_subnet.private_az2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_az3" {
  subnet_id      = aws_subnet.private_az3.id
  route_table_id = aws_route_table.private.id
}
