resource "aws_internet_gateway" "this" {

  vpc_id = aws_vpc.this.id

  tags = {
    Name = "adam-igw"
  }
}

resource "aws_eip" "this" {

  domain = "vpc"

  tags = {
    Name = "adam-nat-eip"
  }
}

resource "aws_nat_gateway" "this" {

  allocation_id = aws_eip.this.id

  subnet_id = aws_subnet.public_az1.id

  tags = {
    Name = "adam-nat"
  }
}
