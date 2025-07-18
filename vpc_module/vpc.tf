resource "aws_vpc" "app_vpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "app-vpc"
  }

}