
again READ THE QUESTION; they will burn you there 

1. Terry is using a module to deploy some EC2 instances on AWS for a new project. He is viewing the code that is calling the module for deployment, which is shown below.Where is the value of the security group originating?
<pre>
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
</pre>
- the output of another module
- The required vpc_security_group_ids and subnet_id arguments reference resources created by the vpc module. The Terraform Registry page contains the full list of arguments for the ec2-instance module.
- A great tutorial to look at this workflow can be found on the HashiCorp Learn site  
https://learn.hashicorp.com/tutorials/terraform/module-use

3. Using multi-cloud and provider-agnostic tools provides which of the following benefits? (select two)
- operations teams only need to learn and manage a single tool to manage infrastructure, regardless of where the infrastructure is deployed
- can be used across major cloud providers and VM hypervisors

- Using a tool like Terraform can be advantageous for organizations deploying workloads across multiple public and private cloud environments. Operations teams only need to learn a single tool, a single language, and can use the same tooling to enable a DevOps-like experience and workflows.

https://developer.hashicorp.com/terraform/intro/use-cases#multi-cloud-deployment


5. Why is it a good idea to declare the required version of a provider in a Terraform configuration file?
- providers are released on a separate schedule from Terraform itself; therefore, a newer version could introduce breaking changes
- Declaring the required version of a provider in a Terraform configuration file is important because providers are released independently from Terraform. This means that a newer version of a provider could potentially introduce breaking changes that are not compatible with the current configuration. Specifying the version ensures that the configuration works as expected with the specific provider version.

6. You have been given requirements to create a security group for a new application. Since your organization standardizes on Terraform, you want to add this new security group with the fewest number of lines of code. What feature could you use to iterate over a list of required tcp ports to add to the new security group?
- dynamic block
- Using a dynamic block in Terraform allows you to iterate over a list of items, such as a list of required tcp ports, and dynamically create resources based on those items. This feature helps reduce the amount of code needed to define multiple similar resources, making it the ideal choice for adding multiple tcp ports to the new security group with minimal lines of code.

12. What are some problems with how infrastructure was traditionally managed before Infrastructure as Code? (select three)
- Traditional deployment methods are not able to meet the demands of the modern business where resources tend to live days to weeks, rather than months to years
- Traditionally managed infrastructure can't keep up with cyclic or elastic applications
- Requests for infrastructure or hardware often required a ticket, increasing the time required to deploy applications

- Overall explanation
- Traditionally, infrastructure was managed using manual processes and user interfaces, which could lead to several problems, including:


    1. Configuration drift: With manual configuration, it can be difficult to ensure that all infrastructure components are consistently configured. Over time, differences in configuration can accumulate, leading to configuration drift, where systems in the same environment are no longer identical.

    2. Lack of standardization: Manual configuration can also result in inconsistencies across environments, which can make it difficult to manage and troubleshoot infrastructure. For example, different environments may have different versions of software or different security settings, making it hard to replicate issues or ensure consistent behavior.

    3. Slow provisioning: Provisioning infrastructure manually can be time-consuming, especially for complex configurations or when setting up multiple resources. This can lead to delays in development and deployment, as teams may need to wait for infrastructure to be set up before they can begin work.

    4. Human error: Manual provisioning and configuration is prone to human error, which can lead to security vulnerabilities, performance issues, or downtime. For example, a misconfigured firewall rule could leave systems open to attack, or a typo in a configuration file could cause a system to crash.

    5. Difficulty in documentation: With manual configuration, it can be challenging to keep documentation up to date and accurate. This can make it hard for teams to understand how infrastructure is configured, what changes have been made, and how to troubleshoot issues.

- Overall, these problems can make it difficult to manage infrastructure at scale and can lead to increased costs, reduced agility, and increased risk of errors and downtime. Infrastructure as Code helps to address many of these issues by providing a standardized, repeatable, and automated way to manage infrastructure resources.

https://developer.hashicorp.com/terraform/intro#infrastructure-as-code

21. Which Terraform command will force a resource to be destroyed and recreated even if there are no configuration changes that would require it?

terraform apply -replace=<address> 

23- Kristen is using modules to provision an Azure environment for a new application. She is using the following code to specify the version of her virtual machine module. Which of the following Terraform features supports the versioning of a module? (select two)
<pre>
module "compute" {
    source  = "azure/compute/azurerm"
    version = "5.1.0"
    
    resource_group_name = "production_web"
    vnet_subnet_id      = azurerm_subnet.aks-default.id 
}
</pre>
- private registry
- Terraform registry
- Version constraints are supported only for modules installed from a module registry, such as the public Terraform Registry or Terraform Cloud's private registry. Other module sources can provide their own versioning mechanisms within the source string itself, or might not support versions at all. In particular, modules sourced from local file paths do not support version; since they're loaded from the same source repository, they always share the same version as their caller.

https://developer.hashicorp.com/terraform/language/modules/syntax#version

24. Which of the following describes the process of leveraging a local value within a Terraform module and exporting it for use by another module?
- Exporting the local value as an output from the first module, then importing it into the second module's configuration.

25. Frank has a file named main.tf which is shown below. Which of the following statements are true about this code? (select two)
<pre>
module "servers" {
    source = "./modules/app-cluster"
    
    servers = 5
}
</pre>
- app-cluster is the child module
- main.tf is the calling module


28. In the terraform block, which configuration would be used to identify the specific version of a provider required?
- required_providers 

30. In regards to Terraform state file, select all the statements below which are correct: (select four)
- storing state remotely can provide better security
- the Terraform state can contain sensitive data, therefore the state file should be protected from unauthorized access
- Terraform Cloud always encrypts state at rest 
    - The mask feature in Terraform allows users to obfuscate sensitive data within the state file by replacing it with placeholders. This functionality helps in concealing critical information, enhancing security practices, and aligning with data privacy regulations.
- when using local state, the state file is stored in plain-text
    - Opting to store the Terraform state remotely, such as in a cloud storage service or version control system, offers enhanced security measures compared to local storage. Remote state storage solutions often provide encryption, access controls, and audit trails to safeguard sensitive data.

33. True or False? Similar to Terraform Community, you must use the CLI to switch between workspaces when using Terraform Cloud workspaces.
- False
- False. In Terraform Cloud, you can switch between workspaces directly within the Terraform Cloud web interface without the need to use the CLI. Terraform Cloud provides a user-friendly interface that allows users to manage and switch between workspaces efficiently without relying solely on the CLI for workspace management.


38. What are the core Terraform workflow steps to use infrastructure as code?
    1) Write
    2) Plan
    3) Apply

41. When configuring a remote backend in Terraform, it might be a good idea to purposely omit some of the required arguments to ensure secrets and other relevant data are not inadvertently shared with others. What alternatives are available to provide the remaining values to Terraform to initialize and communicate with the remote backend? (select three)
- use the -backend-config=PATH flag to specify a separate config file
- command-line key/value pairs
- interactively on the command line

57. True or False? Workspaces provide similar functionality in the Community and Terraform Cloud versions of Terraform.
- FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE 