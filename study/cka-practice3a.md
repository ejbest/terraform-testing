
BOTTOM LINE - read the question and also 

1. What happens when you apply a Terraform configuration using terraform apply? (select two)
- Terraform updates the state file with configuration changes made during the execution
- Terraform makes infrastructure changes defined in your configuration.

3. What feature of Terraform provides an abstraction above the upstream API and is responsible for understanding API interactions and exposing resources?
- Terraform provider

6. Terraform Cloud maintains the state version and run history for each workspace (Select 3)
- Terraform Cloud maintains the state version and run history for each workspace
- Terraform Cloud manages infrastructure collections with a workspace whereas CLI manages collections of infrastructure resources with a persistent working directory
- CLI workspaces are alternative state files in the same working directory
- WRONG
- Run history is logged in a file underneath the working directory of a CLI workspace

11. When using Terraform Cloud, what is the easiest way to ensure the security and integrity of modules when used by multiple teams across different projects?
- Use the TFC Private Registry to ensure only approved modules are consumed by your organization

13. Which of the following are the benefits of using modules in Terraform? (select three)
- enables code reuse
- supports modules stored locally or remotely
- supports versioning to maintain compatibility
- WRONG
- allows modules to be stored anywhere accessible by Terraform

17. What happens if multiple users attempt to run a terraform apply simultaneously when using a remote backend? (select two)
- if the backend does not support locking, the state file could become corrupted
- if the backend supports locking, the first terraform apply will lock the file for changes, preventing the second user from running the apply

36. What function does the terraform init -upgrade command perform?
- update all previously installed plugins and modules to the newest version that complies with the configuration’s version constraints
- The terraform init -upgrade command updates all previously installed plugins and modules to the newest version that complies with the configuration’s version constraints. This ensures that the environment is up to date with the latest compatible versions of the plugins and modules.

40. Based on the following code, which code block will create a resource first?
<pre>
resource "aws_instance" "data_processing" {
    ami           = data.aws_ami.amazon_linux.id
    instance_type = "t2.micro"
    
    depends_on = [aws_s3_bucket.customer_data]
}
    
module "example_sqs_queue" {
    source  = "terraform-aws-modules/sqs/aws"
    version = "2.1.0"
    
    depends_on = [aws_s3_bucket.customer_data, aws_instance.data_processing]
}
    
resource "aws_s3_bucket" "customer_data" {
    acl = "private"
}
    
resource "aws_eip" "ip" {
    vpc      = true
    instance = aws_instance.data_processing.id
}
</pre>
- aws_s3_bucket.customer_data
- In this example, the only resource that does not have an implicit or an explicit dependency is the aws_s3_bucket.customer_data. Every other resource defined in this configuration has a dependency on another resource.

https://learn.hashicorp.com/tutorials/terraform/dependencies

42. You are working with a cloud provider to deploy resources using Terraform. You've added the following data block to your configuration. When the data block is used, what data will be returned?
<pre>
data "aws_ami" "amzlinux2" {
    most_recent = true
    owners      = ["amazon"]
    
    filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
    }
}


resource "aws_instance" "vault" {
    ami                         = data.aws_ami.amzlinux2.id
    instance_type               = "t3.micro"
    key_name                    = "vault-key"
    vpc_security_group_ids      = var.sg
    subnet_id                   = var.subnet
    associate_public_ip_address = "true"
    user_data                   = file("vault.sh")
    
    tags = {
    Name = "vault"
    }
}
</pre>
- all possible data of a specific Amazon Machine Image(AMI) from AWS


53. When using a Terraform provider, it's common that Terraform needs credentials to access the API for the underlying platform, such as VMware, AWS, or Google Cloud. While there are many ways to accomplish this, what are three options that you can provide these credentials? (select three)
- use environment variables
- directly in the provider block by hardcoding or using a variable
- integrated services, such as AWS IAM or Azure Managed Service Identity


54. Philip works at a payment processing company and manages the organization's VMware environment. He recently provisioned a new cluster for a production environment. To ensure everything is working as expected, Philip has been using Terraform and the VMware vSphere client to create and destroy new virtual machines. Currently, there are three virtual machines running on the new cluster, so Philip runs terraform destroy to remove the remaining virtual machines from the cluster. However, Terraform only removes two of the virtual machines, leaving one virtual machine still running.  Why would Terraform only remove two of the three virtual machines?
- the remaining virtual machine was not created by Terraform, therefore Terraform is not aware of the virtual machine and cannot destroy it


55. Which of the following best describes a "data source"?
- enables Terraform to fetch data for use elsewhere in the Terraform configuration
- Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration. Use of data sources allows a Terraform configuration to make use of information defined outside of Terraform, or defined by another separate Terraform configuration.

https://developer.hashicorp.com/terraform/language/data-sources