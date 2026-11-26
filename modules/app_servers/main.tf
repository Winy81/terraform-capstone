resource "aws_instance" "app" {
  for_each = var.private_subnet_ids

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = each.value

  vpc_security_group_ids = [
    var.security_group_id
  ]

  key_name = "adam-ec2-key"

  tags = merge(
    var.common_tags,
    {
      Name = "adam-app-${each.key}"
    }
  )
}
