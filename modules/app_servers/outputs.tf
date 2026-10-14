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
