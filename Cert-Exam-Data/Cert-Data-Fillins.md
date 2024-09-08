





1. To specify a specific Terraform workspace named "production" when running commands, you can use the command __
<pre>
terraform workspace select production
</pre>
2. You can use the command __ to reformat your configuration files in the standard canonical style for HCL.
<pre>
terraform apply -auto-approve
</pre>
3. How can you reference all of the subnets created by this resource block?
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

Your answer is incorrect
aws_subnet.private_subnet.id
</pre>
4. To list all resources in the current state, you can use the command __
<pre>
terraform state list
</pre>
5. The __ or the __ commands are available to delete all of your managed infrastructure.
<pre>
terraform destroy, terraform apply -destroy
</pre>
6. To skip the refresh step during a terraform apply, you can use the command __
<pre>
terraform apply -refresh=false
</pre>
7. The command __ can be used to ensure your code is syntactically valid and internally consistent.
<pre>
terraform validate
</pre>
8. In order to check the current version of Terraform you have installed, you can use the command __
<pre>
terraform version
</pre>

9. To force the destruction of resources without being prompted for confirmation, you can use the command __
<pre>
terraform destroy -auto-approve
</pre>
10. The __ command can be used to get an interactive console to evaluate expressions in your Terraform code.
<pre>
terraform console
</pre>
11. You are using Terraform Cloud to store your state file. Before you can use Terraform Cloud, you should run the command __ to obtain and save credentials for the remote backend.
<pre>
terraform login
</pre>
12. What command can you use to display details about the resource as shown below?
<pre>
 resource "aws_internet_gateway" "demo" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "demo_igw"
  }
}

Correct answer
terraform state show aws_internet_gateway.demo
</pre>


13. By default, Terraform stores its state in a file named __
<pre>
terraform.tfstate
</pre>

14. To automatically apply changes without interactive confirmation, you can use the command __
<pre>
terraform apply -auto-approve
</pre>

15. You need to access the attributes of a data source in your Terraform configuration for the following code. How should you reference the ID of the returned data? __ 

<pre>
data "aws_ami" "ubuntu" {
  most_recent = true
 
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
 
  owners = ["099720109477"] 
}

Correct answer
data.aws_ami.ubuntu.id

</pre>


16. You want Terraform to redeploy a specific resource that it is managing. Type the command you should use to mark the resource for replacement. __
<pre>
terraform apply -replace

Explanation
You would mark the resource for replacement using terraform apply -replace.

NOTE: This used to be terraform taint and has been replaced with terraform apply -replace
</pre>

17. The command __ is used to extract the output variables defined in the Terraform configuration.
<pre>
terraform output
</pre>


18. What command can be used to perform a dry-run of your changes and save the proposed changes to a file named bryan for future use? __

<pre>
terraform plan -out=bryan
</pre>


19. You have recently added new resource blocks from a different provider to your configuration. Type in the command you need to run before you can run a terraform plan/apply? __
<pre>
terraform init
</pre>

20. HOW DO YOU CALL THIS CODE SNIPPIT
<pre>
data "aws_s3_bucket" "data_bucket" {
  bucket = "my-data-lookup-bucket-bk"
}

data.aws_s3_bucket.data_bucket.id (data.<resource type>.<resource name>.id)

</
pre>
