resource "aws_instance" "app_az1" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.private_az1_subnet_id

  vpc_security_group_ids = [
    var.security_group_id
  ]

  key_name = "adam-ec2-key"

  tags = merge(
    var.common_tags,
    {
      Name = "adam-app-az1"
    }
  )
}

resource "aws_instance" "app_az2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.private_az2_subnet_id

  vpc_security_group_ids = [
    var.security_group_id
  ]

  key_name = "adam-ec2-key"

  tags = merge(
    var.common_tags,
    {
      Name = "adam-app-az2"
    }
  )
}

resource "aws_instance" "app_az3" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.private_az3_subnet_id

  vpc_security_group_ids = [
    var.security_group_id
  ]

  key_name = "adam-ec2-key"

  tags = merge(
    var.common_tags,
    {
      Name = "adam-app-az3"
    }
  )
}
