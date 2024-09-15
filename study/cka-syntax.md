



<pre>
#Deploy the private subnets
resource "aws_subnet" "private_subnets" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value)
  availability_zone = tolist(data.aws_availability_zones.available.names)[each.value]
 
  tags = {
    Name      = each.key
    Terraform = "true"
  }
}
</pre>
- aws_subnet.private_subnets[*]


https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

https://learn.hashicorp.com/tutorials/terraform/for-each


variable "env" {
  type = map(any)
  default = {
    prod = {
      ip = "10.0.150.0/24"
      az = "us-east-1a"
    }
    dev  = {
      ip = "10.0.250.0/24"
      az = "us-east-1e"
    }
  }
}</pre>
- each.value.ip

