### Test Practice 4b ###

This is from Test 4b of the Udemy Course 
###### Earn your HashiCorp Certified: Terraform Associate 003 with over *300* unique Terraform Associate questions ######

#### these are all good details to ensure you know ####
#### the question is there verbatim ####
#### notes below each questions are facts and should be checked ####
#### only question missed are showing below ####

### 16 incorrect ###

1. Which of the following code snippets will properly configure a Terraform backend?
<pre>
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "btk"
 
  workspaces {
    name = "bryan-prod"
  }
 }
} </pre>
- This code snippet properly configures a Terraform backend using the "remote" backend type with the specified hostname and organization.
- It also defines a workspace named "bryan-prod" within the backend configuration, allowing Terraform to store state files remotely on the Terraform Cloud platform.

https://developer.hashicorp.com/terraform/language/settings/backends/configuration#using-a-backend-block

13. STATEFILE If you have properly locked down access to your state file, it is safe to provide sensitive values inside of your Terraform configuration.
- It is false to assume that it is safe to include sensitive values in your Terraform configuration, even if the state file is secure. 
- Best practices dictate that sensitive information should be stored in secure locations such as environment variables, secret management tools, or external vaults, and referenced in your configuration files to maintain security and compliance standards.
- Best practice here is to provide your sensitive values OUTSIDE of Terraform, like storing and retrieving them from a secrets management platform like Vault, or using environment variables.

https://learn.hashicorp.com/tutorials/terraform/sensitive-variables?in=terraform/configuration-language

17. Which of the following is the best description of a dynamic block?

- produces nested configuration blocks instead of a complex typed value


- A dynamic block in Terraform produces nested configuration blocks instead of a complex typed value. This allows for more flexible and dynamic configurations by generating multiple instances of a block based on a list or map of values.

A dynamic block acts much like a for expression, but produces nested blocks instead of a complex typed value. It iterates over a given complex value and generates a nested block for each element of that complex value. You can dynamically construct repeatable nested blocks like setting using a special dynamic block type, which is supported inside resource, data, provider, and provisioner blocks.

https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks

18. About the terraform.tfstate file used by Terraform?

- The terraform.tfstate file does not always match the infrastructure deployed with Terraform. 
- It reflects the state of the infrastructure at the time of the last Terraform operation, so changes made outside of Terraform will not be reflected in the state file.

https://developer.hashicorp.com/terraform/language/state

https://developer.hashicorp.com/terraform/language/state/sensitive-data

https://developer.hashicorp.com/terraform/language/state/purpose

19. Your co-worker has decided to migrate Terraform state to a remote backend. They configure Terraform with the backend configuration, including the type, location, and credentials. However, you want to secure this configuration better. Rather than storing them in plaintext, where should you store the credentials for the remote backend? (select two)

    1. credentials file
    2. environment variables 

- Using a credentials file to store sensitive information for the remote backend is a recommended practice in Terraform. This file can be encrypted or secured with proper access controls, ensuring that the credentials are not exposed in plaintext within the configuration files.

- Storing credentials in environment variables is a common practice for securing sensitive information in Terraform configurations. This approach helps prevent accidental exposure of credentials in version control systems and provides an additional layer of security by keeping them separate from the code.

https://developer.hashicorp.com/terraform/language/settings/backends/configuration

27. Which of the following is true about working with modules?
- a single module can be called many times in a single configuration file
- In Terraform, a single module can indeed be called multiple times within a single configuration file. 
- This allows for reusability and modularity in the infrastructure code, making it easier to manage and maintain configurations.
- Ok, so there's a lot to unpack for this question here. First, let's talk about the correct answer. Modules can be called one or more times by a parent module. The configuration file/module that calls a module is often called the parent, root,or calling module. The module that is called is the child module, or sometimes just "module". The whole point of using a module is to be able to call it one or many times to create resources without having to rewrite the same code over and over.
- Module outputs: While modules are often more valuable when they output values, they don't necessarily have to output values. They can be used to simply manage resources. If you do need values from the module, that's when you'd create outputs. Those outputs can be used just for informational purposes or they can be used as inputs for other modules. For example, you might create a subnet in a public cloud in one module and need to output the subnet ID so you can use it as an input on a second module to deploy application workloads.
- Resources in Modules: Modules can be used to deploy and manage one or more resources within the module. For example, you might need to deploy multiple resources needs for a specific application or requirements.

https://developer.hashicorp.com/terraform/language/modules/syntax

https://developer.hashicorp.com/terraform/language/values/outputs

29. You are using Terraform Cloud to manage a new data analytics environment for your organization. You have decided to use Sentinel to enforce standardization and security controls. At what step are the Sentinel policies enforced during a run?

- after the plan, run tasks, cost estimation phases but before the apply phase
- Sentinel policies are enforced after the plan, run tasks, and cost estimation phases but before the apply phase in Terraform Cloud. This allows for the policies to be evaluated against the planned changes before they are actually applied to the infrastructure, ensuring standardization and security controls are met.
- Sentinel policy evaluations occur after Terraform completes the plan and after both run tasks and cost estimation. This order lets you write Sentinel policies to restrict costs based on the data in the cost estimates.
- OPA policy evaluations are slightly different and occur after Terraform completes the plan and after any run tasks. Unlike Sentinel policies, Terraform Cloud evaluates OPA policies immediately before cost estimation.

https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/policy-results

31. True or False? When developing Terraform code, you must include a provider block for each unique provider so Terraform knows which ones you want to download and use.

- False. While it is a best practice to include a provider block for each unique provider in Terraform code, it is not a strict requirement. Terraform can automatically detect and use providers based on the resource configurations defined in the code. However, explicitly defining provider blocks enhances code readability and helps avoid potential conflicts or ambiguities in resource management.

38. Which of the following are advantages of using infrastructure as code (IaC) for your day-to-day operations? (select three)
- provides the ability to version control the infrastructure and application architecture
    - Version controlling infrastructure and application architecture is a crucial benefit of IaC. It allows teams to track changes, collaborate effectively, and roll back to previous states if needed. This ensures consistency, reliability, and reproducibility in managing infrastructure configurations and deployments.
- enables self-service for developers and operators alike
    - IaC enables self-service for developers and operators by providing them with the ability to define and deploy infrastructure resources using code. This empowers teams to quickly spin up environments, test new features, and iterate on infrastructure changes without relying on manual processes or waiting for centralized IT teams.
- API-driven workflows
    - API-driven workflows are a key advantage of using infrastructure as code (IaC) as they allow for automation and programmability of infrastructure provisioning and management. This enables seamless integration with other tools and systems, improving efficiency and reducing manual errors in day-to-day operations.

https://learn.hashicorp.com/tutorials/terraform/infrastructure-as-code

https://developer.hashicorp.com/terraform/intro

https://developer.hashicorp.com/terraform/intro/use-cases

44. Given the code snippet below, how would you refer to the value of ip  of an environment when using a for_each argument in a resource block?
<pre>
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
- When using a for_each argument in a resource block, you can refer to the value of the ip attribute of an environment by using each.value.ip. This syntax allows you to access the value of the ip attribute for each element in the map variable defined in the env variable.

https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

https://learn.hashicorp.com/tutorials/terraform/for-each


45. You are using Terraform Community and need to spin up a copy of your GCP environment in a second region to test some new features. You create a new workspace. Which of the following is true about this new workspace? (select four)

- you can use a different variables file for this workspace if needed
    - Workspaces in Terraform Community can utilize different variables files, enabling the customization of configurations for specific environments. This flexibility allows for the testing of different configurations and variables without affecting other workspaces.

- it has its own state file
    - Each workspace in Terraform Community has its own state file, allowing for isolation and independent management of resources. This ensures that changes made in one workspace do not affect the state of resources in other workspaces.

- it uses the same Terraform code in the current directory
    - Each workspace in Terraform Community can use the same Terraform code located in the current directory. This allows for easy replication of configurations across different environments for testing and development purposes.

- changes to this workspace won't impact other workspaces
    - Changes made to resources in a specific workspace do not impact resources in other workspaces. This isolation allows for independent testing and development of infrastructure configurations without interfering with existing environments.

https://developer.hashicorp.com/terraform/language/state/workspaces

https://developer.hashicorp.com/terraform/cli/commands/workspace/list

https://developer.hashicorp.com/terraform/cli/commands/workspace/new


46. You have an existing resource in your public cloud that was deployed manually, but you want the ability to reference different attributes of that resource throughout your configuration without hardcoding any values. How can you accomplish this?

- Add a data block to your configuration to query the existing resource. Use the available exported attributes of that resource type as needed throughout your configuration to get the values you need.

- Adding a data block to your configuration allows you to query the existing resource and access its exported attributes. By using these attributes throughout your configuration, you can dynamically reference different values without hardcoding them, providing flexibility and maintainability.
- Anytime you need to reference a resource that is NOT part of your Terraform configuration, you need to query that resource using a data block - assuming a data source is available for that resource_type. Once you add the data block to your configuration, you will be able to export attributes from that data block using interpolation like any other resource in Terraform. For example, if you had an AWS S3 bucket, you could get information using a data block that looked like this:
<pre>
data "aws_s3_bucket" "data_bucket" {
  bucket = "my-data-lookup-bucket-btk"
} </pre>
- Once you add the data block, you can refer to exported attributes like this: data.aws_s3_bucket.data_bucket.arn
- None of the wrong answers would allow you to import or query information so that Terraform can use it through interpolation.

https://learn.hashicorp.com/tutorials/terraform/data-sources

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket

49. True or False? In both Terraform Community and Terraform Cloud, workspaces provide similar functionality of using a separate state file for each workspace.

- True. In both Terraform Community and Terraform Cloud, workspaces allow users to have separate state files for each workspace. This segregation of state files enables users to manage different environments, configurations, and resources independently without interfering with each other.

- This is true. When you create a new workspace using Terraform Community/CLI using the terraform workspace new command, you will be working with a separate state file when working with that workspace. You can easily change between workspaces and their respective state file using the terraform workspace select command.

- The same is true in Terraform Cloud. When you create a new workspace, you'll be working with a dedicated state file for that particular workspace. It doesn't share a state file with any other workspace.

https://developer.hashicorp.com/terraform/cli/workspaces#the-purpose-of-workspaces

https://developer.hashicorp.com/terraform/cli/workspaces#interactions-with-terraform-cloud-workspaces

52. Your team is using Terraform, and multiple team members need to be able to manage the infrastructure. You need to support state locking to reduce the chance of corrupting the state file. What backends can you use to meet these requirements? (select three)

- s3 backend (with DynamoDB)
    - The s3 backend with DynamoDB in Terraform provides state locking functionality, making it a suitable choice for managing infrastructure with multiple team members. The combination of s3 for storing the state file and DynamoDB for locking ensures that only one user can modify the state at a time, reducing the risk of corruption.

- kubernetes backend
    - The kubernetes backend in Terraform supports state locking, making it a viable option for managing infrastructure with multiple team members. By utilizing the kubernetes backend, you can ensure that only one user can modify the state at a time, reducing the likelihood of state file corruption.

- consul backend
    - The consul backend in Terraform allows for state locking, which helps prevent concurrent modifications to the state file by multiple team members. This backend is a good choice for managing infrastructure with multiple users to ensure state consistency and integrity.

- Not all Terraform backends are created equal. Some backends act like plain "remote disks" for state files; others support locking the state while operations are being performed, which helps prevent conflicts and inconsistencies.

- Kubernetes, Consul, and S3 backends all support state locking. S3 supports state locking with the help of DynamoDB.

https://developer.hashicorp.com/terraform/language/settings/backends/configuration

56. You are working on updating your infrastructure managed by Terraform. Before lunch, you update your configuration file and run a terraform plan to validate the changes. While you are away, a colleague manually updates a tag on a managed resource directly in the console (UI).  What will happen when you run a terraform apply?

- Before applying the new configuration, Terraform will refresh the state and recognize the manual change. It will update the resource based on the desired state as configured in the Terraform configuration. The manual change will no longer exist.

- Terraform will refresh the state before applying any changes to ensure that it has the latest information about the infrastructure. When it detects the manual change made by the colleague, it will update the resource to match the desired state defined in the Terraform configuration. This means that the manually updated tag will be overwritten by the configuration specified in the Terraform file.

- There's a lot to this question, but the reasoning is pretty basic. Since a resource was manually changed, it means that Terraform state is no longer accurate. However, before a terraform plan or terraform apply is executed, Terraform refreshes its state to ensure it knows the status of all its managed resources. During this process, Terraform would recognize the change, update state, and compare that to the new configuration file. Assuming the change defined in the configuration is identical to the manual change, Terraform would simply apply any changes (if any), update the state file, and complete the terraform apply.

https://developer.hashicorp.com/terraform/intro/core-workflow

https://learn.hashicorp.com/tutorials/terraform/resource-drift?in=terraform/state

https://learn.hashicorp.com/tutorials/terraform/resource-lifecycle?in=terraform/state


57. You have a module named prod_subnet that outputs the subnet_id of the subnet created by the module. How would you reference the subnet ID when using it for an input of another module?

    subnet = module.prod_subnet.subnet_id

- The correct way to reference the subnet ID output from the module named prod_subnet is by using the syntax module.prod_subnet.subnet_id. This syntax directly accesses the output variable subnet_id from the prod_subnet module for use as an input in another module.

- Using interpolation, you can reference the output of an exported value by using the following syntax: module.<module name>.<output name>

- Don't forget that before you can reference data/values from a module, the module has to have an output declared that references the desired value(s).

https://developer.hashicorp.com/terraform/language/modules/syntax#accessing-module-output-values

https://learn.hashicorp.com/collections/terraform/modules

