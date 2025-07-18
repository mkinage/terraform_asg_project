output "aws_alg_tg" {
    value = aws_alb_target_group.app_tg.id
  
}
output "tg_arn" {
    value = aws_alb_target_group.app_tg.arn
  
}

output "alb_dns_name" {
    value = aws_lb.app_lb.dns_name
  
}