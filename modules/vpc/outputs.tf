output "vpc_id" {
  value = aws_vpc.this.id
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
