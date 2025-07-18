resource "aws_alb_target_group" "app_tg" {
   # name = "app_tg"
    port = "80"
    protocol = "HTTP"
    vpc_id = var.vpc_id
    target_type = "instance"
}
/*
resource "aws_alb_target_group_attachment" "app_tg_attach" {
    target_group_arn = aws_alb_target_group.app_tg.arn
    target_id = var.instance_id
    port = 80
}
*/