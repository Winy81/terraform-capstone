output "instance_ids" {
  value = {
    for key, instance in aws_instance.app :
    key => instance.id
  }
}

output "private_ips" {
  value = {
    for key, instance in aws_instance.app :
    key => instance.private_ip
  }
}
