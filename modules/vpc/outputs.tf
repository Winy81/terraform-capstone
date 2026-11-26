output "vpc_id" {
  value = aws_vpc.this.id
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}

output "nat_eip" {
  value = aws_eip.this.public_ip
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}

output "public_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.public :
    key => subnet.id
  }
}

output "private_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.private :
    key => subnet.id
  }
}
