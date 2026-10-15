resource "aws_instance" "bastion" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [
    var.security_group_id
  ]

  associate_public_ip_address = true

  key_name = "adam-ec2-key"

  tags = merge(
    var.common_tags,
    {
      Name = "adam-bastion"
    }
  )
}
