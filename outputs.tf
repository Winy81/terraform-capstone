# Demo / learning outputs.
# In production these would normally be reduced or removed.

output "vpc_id" {
  value = aws_vpc.this.id
}

output "internet_gateway_id" {
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

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "app_az1_instance_id" {
  value = aws_instance.app_az1.id
}

output "app_az2_instance_id" {
  value = aws_instance.app_az2.id
}

output "app_az3_instance_id" {
  value = aws_instance.app_az3.id
}

output "app_az1_private_ip" {
  value = aws_instance.app_az1.private_ip
}

output "app_az2_private_ip" {
  value = aws_instance.app_az2.private_ip
}

output "app_az3_private_ip" {
  value = aws_instance.app_az3.private_ip
}

output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "alb_arn" {
  value = aws_lb.this.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.this.arn
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
}

output "bastion_security_group_id" {
  value = aws_security_group.bastion.id
}

output "app_security_group_id" {
  value = aws_security_group.app.id
}

output "db_security_group_id" {
  value = aws_security_group.db.id
}
