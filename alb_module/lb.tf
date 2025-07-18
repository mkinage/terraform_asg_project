resource "aws_lb" "app_lb" {
    name = "app-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = ["${var.alb_sg}"]
    subnets = var.pub_subnets
    
}

