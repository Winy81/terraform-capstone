resource "aws_instance" "bastion" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_az1.id

  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]

  associate_public_ip_address = true

  key_name = "adam-ec2-key"

  tags = merge(
    local.common_tags,
    {
      Name = "adam-bastion"
    }
  )

}
