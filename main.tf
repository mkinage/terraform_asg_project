provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = "Dev"
      Application = "ASG App"
    }
  }
}
module "aws_vpc" {
  source     = "./vpc_module"
  region     = "us-west-2"
  cidr_block = "10.0.0.0/16"
}

module "security_groups" {
  source = "./sg_module"
  #region = var.region
  region = "us-west-2"
  vpc_id = module.aws_vpc.app_vpc_id
}
module "ASG" {
  region      = "us-west-2"
  source      = "./asg_module"
  image_id    = "ami-0be5f59fbc80d980c"
  sg_id       = module.security_groups.app_sg
  pub_subnets = module.aws_vpc.public_subnet_ids
  tg_arn      = module.alb.tg_arn
  pvt_subnets = module.aws_vpc.private_subnet_id
}
module "alb" {
  source      = "./alb_module"
  region      = "us-west-2"
  alb_sg      = module.security_groups.alb_sg
  pub_subnets = module.aws_vpc.public_subnet_ids
  vpc_id      = module.aws_vpc.app_vpc_id
  pvt_subnets = module.aws_vpc.private_subnet_id
}