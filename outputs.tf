output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_map" {
  value = local.public_subnets
}
