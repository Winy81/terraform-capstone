resource "aws_instance" "app_az1" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_az1.id

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  key_name = "adam-ec2-key"

  tags = merge(
    local.common_tags,
    {
      Name = "adam-app-az1"
    }
  )
}

resource "aws_instance" "app_az2" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_az2.id

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  key_name = "adam-ec2-key"

  tags = merge(
    local.common_tags,
    {
      Name = "adam-app-az2"
    }
  )
}

resource "aws_instance" "app_az3" {

  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_az3.id

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  key_name = "adam-ec2-key"

  tags = merge(
    local.common_tags,
    {
      Name = "adam-app-az3"
    }
  )
}
