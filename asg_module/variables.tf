variable "region" {
    description = "AWS region"
  
}
variable "image_id" {
    description = "AMI ID"
 }
 variable "sg_id" {
    description = "App SG ID"
 }

 variable "pub_subnets" {
   description = "pub subnets"   
 }

variable "tg_arn" {
    description = "TG ARN"
}
variable "pvt_subnets" {
    description = "pvt subnets"
  
}