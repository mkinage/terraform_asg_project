output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}
output "private_subnet_id" {
  value = aws_subnet.private_subnet[*].id
}
output "nat_ip" {
  value = aws_eip.nat_eip.address
}
output "app_vpc_id" {
  value = aws_vpc.app_vpc.id
  
}
