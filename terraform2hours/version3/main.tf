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

# generate private and corresponding public key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


# resource "null_resource" "ej-priv-key" 
resource "null_resource" "ej-priv-key" {
  provisioner "local-exec" {
    command = <<EOT
    echo "${tls_private_key.ssh_key.private_key_pem}" > ej.pem && chmod 0600 ej.pem
    EOT
  }
}


resource "aws_key_pair" "ej_key" {
  key_name   = local.ejb_key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# 9. Create the WebServer
resource "aws_instance" "ejb-webserver" {
  ami               = local.ejb_ami_id
  instance_type     = local.ejb_instance_type
  availability_zone = local.ejb_availability_zone
  key_name          = aws_key_pair.ej_key.key_name# Use the public key for AWS EC2
 

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
