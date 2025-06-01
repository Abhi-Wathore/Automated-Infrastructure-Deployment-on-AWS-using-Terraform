resource "aws_load_balancer" "name" {
    name               = var.lb_name
    internal           = false
    load_balancer_type = "application"
    security_groups    = [data.aws_security_group.mysg.id]
    subnets            = [aws_subnet.pub-subnet.id, aws_subnet.pvt-subnet.id]
    vpc_id = var.vpc_id

    
    tags = {
        Name = var.lb_name
    }
    # The load balancer is created with the name defined in the variable lb_name
}
resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_load_balancer.name.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "fixed-response"
        fixed_response {
            content_type = "text/plain"
            message_body = "Hello, World!"
            status_code  = "200"
        }
    }
    # This listener listens on port 80 and responds with a fixed message
}
resource "aws_lb_target_group_attachment" "attachment" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id        = aws_instance.web.id
    port             = 80
    # This attaches the web instance to the target group
}
resource "aws_lb_target_group" "tg" {
    name     = var.aws_lb_target_group_name
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.mainvpc.id

    health_check {
        path                = "/"
        interval            = 30
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
    }
    # This target group is created for the load balancer with health checks configured
}
