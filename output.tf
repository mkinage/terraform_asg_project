output "nap2" {
  value = module.aws_vpc.nat_ip

}
output "alb_dns_name" {
  value = module.alb.alb_dns_name

}