resource "aws_autoscaling_group" "app_asg_tg" {
    name = "app_asg_tg"
    desired_capacity = 2
    max_size = 3
    min_size = 1
    vpc_zone_identifier = var.pvt_subnets
    target_group_arns = [var.tg_arn]
    launch_template {
      id = aws_launch_template.app_template.id
      version = "$Latest"
    }
}
