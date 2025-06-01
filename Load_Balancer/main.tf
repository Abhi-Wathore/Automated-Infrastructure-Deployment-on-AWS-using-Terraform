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

resource "aws_lb_target_group" "tg" {
  name     = var.aws_lb_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
