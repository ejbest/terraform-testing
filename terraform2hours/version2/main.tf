# “Terraform in 2 Hours”  
# https://www.youtube.com/watch?v=SLB_c_ayRMo&t=5027s
# 
# Good Example for getting Started 

provider "aws" {
  region = var.ejb_region
}

# 1. Create VPC
resource "aws_vpc" "ejb-prod-vpc" {
  cidr_block = var.ejb_cidr_block
  tags = {
    Name = "ejb_production_vpc"
  }
}

# 2. Create Internet Gateway 
resource "aws_internet_gateway" "ejb-gw" {
  vpc_id = aws_vpc.ejb-prod-vpc.id
}

# 3. Create Route Table
resource "aws_route_table" "ejb-prod-route-table" {
  vpc_id = aws_vpc.ejb-prod-vpc.id

  route {
    # All traffic to the internet gateway
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ejb-gw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.ejb-gw.id
  }

  tags = {
    Name = "ejb-prod-route-table"
  }
}

# 4. Create a subnet-1
resource "aws_subnet" "ejb-subnet-1" {
  vpc_id                  = aws_vpc.ejb-prod-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Prod-subnet-1"
  }
}

# 5. Associate subnet with route table 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.ejb-subnet-1.id
  route_table_id = aws_route_table.ejb-prod-route-table.id
}

#6. Create Security group 22, 80, 443
resource "aws_security_group" "ejb-allow_web" {
  name        = "allow_web traffic"
  description = "Allow web inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.ejb-prod-vpc.id

  ingress {
    description = "https traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http just temporary"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ejb-allow-tls"
  }
}


# 7. Create network interface 
resource "aws_network_interface" "ejb-web-server-nic" {
  subnet_id       = aws_subnet.ejb-subnet-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.ejb-allow_web.id]
}

# 8. Assign Public EIP
resource "aws_eip" "one" {
  domain                    = "vpc"
  network_interface         = aws_network_interface.ejb-web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on                = [aws_internet_gateway.ejb-gw]
}


# 9. Create the WebServer
resource "aws_instance" "ejb-webserver" {
  ami               = var.ejb_ami_id
  instance_type     = var.ejb_instance_type
  availability_zone = var.ejb_availability_zone
  key_name          = var.ejb_key_name

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.ejb-web-server-nic.id
  }

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


output "server_private_ip___________" { value = aws_instance.ejb-webserver.private_ip }
output "server_public_ip1___________" { value = aws_eip.one.public_ip }
output "server_public_ip2___________" { value = aws_instance.ejb-webserver.public_ip }
output "server_public_dns___________" { value = aws_eip.one.public_dns }
output "server_id___________________" { value = aws_instance.ejb-webserver.id }
