resource "aws_instance" "bastion" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = module.vpc.public_az1_subnet_id

  vpc_security_group_ids = [
    module.security_groups.bastion_security_group_id
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
