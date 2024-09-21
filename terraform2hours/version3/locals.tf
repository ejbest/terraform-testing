# Define a local block with some variables
locals {
  ejb_environment       = "production"
  ejb_region            = "us-east-1"
  ejb_availability_zone = "us-east-1a"
  ejb_instance_type     = "t2.micro"
  ejb_cidr_block        = "10.0.0.0/16"
  ejb_ipv6_cidr_block   = "::/0"
  ejb_ami_id            = "ami-0e86e20dae9224db8"
  ejb_key_name          = "ej"
  common_tags = {
    environment = local.ejb_environment
    team        = "ejb-devops"
    project     = "ejb-app"
  }
}
