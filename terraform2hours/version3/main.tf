# “Terraform in 2 Hours”  
# https://www.youtube.com/watch?v=SLB_c_ayRMo&t=5027s
# 
# Good Example for getting Started 
# in this version we are moving hard coded values out 

provider "aws" {
  region = local.ejb_region
}

# 1. Create VPC
resource "aws_vpc" "ejb-prod-vpc" {
  cidr_block = local.ejb_cidr_block
  tags = {
    Name = "ejb_production_vpc"
  }
}


# 9. Create the WebServer
resource "aws_instance" "ejb-webserver" {
  ami               = local.ejb_ami_id
  instance_type     = local.ejb_instance_type
  availability_zone = local.ejb_availability_zone
  key_name          = local.ejb_key_name
  subnet_id         = aws_subnet.ejb-subnet-1.id    # Use Subnet directly
  vpc_security_group_ids = [aws_security_group.ejb-allow_web.id]  # Use security groups directly

  # network_interface {
  #   device_index         = 0
  #   network_interface_id = aws_network_interface.ejb-web-server-nic.id
  # }

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF
  tags = {
    Name = "ejb-web-server"
  }
}
