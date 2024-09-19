provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source        = "./modules/ec2_instance"
  instance_type = "t2.micro"
  ami_id        = "ami-0e86e20dae9224db8"
  #ami_id        = var.ejb_ami_id
}

output "instance2_id" {
  value = module.ec2_instance.instance_id
}