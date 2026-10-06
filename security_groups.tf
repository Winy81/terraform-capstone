########################################
# Security Groups
########################################

resource "aws_security_group" "alb" {

  name        = "adam-alb-sg"
  description = "Application Load Balancer security group"
  vpc_id      = aws_vpc.this.id

  tags = merge(
    local.common_tags,
    {
      Name = "adam-alb-sg"
    }
  )
}

resource "aws_security_group" "bastion" {

  name        = "adam-bastion-sg"
  description = "Bastion host security group"
  vpc_id      = aws_vpc.this.id

  tags = merge(
    local.common_tags,
    {
      Name = "adam-bastion-sg"
    }
  )
}

resource "aws_security_group" "app" {

  name        = "adam-app-sg"
  description = "Application server security group"
  vpc_id      = aws_vpc.this.id

  tags = merge(
    local.common_tags,
    {
      Name = "adam-app-sg"
    }
  )
}

resource "aws_security_group" "db" {

  name        = "adam-db-sg"
  description = "Database security group"
  vpc_id      = aws_vpc.this.id

  tags = merge(
    local.common_tags,
    {
      Name = "adam-db-sg"
    }
  )
}

########################################
# Bastion Rules
########################################

resource "aws_vpc_security_group_ingress_rule" "bastion_ssh" {

  security_group_id = aws_security_group.bastion.id

  cidr_ipv4 = var.admin_ip

  from_port = 22
  to_port   = 22

  ip_protocol = "tcp"
}

########################################
# App Rules
########################################

resource "aws_vpc_security_group_ingress_rule" "app_ssh" {

  security_group_id = aws_security_group.app.id

  referenced_security_group_id = aws_security_group.bastion.id

  from_port = 22
  to_port   = 22

  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "app_http" {

  security_group_id = aws_security_group.app.id

  referenced_security_group_id = aws_security_group.alb.id

  from_port = 80
  to_port   = 80

  ip_protocol = "tcp"
}

########################################
# ALB Rules
########################################

resource "aws_vpc_security_group_ingress_rule" "alb_http" {

  security_group_id = aws_security_group.alb.id

  cidr_ipv4 = var.default_route_cidr

  from_port = 80
  to_port   = 80

  ip_protocol = "tcp"
}

########################################
# Database Rules
########################################

resource "aws_vpc_security_group_ingress_rule" "db_postgres" {

  security_group_id = aws_security_group.db.id

  referenced_security_group_id = aws_security_group.app.id

  from_port = 5432
  to_port   = 5432

  ip_protocol = "tcp"
}
