# Demo / learning outputs.
# In production these would normally be reduced or removed.

output "internet_gateway_id" {
  value = module.vpc.aws_internet_gateway_id
}

output "nat_gateway_id" {
  value = module.vpc.nat_gateway_id
}

output "nat_eip" {
  value = module.vpc.nat_eip
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}

output "private_route_table_id" {
  value = module.vpc.private_route_table_id
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
  value = module.security_groups.alb_security_group_id
}

output "bastion_security_group_id" {
  value = module.security_groups.bastion_security_group_id
}

output "app_security_group_id" {
  value = module.security_groups.app_security_group_id
}

output "db_security_group_id" {
  value = module.security_groups.db_security_group_id
}
