resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
   type = "forward"
   target_group_arn = aws_alb_target_group.app_tg.arn
   }
   }


