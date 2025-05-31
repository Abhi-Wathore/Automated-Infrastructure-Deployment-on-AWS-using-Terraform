# Auto Scaling configuration for EC2 instances in public subnet

resource "aws_launch_template" "web_app_template" {
  name_prefix   = "webapp-launch-"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.pub-subnet.id
    security_groups             = [data.aws_security_group.mysg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.instance_name
      Environment = var.environment
      Project = var.project_name
    }
  }
}

resource "aws_autoscaling_group" "web_app_asg" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.pub-subnet.id]
  launch_template {
    id      = aws_launch_template.web_app_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.instance_name
    propagate_at_launch = true
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300

  force_delete = true
  wait_for_capacity_timeout = "0"
  termination_policies      = ["OldestInstance"]
}

resource "aws_autoscaling_policy" "scale_out_policy" {
  name                   = "scale-out-webapp"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.web_app_asg.name
}

resource "aws_autoscaling_policy" "scale_in_policy" {
  name                   = "scale-in-webapp"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.web_app_asg.name
}
