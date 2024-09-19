variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

# variable "key_name" {
#   description = "Name of the key pair"
#   type        = string
# }