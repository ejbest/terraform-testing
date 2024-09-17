variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ejb_ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

# variable "key_name" {
#   description = "Name of the key pair"
#   type        = string
# }