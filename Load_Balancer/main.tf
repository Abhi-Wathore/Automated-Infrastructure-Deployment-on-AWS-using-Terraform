# Application Load Balancer
resource "aws_lb" "main" {
  name               = var.aws_lb_name
  internal           = var.aws_lb_internal
  load_balancer_type = "application"
  security_groups    = var.aws_lb_security_groups
  subnets            = var.aws_lb_subnets

  tags = {
    Name = var.aws_lb_name
  }
}

# Target Group for the ALB
resource "aws_lb_target_group" "tg" {
  name        = var.aws_lb_target_group_name
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}
