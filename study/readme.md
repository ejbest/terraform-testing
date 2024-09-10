<h1>Terraform Study Points</h1>

1. To specify a specific Terraform workspace named "production" when running commands, you can use the command  }$$
<pre>
terraform workspace select production
</pre>

2. You can use the command __ to reformat your configuration files in the standard canonical style for HCLBlue}$$
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

Explanation
terraform state show ADDRESS will show the attributes of a single resource, therefore the answer is aws_internet_gateway.demo
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

20. How would you call this code snipped.
<pre>
data "aws_s3_bucket" "data_bucket" {
  bucket = "my-data-lookup-bucket-bk"
}

Answer 
data.aws_s3_bucket.data_bucket.id (data.<resource type>.<resource name>.id)
</pre>

21. Freddy and his co-worker Jason are deploying resources in GCP using Terraform for their team. After resources have been deployed, they must destroy the cloud-based resources to save on costs. However, two other team members, Michael and Chucky, are using a Cloud SQL instance for testing and request to keep it running.  How can Freddy and Jason destroy all other resources without negatively impacting the database?
<pre>
run a terraform state rm command to remove the Cloud SQL instance from Terraform management before running the terraform destroy command
</pre>

22. What environment variable can be set to enable detailed logging for Terraform?
<pre>
TF_DEBUG

Explanation
The environment variable `TF_DEBUG` is not used to enable detailed logging for Terraform. It is typically used for debugging purposes and not for detailed logging.
</pre>

23. From the code below, identify the implicit dependency:
<pre>
resource "aws_eip" "public_ip" {
    vpc      = true
    instance = aws_instance.web_server.id
}
 
resource "aws_instance" "web_server" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.company_data]
}
ANSWER 
The EC2 instance labeled web_server
</pre>

24. You are developing a new Terraform module to demonstrate features of the most popular HashiCorp products. You need to spin up an AWS instance for each tool, so you create the resource block as shown below using the for_each meta-argument. -------- After the deployment, you view the state using the terraform state list command. What resource address would be displayed for the instance related to vault?
<pre>
resource "aws_instance" "bryan-demo" {
  # ...
  for_each = {
    "terraform": "infrastructure",
    "vault":     "security",
    "consul":    "connectivity",
    "nomad":     "scheduler",
  }
}
ANSWER 
aws_instance.bryan-demo["vault"]
</pre>

25. After many years of using Terraform Community (Free), you decide to migrate to Terraform Cloud. After the initial configuration, you create a workspace and migrate your existing state and configuration. What Terraform version would the new workspace be configured to use after the migration?
<pre>
the same Terraform version that was used to perform the migration

Explanation
The new workspace in Terraform Cloud will be configured to use the same Terraform version that was used to perform the migration. This ensures compatibility and consistency with the existing state and configuration.
</pre>

26. Which of the following is a valid variable name in Terraform?
<pre>
version
lifecycle
count
invalid (INCORRECT)
This is a valid variable name in Terraform as it follows the naming conventions for variables, which allow alphanumeric characters and underscores, and must start with a letter or underscore.

</pre>

27. Where does Terraform Community (Free) store the local state for workspaces?
<pre>
directory called terraform.tfstate.d/<workspace name>

Explanation
Terraform Community (Free) stores the local state for workspaces in a directory called `terraform.tfstate.d/`. This directory structure allows for separate state files for each workspace, making it easier to manage and maintain the state data.
workspaces workspaces workspaces workspaces workspaces workspaces 
</pre>

28. Which are some of the benefits of using Infrastructure as Code in an organization? (select three)
<pre>
OK IaC code can be used to manage infrastructure on multiple cloud platforms
OK IaC allows you to commit your configurations to version control to safely collaborate on infrastructure
OK IaC uses a human-readable configuration language to help you write infrastructure code quickly
XXXXX IaC is written as an imperative approach, where specific commands need to be executed in the correct order XXXXXX
 </pre>

29. You are performing a code review of a colleague's Terraform code and see the following code. Where is this module stored?
<pre>
module "vault-aws-tgw" {
  source  = "terraform-vault-aws-tgw/hcp"
  version = "1.0.0"
  
  client_id      = "4djlsn29sdnjk2btk"
  hvn_id         = "a4c9357ead4de"
  route_table_id = "rtb-a221958bc5892eade331"
}
ANSWER the Terraform public registry

Explanation
The code specifies a source from "terraform-vault-aws-tgw/hcp", which is a typical format for modules stored in the Terraform public registry. This choice is correct based on the information provided in the code snippet.
</pre>


30. What do the declarations, such as name, cidr, and azs, in the following Terraform code represent and what purpose do they serve?
<pre>
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"
 
  name = var.vpc_name
  cidr = var.vpc_cidr
 
  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
 
  enable_nat_gateway = var.vpc_enable_nat_gateway
 
  tags = var.vpc_tags
}

ANSWER these are variables that are passed into the child module likely used for resource creation

Explanation
The values of the variables like name, cidr, and azs are not obtained from values created within the child module. Instead, these variables are typically defined and assigned values in the calling module or through input variables provided during the Terraform execution.
</pre>


31. When you add a new module to a configuration, Terraform must download it before it can be used. What two commands can be used to download and update modules? (select two)
<pre>
terraform get
The terraform get command is used to download modules from the module registry or a version control system, making them available for use in the configuration.

terraform init 
The terraform init command is used to initialize a working directory containing Terraform configuration files. It downloads any modules specified in the configuration.
</pre>

32. Code snippet would allow you to retrieve information about existing resources and use that information within your Terraform configuration?
<pre>
data "aws_ami" "aws_instance" {
  most_recent = true
 
  owners = ["self"]
  tags = {
    Name   = "app-server"
    Tested = "true"
  }
}

Explanation
This code snippet defines a data block for retrieving information about an AWS AMI (Amazon Machine Image) based on specific criteria like owners and tags. This data can then be used within the Terraform configuration to make decisions or set attributes based on the retrieved information.
</pre>

33. When writing Terraform code, how many spaces between each nesting level does HashiCorp recommend that you use?
<pre>
2
</pre>
34. Map Definition Format
<pre>
foo = {}
</pre>

35. A ___________ type allows multiple values of several distinct types to be grouped together as a single value
<pre>
structural
</pre>

36. terraform command to manually mark a resource as no longer tainted
<pre>
terraform untaint
</pre>

37. What is the result of this:
lookup ({d="1", e="2"}, "f", "3")
<pre>
3 

Explanation:
	•	The lookup function in Terraform is used to retrieve a value from a map.
	•	It takes three arguments:
	1.	The map: {d="1", e="2"} – This map contains two key-value pairs: d = "1" and e = "2".
	2.	The key: "f" – This is the key we’re trying to look up in the map.
	3.	The default value: "3" – This is the value to return if the key ("f") is not found in the map.
</pre>

38. Terraform Plugins execute as separate processes:
<pre>
True
</pre>

39. It is secure practice to omit secrets when storing state in the backend. Given that's done, can you directly query Hashicorp Vault for secrets when trying communicate with the backend?
<pre>
False 
</pre>

40. Can you install Terraform on Solaris?
<pre>
Yes
</pre>

41. In Terraform 0.12, you can return the entire module itself from a module.
<pre>
Yes
</pre>

42. Structural types require a ________ as an argument
<pre>
schema
</pre>

43. To persist variable values, you should define them in:
<pre>
terraform.tfvars
</pre>

44. In the following code, does the word myinstances have any significane on AWS?

resource "aws_instance" "myinstances" {
  count = 3 # it forms three instances type t2
  ami = "ami-922914f7" # choose the ami that you need
  instance_type = "t2.micro"
  
  tags {
     Name = "ec2-${count.index}" # name the the instance
  }
}
<pre>
No, its an arbitrary name in in terraform code
Name it as you please 
</pre>

45. Which of the following is NOT a Terraform Enterprise feature?
<pre>
Sentinel (is built into Terraform Enterprise)
</pre>

46. Objects can only have values of same type:
<pre>
False 
</pre>

47. The two kinds of structural type in the Terraform language are: Choose 2
<pre>
tuple
object
</pre>

48. Adding in explicit provider dependency in provider block is not a good practice.
<pre>
False (do not add expicit provider dependency)
</pre>

49. Question 4
Incorrect
In this block what defines to block type?

resource "aws_instance" "foo" {
ami = "bar"
   instance_type = "c4.xlarge"
}
<pre>
resource
</pre>

50. For a parent module to have access to an attribute of resource in the child module, what does the child module has to do?
<pre>
explicitly output them
</pre>

51. Command ____________ looks for all module source lines and retrieves the module codes and errors if can't find them
<pre>
terraform get
</pre>

52. What Terraform command can be used to manually unlock the state for the defined configuration?
<pre>
terraform force-unlock
Usage: terraform force-unlock [options] LOCK_ID 
FYI - I had to do this after I hit ctrl-c on a repo that I should not have touched 
</pre>

53. A user has created three workspaces using the command line - prod, dev, and test. The user wants to create a fourth workspace named stage.
Which command will the user execute to accomplish this task?
<pre>
terraform workspace new stage
</pre>

54. What feature of Terraform Cloud allows you to publish and maintain a set of custom modules that can only be used within your organization?
<pre>
private registry 
</pre>

55. Why might a user opt to include the following snippet in their configuration file?
terraform {
  required_version = ">= 1.9.2"
}
<pre>
Correct answer
The user wants to specify the minimum version of Terraform that is required to run the configuration
</pre>

56. Emma is a Terraform expert, and she has automated all the things with Terraform. A virtual machine was provisioned during a recent deployment, but a local script did not work correctly. As a result, the virtual machine needs to be destroyed and recreated.
How can Emma quickly have Terraform recreate the one resource without having to destroy everything that was created?
<pre>
Correct answer
use terraform apply -replace=aws_instance.web to mark the virtual machine for replacement
</pre>

57. True or False? Rather than use a state file, Terraform can inspect cloud resources on every run to validate that the real-world resources match the desired state.
<pre>
False
Terraform requires a state file to store information about the current state of infrastructure resources. By inspecting this state file, Terraform can determine the necessary changes to bring the real-world resources in line with the desired state specified in the configuration files. Without a state file, Terraform would not be able to perform this validation. 
</pre>

58. What do the declarations, such as name, cidr, and azs, in the following Terraform code represent and what purpose do they serve?
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"
 
  name = var.vpc_name
  cidr = var.vpc_cidr
 
  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
 
  enable_nat_gateway = var.vpc_enable_nat_gateway
 
  tags = var.vpc_tags
}
<pre>
Correct answer
these are variables that are passed into the child module likely used for resource creation
</pre>

59. Which of the following variable declarations is going to result in an error?
<pre>
Correct answer
variable "example" { 
  description = "This is a variable description" 
  type        = list(string) 
  default     = {}
}
The variable declaration is going to result in an error 
because the default value is assigned as an empty map {}. 
The type specified for the variable is list(string), 
so assigning an empty map as the default value is not valid and will cause an error.
</pre>

60. You are adding a new variable to your configuration. Which of the following is NOT a valid variable type in Terraform?
<pre>
Correct answer
float 
float is not a variable in terraform  
</pre>

61. True or False? Using the latest versions of Terraform, terraform init cannot automatically download community providers.
<pre>
FALSE 
The statement "False" is correct because using the latest versions of Terraform, the command `terraform init` can automatically download community providers. This functionality simplifies the process of integrating community providers into Terraform configurations, enhancing the overall user experience.
</pre>

62. Which Terraform command will force a resource to be destroyed and recreated even if there are no configuration changes that would require it?
<pre>
terraform apply -refresh-only
</pre>

63. True or False? Workspaces provide similar functionality in the Community and Terraform Cloud versions of Terraform.
<pre>
False
While workspaces in the Community and Terraform Cloud versions of Terraform serve the same purpose of managing multiple environments and configurations, 
there are differences in how they are implemented and accessed. 
Terraform Cloud offers additional features and capabilities for managing workspaces, such as remote state management, collaboration tools, 
and version control integration, which are not available in the Community version.
</pre>

65. When configuring a remote backend in Terraform, it might be a good idea to purposely omit some of the required arguments to ensure secrets and other relevant data are not inadvertently shared with others. What alternatives are available to provide the remaining values to Terraform to initialize and communicate with the remote backend? (select three)
<pre>
interactively on the command line
use the -backend-config=PATH flag to specify a separate config file
command-line key/value pairs
</pre>

66. What are the core Terraform workflow steps to use infrastructure as code?
<pre>
1) Write
2) Plan
3) Apply
</pre>

67. True or False? Similar to Terraform Community, you must use the CLI to switch between workspaces when using Terraform Cloud workspaces.
<pre>
Correct answer False
In Terraform Cloud, you can switch between workspaces directly within the Terraform Cloud web interface without the need to use the CLI. Terraform Cloud provides a user-friendly interface that allows users to manage and switch between workspaces efficiently without relying solely on the CLI for workspace management.
</pre>

68. In regards to Terraform state file, select all the statements below which are correct: (select four)
<pre>
storing state remotely can provide better security
the Terraform state can contain sensitive data, therefore the state file should be protected from unauthorized access
Terraform Cloud always encrypts state at rest
when using local state, the state file is stored in plain-text
https://developer.hashicorp.com/terraform/language/state/sensitive-data
</pre>


69. In the terraform block, which configuration would be used to identify the specific version of a provider required?
<pre>
required_providers
The correct configuration to identify the specific version of a provider required is the "required_providers" block in the terraform configuration. This block allows you to specify the provider name and version constraints, ensuring that the correct version of the provider is used for the Terraform configuration.
</pre>

70. Frank has a file named main.tf which is shown below. Which of the following statements are true about this code? (select two)
module "servers" {
  source = "./modules/app-cluster"
 
  servers = 5
}
<pre>
app-cluster is the child module
main.tf is the calling module
</pre>

71. Which of the following describes the process of leveraging a local value within a Terraform module and exporting it for use by another module?
<pre>
Exporting the local value as an output from the first module, then importing it into the second module's configuration.
</pre>

72. Kristen is using modules to provision an Azure environment for a new application. She is using the following code to specify the version of her virtual machine module. Which of the following Terraform features supports the versioning of a module? (select two)
module "compute" {
  source  = "azure/compute/azurerm"
  version = "5.1.0"
 
  resource_group_name = "production_web"
  vnet_subnet_id      = azurerm_subnet.aks-default.id 
}
<pre>
private registry
terraform registry
Version constraints are supported only for modules installed from a module registry, such as the public Terraform Registry https://registry.terraform.io/ 
or Terraform Cloud's private registry. https://developer.hashicorp.com/terraform/cloud-docs/registry
Other module sources can provide their own versioning mechanisms within the source string itself, or might not support versions at all. 
In particular, modules sourced from local file paths do not support version; since they're loaded from the same source repository, 
they always share the same version as their caller.
https://developer.hashicorp.com/terraform/language/modules/syntax#version
</pre>

73. Which Terraform command will force a resource to be destroyed and recreated even if there are no configuration changes that would require it?
<pre>
Correct answer: terraform apply -replace=<address>
Explanation
The `terraform apply -replace=` command is used to force a resource to be destroyed and recreated, even if there are no configuration changes that would require it. This is achieved by specifying the resource address that needs to be replaced, ensuring that the resource is recreated with the latest configuration.
</pre>

74. What are some problems with how infrastructure was traditionally managed before Infrastructure as Code? (select three)
<pre>
Traditional deployment methods are not able to meet the demands of the modern business where resources tend to live days to weeks, rather than months to years
Traditionally managed infrastructure can't keep up with cyclic or elastic applications
Requests for infrastructure or hardware often required a ticket, increasing the time required to deploy applications
</pre>

75. You have been given requirements to create a security group for a new application. Since your organization standardizes on Terraform, you want to add this new security group with the fewest number of lines of code. What feature could you use to iterate over a list of required tcp ports to add to the new security group?
<pre>
dynamic block
Using a dynamic block in Terraform allows you to iterate over a list of items, such as a list of required tcp ports, and dynamically create resources based on those items. This feature helps reduce the amount of code needed to define multiple similar resources, making it the ideal choice for adding multiple tcp ports to the new security group with minimal lines of code.
</pre>

76. Why is it a good idea to declare the required version of a provider in a Terraform configuration file?
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.57.0"
    }
  }
}
<pre>
providers are released on a separate schedule from Terraform itself; therefore, a newer version could introduce breaking changes

Declaring the required version of a provider in a Terraform configuration file is important because providers are released independently from Terraform. This means that a newer version of a provider could potentially introduce breaking changes that are not compatible with the current configuration. Specifying the version ensures that the configuration works as expected with the specific provider version.
</pre>

77. Using multi-cloud and provider-agnostic tools provides which of the following benefits? (select two)
<pre>
operations teams only need to learn and manage a single tool to manage infrastructure, regardless of where the infrastructure is deployed
can be used across major cloud providers and VM hypervisors

Using multi-cloud and provider-agnostic tools allows for the flexibility to deploy infrastructure across different major cloud providers and virtual machine hypervisors. This means that the same tool can be used to manage resources in AWS, Azure, Google Cloud, and other platforms, reducing the need to learn and manage multiple tools for each provider.
</pre>

78. Terry is using a module to deploy some EC2 instances on AWS for a new project. He is viewing the code that is calling the module for deployment, which is shown below. Where is the value of the security group originating?
module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
 
  name           = "my-ec2-cluster"
  instance_count = 2
 
  ami                    = "ami-0c5204531f799e0c6"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
 
  tag = {
    Terraform   = "true"
    Environment = "dev"
  } 


<pre>
the output of another module

Using multi-cloud and provider-agnostic tools allows for the flexibility to deploy infrastructure across different major cloud providers and virtual machine hypervisors. This means that the same tool can be used to manage resources in AWS, Azure, Google Cloud, and other platforms, reducing the need to learn and manage multiple tools for each provider.
</pre>
