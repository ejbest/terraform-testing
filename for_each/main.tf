terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.58.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
resource "aws_instance" "my_server" {
  for_each = {
    nano  = "t2.nano"
    micro = "t2.micro"
    small = "t2.small"
  }
  ami           = "ami-0e86e20dae9224db8"
  instance_type = each.value
  tags = {
    Name = "Server-${each.key}"
  }    
}

output "pubic_ip" {
  # below the [*] is a "terraform splat function"
  value = values(aws_instance.my_server)[*].public_ip
}

# example of a terraform for_each expression
# used this video https://www.youtube.com/watch?v=HS0W68IMt34