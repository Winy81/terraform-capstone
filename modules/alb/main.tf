resource "aws_lb" "this" {
  name               = "adam-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.security_group_id
  ]

  subnets = var.public_subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = "adam-alb"
    }
  )
}

resource "aws_lb_target_group" "this" {
  name     = "adam-app-tg"
  port     = 80
  protocol = "HTTP"

  vpc_id = var.vpc_id

  target_type = "instance"

  health_check {
    enabled  = true
    path     = "/health"
    protocol = "HTTP"
  }

  tags = merge(
    var.common_tags,
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
  target_id        = var.app_instance_ids[0]
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_az2" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.app_instance_ids[1]
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_az3" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.app_instance_ids[2]
  port             = 80
}
