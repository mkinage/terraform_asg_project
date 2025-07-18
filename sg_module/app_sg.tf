
    locals {
        ingress_rules = [{
            port = 443
            },
            {
                port = 80
            }]
    }
        
    
resource "aws_security_group" "app_sg" {
    name = "app_sg"
    vpc_id = var.vpc_id
    dynamic "ingress" {
        for_each = local.ingress_rules
        
        content {
            from_port = ingress.value.port
            to_port = ingress.value.port
            protocol = "tcp"
            security_groups = [aws_security_group.alb_sg.id]
      


        }
    }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}