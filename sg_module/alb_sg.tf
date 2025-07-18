variable "alb_allowed_ports" {
    type = list(number)
    default = [ 80, 443, 4445 ]
}
variable "allowd_ips" {
    type = list(string)
    default = [ "0.0.0.0/0", "192.168.0.10/32", "10.0.0.32/32" ]
}

locals {
  combined_ingress_rule = flatten([
    for port in var.alb_allowed_ports : [
        for ip in var.allowd_ips : {
            from_port = port,
            to_port = port,
            protocol = "tcp",
            cidr_blocks = [ip],
            description = "Allowed port ${port} from ${ip}"
            
        }
    ]
  ])
}

resource "aws_security_group" "alb_sg" {
    name = "alb_sg"
    description = "SG with dynamic rules"
    vpc_id = var.vpc_id
    dynamic "ingress" {
        for_each = local.combined_ingress_rule
        content {
          from_port = ingress.value.from_port
          to_port = ingress.value.to_port
          protocol = ingress.value.protocol
          #protocol = ingrees.value.protocol
          cidr_blocks = ingress.value.cidr_blocks
          description = ingress.value.description

        }
      
    }
 egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 } 
}

