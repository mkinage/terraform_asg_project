resource "aws_eip" "nat_eip" {
  tags = {
    Name = "nat_eip"
  }
}