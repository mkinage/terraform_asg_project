#Create IGW
resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.app_vpc.id
  tags = {
    Name = "app_igw"
  }

}

#Create NAT Gateway
resource "aws_nat_gateway" "app_ngw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  depends_on    = [aws_eip.nat_eip]
  tags = {
    Name = "App GateWay"
  }

}