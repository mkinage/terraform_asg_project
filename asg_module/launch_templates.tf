resource "aws_launch_template" "app_template" {
    name = "app_launch_template"
    block_device_mappings {
      device_name = "/dev/sdf"
      ebs {
        volume_size = 20
      }
    }
capacity_reservation_specification {
  capacity_reservation_preference = "open"

}

credit_specification {
  cpu_credits = "standard"
}
disable_api_stop = true
disable_api_termination = true
ebs_optimized = true
image_id = var.image_id
instance_type = "t2.micro"
depends_on = [ aws_key_pair.app_key ]
network_interfaces {
  associate_public_ip_address = true
  security_groups = [ var.sg_id ]
  }
  user_data = base64encode(file("user_data.sh"))
  key_name = "app_key"
  
}

#SSH Key for login
resource "aws_key_pair" "app_key" {
  key_name = "app_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDqvCu3ddL11EKoOR0lU6RiAarMw5/EqmkVjohRoyAwoGztRFT+klJDEMUSdBXd6ws/MzM1heQvwC6US/nW5/CtBGlaLNu0BbSVhXKxLOI2VxlAm4lcZMGxZU0BJHzwrs6vtxaLCyix8xasvSqhAmAPt/Tdm7InjXj2cONfFL9vLpM3rR1awO+3iWhK8KQTcJFAqzMBXijVbbexSWkir2O0IpeTELvJL3tYmtJwMt/1syTQLv+6V+HK0eP53ZwDwHnXovX8gM6KVkcxT1yv/b/Izj5TwqK4z/E5pYG7Nhb8zSK4XEMvGvv4yFT3zhLmWNRbr31QUxPElHIqTeFDD77"
  
}