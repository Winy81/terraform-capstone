resource "aws_subnet" "public_az1" {
  vpc_id            = aws_vpc.this.id
  cidr_block = var.public_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]
  
  tags = merge(
    local.common_tags,
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
    local.common_tags,
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
    local.common_tags,
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
    local.common_tags,
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
    local.common_tags,
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
    local.common_tags,
    {
      Name = "adam-private-az3"
    }
  )
}
