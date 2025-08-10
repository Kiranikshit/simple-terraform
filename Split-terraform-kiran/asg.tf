# Auto Scaling Group
resource "aws_autoscaling_group" "web_asg" {
  desired_capacity    = 2
  max_size            = 6
  min_size            = 1
  vpc_zone_identifier = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  target_group_arns   = [aws_lb_target_group.web_tg.arn]

  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "web-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
