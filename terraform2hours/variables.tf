
variable "ejb_ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "ejb_instance_type" {
  default  = "t2.micro"
}

variable "ejb_region" {
  default  = "us-east-1"
}

