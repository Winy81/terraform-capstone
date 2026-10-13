output "vpc_id" {
  value = aws_vpc.this.id
}

output "aws_internet_gateway_id"{
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

output "public_az1_subnet_id" {
  value = aws_subnet.public_az1.id
}

output "public_az2_subnet_id" {
  value = aws_subnet.public_az2.id
}

output "public_az3_subnet_id" {
  value = aws_subnet.public_az3.id
}

output "private_az1_subnet_id" {
  value = aws_subnet.private_az1.id
}

output "private_az2_subnet_id" {
  value = aws_subnet.private_az2.id
}

output "private_az3_subnet_id" {
  value = aws_subnet.private_az3.id
}
