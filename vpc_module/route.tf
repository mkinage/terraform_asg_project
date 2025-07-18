#IGW Route for internet access
resource "aws_route_table" "igw_route" {
    vpc_id = aws_vpc.app_vpc.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.app_igw.id
    }
    tags = {
        Name = "Public-Route"
    }
}
# Associate public subnets to route table
resource "aws_route_table_association" "public_sub_asso" {
    count = length(aws_subnet.public_subnet)
    subnet_id = aws_subnet.public_subnet[count.index].id
    route_table_id = aws_route_table.igw_route.id
  }

# NAT Route
resource "aws_route_table" "nat_route" {
    vpc_id = aws_vpc.app_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.app_ngw.id
    
    }
tags = {
  Name = "Private-Route"
}
}

resource "aws_route_table_association" "private_sub_asso" {
  count = length(aws_subnet.private_subnet)
  subnet_id = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.nat_route.id
}