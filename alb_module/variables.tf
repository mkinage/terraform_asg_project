variable "region" {
    description = "AWS region"
}
variable "alb_sg" {
    description = "ALB SG"

 
}
variable "pub_subnets" {
    type = list(string)
  
}
variable "vpc_id" {
    description = "AWS VPC ID"
  
}

variable "pvt_subnets" {
  
  description = "pvt subnets"
}