variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone to create resources in"
  default     = "us-west-2a"
}

variable "ejb_region" {
  default = "us-west-2"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0c55b159cbfafe1f0"
}

# variable "key_name" {
#   description = "Key pair name to access the EC2 instance"
# }

variable "ejb_availability_zone" {
  description = "availablilty zone"
  type        = string
  default     = "us-east-1a"
}

variable "ejb_ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0e86e20dae9224db8" # Update this as needed
}

variable "ejb_instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro" # You can update this if needed
}

variable "ejb_key_name" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "ej"
}

variable "ejb_cidr_block" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "10.0.0.0/16"
}