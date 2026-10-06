output "vpc_id" {
  value = aws_vpc.this.id
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
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
