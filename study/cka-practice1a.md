

10. What feature of Terraform Cloud allows you to publish and maintain a set of custom modules that can only be used within your organization?
- private registry
- The private registry feature in Terraform Cloud allows users to publish and maintain custom modules within their organization, providing a secure and controlled environment for sharing infrastructure configurations.

15. Which code snippet would allow you to retrieve information about existing resources and use that information within your Terraform configuration?
<pre>
module "deploy-servers" {
    source  = "./app-cluster"
    
    servers = 5
}
</pre>
- This code snippet defines a data block for retrieving information about an AWS AMI (Amazon Machine Image) based on specific criteria like owners and tags. This data can then be used within the Terraform configuration to make decisions or set attributes based on the retrieved information.
<pre>
data "aws_ami" "aws_instance" {
    most_recent = true
    
    owners = ["self"]
    tags = {
    Name   = "app-server"
    Tested = "true"
    }
}
</pre>

26. What environment variable can be set to enable detailed logging for Terraform?
- TF_LOG 
- this is a tricky one 

33. Where does Terraform Community (Free) store the local state for workspaces?
- directory called terraform.tfstate.d/<workspace name> 
- workspaces location

34. You and a colleague are working on updating some Terraform configurations within your organization. You need to follow a new naming standard for the local name within your resource blocks. However, you don't want Terraform to replace the object after changing your configuration files.
- As an example, you want to change data-bucket to now be prod-encrypted-data-s3-bucket in the following resource block:
<pre>
resource "aws_s3_bucket" "data-bucket" {
    bucket = "corp-production-data-bucket"
    
    tags = {
    Name        = "corp-production-data-bucket"
    Environment = "prod"
    }
}
</pre>
- After updating the resource block, what command would you run to update the local name while ensuring Terraform does not replace the existing resource?
<pre>
terraform state mv aws_s3_bucket.data-bucket aws_s3_bucket.prod-encrypted-data-s3-bucket
</pre>
- The correct command to update the local name without replacing the existing resource is to use the `terraform state mv` command. This command will move the existing state object to the new local name specified, ensuring that Terraform does not replace the resource.

38. Why might a user opt to include the following snippet in their configuration file?
<pre>
    terraform {
      required_version = ">= 1.9.2"
    }
</pre>
- The user wants to specify the minimum version of Terraform that is required to run the configuration

41. Which are some of the benefits of using Infrastructure as Code in an organization? (select three)
- IaC code can be used to manage infrastructure on multiple cloud platforms (correct one I keep getting wrong)
- IaC allows you to commit your configurations to version control to safely collaborate on infrastructure
- IaC uses a human-readable configuration language to help you write infrastructure code quickly

- INCORRECT 
- IaC is written as an imperative approach, where specific commands need to be executed in the correct order
    - This statement is incorrect. IaC follows a declarative approach, where the desired state of the infrastructure is defined, rather than specific commands to be executed in a particular order.



45. Which of the following variable declarations is going to result in an error?  This variable declaration is valid as it includes a description, type, and default value for the variable "example". The type specified is a map, and the default value is a valid map with key-value pairs.
<pre>
    variable "example" { 
      description = "This is a test"
      type        = map
      default     = {"one" = 1, "two" = 2, "Three" = "3"}
    }
</pre>
- Overall explanation -This variable declaration for a type list is incorrect because a list expects square brackets [ ] and not curly braces. All of the others are correct variable declarations.

From the official HashiCorp documentation found here:

Lists/tuples are represented by a pair of square brackets containing a comma-separated sequence of values, like ["a", 15, true].