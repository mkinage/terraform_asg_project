output "app_sg" {
  value = aws_security_group.app_sg.id
}
output "alb_sg" {
 value = aws_security_group.alb_sg.id 
}