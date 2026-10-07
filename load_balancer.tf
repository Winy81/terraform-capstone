resource "aws_lb" "this" {

  name               = "adam-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = [
    aws_subnet.public_az1.id,
    aws_subnet.public_az2.id,
    aws_subnet.public_az3.id
  ]

  tags = merge(
    local.common_tags,
    {
      Name = "adam-alb"
    }
  )
}

resource "aws_lb_target_group" "this" {

  name     = "adam-app-tg"
  port     = 80
  protocol = "HTTP"

  vpc_id = aws_vpc.this.id

  target_type = "instance"

  health_check {
    enabled = true

    path = "/health"

    protocol = "HTTP"
  }

  tags = merge(
    local.common_tags,
    {
      Name = "adam-app-tg"
    }
  )
}

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.this.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type = "forward"

    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "app_az1" {

  target_group_arn = aws_lb_target_group.this.arn

  target_id = aws_instance.app_az1.id

  port = 80
}

resource "aws_lb_target_group_attachment" "app_az2" {

  target_group_arn = aws_lb_target_group.this.arn

  target_id = aws_instance.app_az2.id

  port = 80
}

resource "aws_lb_target_group_attachment" "app_az3" {

  target_group_arn = aws_lb_target_group.this.arn

  target_id = aws_instance.app_az3.id

  port = 80
}
