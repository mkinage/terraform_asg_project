#Get the list of Availability zones in region
data "aws_availability_zones" "available_azs" {
  state = "available"
}
#Create Public Subnets
resource "aws_subnet" "public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone       = data.aws_availability_zones.available_azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public-Subnet-${count.index}"
  }

}
#Create private subnets
resource "aws_subnet" "private_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index + 2)
  availability_zone       = data.aws_availability_zones.available_azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-Subnet-${count.index + 2}"
  }

}