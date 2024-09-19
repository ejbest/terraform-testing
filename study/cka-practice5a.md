### Test Practice 5 ###

This is from Test 5 of the Udemy Course 
###### Earn your HashiCorp Certified: Terraform Associate 003 with over *300* unique Terraform Associate questions ######

#### these are all good details to ensure you know ####
#### the question is there verbatim ####
#### notes below each questions are facts and should be checked ####
#### only question missed are showing below ####

### 17 incorrect ###

9. By default, where does Terraform CLI store its state?
- in the terraform.tfstate file in the current working directory on the local backend
- By default, Terraform CLI stores its state in the terraform.tfstate file on the local backend. This file contains the current state of the infrastructure managed by Terraform and is typically stored in the same directory as the configuration files.
- Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real-world resources to your configuration, keep track of metadata, and improve performance for large infrastructures.
- Terraform will store its state in the terraform.tfstate file on the local backend. This is the default but you can always change it if you want.

https://developer.hashicorp.com/terraform/language/state

19. You need to start managing an existing AWS S3 bucket with Terraform that was created manually outside of Terraform. Which block type should you use to incorporate this existing resource into your Terraform configuration?

- IMPORT BLOCK The import block is used in Terraform to import existing resources into the Terraform state. In this case, since you need to manage an existing AWS S3 bucket that was created manually outside of Terraform, you would use the import block to bring this resource under Terraform management.

- RESROUCE BLOCK The resource block in Terraform is used to define and manage resources. While you can use resource blocks to create new resources, in this scenario where you need to manage an existing AWS S3 bucket, you would not use a resource block as the bucket already exists outside of Terraform.

- The import block in Terraform is used to bring an existing resource into Terraform’s state file. By specifying the resource and its ID, you can manage the resource with Terraform without recreating it. This is especially useful for incorporating resources that were created manually or by other means.

https://developer.hashicorp.com/terraform/language/import


20. Given the definition below, what Terraform feature is being described?  "helps you share Terraform providers and Terraform modules across your organization. It includes support for versioning, a searchable list of available providers and modules, and a configuration designer to help you build new workspaces faster."
- Private Registry: The description provided aligns with the features of a Private Registry in Terraform. Private Registries allow organizations to share Terraform providers and modules internally, providing versioning support, a searchable list of available resources, and a configuration designer to streamline workspace creation.
- This definition is describing the Private Registry...Terraform Cloud's private registry works similarly to the public Terraform Registry and helps you share Terraform providers and Terraform modules across your organization. It includes support for versioning, a searchable list of available providers and modules, and a configuration designer to help you build new workspaces faster.

https://developer.hashicorp.com/terraform/cloud-docs/registry


25. True or False? Input variables that are marked as sensitive are NOT written to Terraform state.

- False: While sensitive input variables in Terraform are not displayed in the CLI output or logs for security reasons, they are still written to the Terraform state file. This ensures that the sensitive information is stored securely and can be used during the Terraform execution process. Therefore, the statement that sensitive input variables are not written to Terraform state is incorrect.
- While the value is not shown in the Terraform CLI output, the value will still be written to state. This is why it's important to secure your state file wherever possible.

https://developer.hashicorp.com/terraform/language/state/sensitive-data

30. This code snippet incorrectly uses the `required_version` argument within the `provider` block for AWS. This argument is used to specify the minimum version of Terraform required, not the provider version. It does not ensure the use of a specific version of the AWS provider.
<pre>
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}
</pre>
- This code snippet correctly specifies the required version of the AWS provider using the `required_providers` block within the `terraform` configuration. It explicitly defines the source as "hashicorp/aws" and sets the version to "5.66.0", ensuring that the specific version of the provider is used.
- To specify the version of Terraform provider that is required, you need to use the required_providers block parameter under the terraform block. HashiCorp recommends that you explicitly set the version of both Terraform and the required providers/plugins to avoid issues when upgrading to the latest versions.

https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version


33. Where is the most secure place to store credentials when using a remote backend?
- defined outside of Terraform
- Storing credentials outside of Terraform, such as in a secure secrets management system or environment variables, is the most secure option when using a remote backend. This approach ensures that sensitive information is not exposed in Terraform configuration files or version control repositories.
- Anytime you can configure these credentials outside of Terraform is your best choice. Environment variables would be the second most-secure choice here. The primary focus is to ensure your credentials are not stored in plaintext and committed to a code repository. NOTE: You could use an encrypted file to store credentials and that encrypted file could be accessed by Terraform to read the creds.

https://blog.gruntwork.io/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1


34. You have recently refactored your Terraform configuration, and a resource has been changed to be created within a module. As a result, the resource has changed from aws_instance.web to module.servers.aws_instance.web. To ensure that Terraform updates the state file correctly and does not recreate the resource, which block should you use in your configuration?
- moved block
- The "moved" block is used to inform Terraform that a resource has been moved to a new location within the configuration. By using this block and specifying the old and new resource locations, Terraform can update the state file correctly and avoid recreating the resource.
- The moved block in Terraform is used to inform Terraform about changes in resource names or locations within your configuration. When you rename or move resources, the moved block helps Terraform understand that the resource was moved rather than recreated, allowing it to update the state file accordingly without destroying and recreating the resource.

https://developer.hashicorp.com/terraform/language/modules/develop/refactoring#moved-block-syntax


35. Which statement below is true regarding using Sentinel in Terraform Cloud?
- Sentinel runs before a configuration is applied, therefore potentially reducing cost for public cloud resources
- Sentinel is an embedded policy-as-code framework integrated with the HashiCorp Enterprise products. It enables fine-grained, logic-based policy decisions, and can be extended to use information from external sources.
- When using Sentinel policies to define and enforce policies, it (Sentinel) runs after a terraform plan, but before a terraform apply. Therefore, you can potentially reduce costs on public cloud resources by NOT deploying resources that do NOT conform to policies enforced by Sentinel. For example, without Sentinel, your dev group might deploy instances that are too large, or too many of them, by accident or just because they can. Rather than being REACTIVE and shutting them down after they have been deployed, which it would cost you $, you can use Sentinel to prevent those large resources from being deployed in the first place.

https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement


37. A coworker provided you with Terraform configuration file that includes the code snippet below. Where will Terraform download the referenced module from?
<pre>
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.6.1"
    }
  }
}
 
provider "kubernetes" {
  # Configuration below
...
</pre>
- the official Terraform public registry
- Terraform will download the referenced module from the official Terraform public registry, where HashiCorp hosts and manages various providers and modules. This ensures that the module is sourced from a trusted and centralized location, providing consistency and reliability in the Terraform environment.
- When a module is located at hashicorp/<name>, Terraform download it from the official Terraform public registry. This is specified by the source argument within the module block. The module installer supports the following source types:
  - Local paths
  - Terraform Registry
  - GitHub
  - Bitbucket
  - Generic Git, Mercurial repositories
  - HTTP URLs
  - S3 buckets
  - GCS buckets
  - Modules in Package Sub-directories

https://developer.hashicorp.com/terraform/language/modules/sources#terraform-registry

40. You have infrastructure deployed with Terraform. A developer recently submitted a support ticket to update a security group to permit a new port. To satisfy the ticket, you update the Terraform configuration to reflect the changes and run a terraform plan. However, a co-worker has since logged into the console and manually updated the security group to the same configuration.  What will happen when you run a terraform apply?

- Nothing will happen. Terraform will validate the infrastructure matches the desired state.

- Terraform follows the principle of desired state configuration management. When you run a terraform apply, Terraform will compare the current state of the infrastructure with the desired state defined in the configuration. Since the manually updated security group matches the desired state in the Terraform configuration, Terraform will recognize that no changes are needed and will not modify the infrastructure.

https://developer.hashicorp.com/terraform/cli/commands/apply

42. Which of the following are collection or structural types that can be used when declaring a variable in order to group values together? (select four)
- object
    - The 'object' type in Terraform allows you to create a complex data structure with multiple attributes. It is useful for grouping related data together in a hierarchical manner.
- list 
    - The 'list' type in Terraform allows you to create an ordered collection of values. It is useful for storing multiple values of the same type and accessing them by index.
- tuple
    - The 'tuple' type in Terraform allows you to create an ordered collection of elements of different types. It is useful for grouping related values together in a specific order.
- map
    - The 'map' type in Terraform allows you to create a collection of key-value pairs, where each key is unique. It is useful for grouping related data together and accessing it using keys.

- As you continue to work with Terraform, you're going to need a way to organize and structure data. This data could be input variables that you are giving to Terraform, or it could be the result of resource creation, like having Terraform create a fleet of web servers or other resources. Either way, you'll find that data needs to be organized yet accessible so it is referenceable throughout your configuration. The Terraform language uses the following types for values:

    * string: a sequence of Unicode characters representing some text, like "hello".

    * number: a numeric value. The number type can represent both whole numbers like 15 and fractional values like 6.283185.

    * bool: a boolean value, either true or false. bool values can be used in conditional logic.

    * list (or tuple): a sequence of values, like ["us-west-1a", "us-west-1c"]. Elements in a list or tuple are identified by consecutive whole numbers, starting with zero.

    * map (or object): a group of values identified by named labels, like {name = "Mabel", age = 52}. Maps are used to store key/value pairs.

- Strings, numbers, and bools are sometimes called primitive types. Lists/tuples and maps/objects are sometimes called complex types, structural types, or collection types.

https://developer.hashicorp.com/terraform/language/expressions/types#types-and-values

44. You want to restrict your team members to specific modules that are approved by the organization's security team when using Terraform Cloud. What feature should you use?

- Terraform Cloud Private Registry
- The Terraform Cloud Private Registry allows organizations to host and manage their own private modules within Terraform Cloud. This feature enables teams to restrict access to approved modules and ensures that only authorized modules are used in infrastructure provisioning.
- Private providers and private modules are hosted on an organization's private registry and are only available to members of that organization.

https://developer.hashicorp.com/terraform/cloud-docs/registry


47. Beyond storing state, what capability can an enhanced storage backend, such as the remote backend, provide your organization?

- execute your Terraform on infrastructure either locally or in Terraform Cloud
- An enhanced storage backend like the remote backend allows you to execute your Terraform operations on infrastructure either locally or in Terraform Cloud. This flexibility enables you to work seamlessly across different environments and collaborate with team members using different setups.
- Using an enhanced storage backend allows you to execute your Terraform on infrastructure either locally or in Terraform Cloud. Note that this enhanced storage backend term has now been deprecated by Terraform but it's likely to show up in the test for a while. See the note below from this site:
- Note: In Terraform versions prior to 1.1.0, backends were also classified as being 'standard' or 'enhanced', where the latter term referred to the ability of the remote backend to store state and perform Terraform operations. This classification has been removed, clarifying the primary purpose of backends. Refer to Using Terraform Cloud for details about how to store state, execute remote operations, and use Terraform Cloud directly from Terraform.

https://developer.hashicorp.com/terraform/language/settings/backends/configuration#what-backends-do

49. What feature does Terraform use to map configuration to resources in the real world?
- state 
- Terraform uses the state feature to map configuration to resources in the real world. The state file keeps track of the current state of the infrastructure and helps Terraform understand which resources are currently managed and what changes need to be applied.
- Terraform requires some sort of database to map Terraform config to the real world. When you have a resource resource "aws_instance" "foo" in your configuration, Terraform uses this map to know that instance i-abcd1234 is represented by that resource.
- For some providers like AWS, Terraform could theoretically use something like AWS tags. Early prototypes of Terraform actually had no state files and used this method. However, we quickly ran into problems. The first major issue was a simple one: not all resources support tags, and not all cloud providers support tags.
- Therefore, for mapping configuration to resources in the real world, Terraform uses its own state structure.

https://developer.hashicorp.com/terraform/language/state/purpose

50. You need to define a single input variable to support the IP address of a subnet, which is defined as a string, and the subnet mask, which is defined as a number. What type of variable variable should you use?

- type = object ()
- Using an object type variable allows you to define a single input variable that can hold multiple values, such as the IP address (string) and subnet mask (number). This type of variable is suitable for grouping related data together and maintaining the structure of the input data.

- A structural type allows multiple values of several distinct types to be grouped together as a single value. Structural types require a schema as an argument, to specify which types are allowed for which elements.

- object(...): a collection of named attributes that each have their own type.

- The schema for object types is { <KEY> = <TYPE>, <KEY> = <TYPE>, ... } — a pair of curly braces containing a comma-separated series of <KEY> = <TYPE> pairs. Values that match the object type must contain all of the specified keys, and the value for each key must match its specified type. (Values with additional keys can still match an object type, but the extra attributes are discarded during type conversion.)

https://developer.hashicorp.com/terraform/language/expressions/type-constraints#optional-object-type-attributes


52. Your organization has multiple engineers that have permission to manage Terraform as well as administrative access to the public cloud where these resources are provisioned. If an engineer makes a change outside of Terraform, what command can you run to detect drift and update the state file?

- terraform apply -refresh-only
- The "terraform apply -refresh-only" command is used to detect drift between the Terraform configuration and the actual state of the resources in the cloud provider. It will update the state file with any changes made outside of Terraform, ensuring that the configuration remains in sync with the actual resources.
- To instruct Terraform to refresh the state file based on the current configuration of managed resources, you can use the terraform apply -refresh-only command. 
- If Terraform discovers drift, it will update the state file with the changes.

- Note that terraform refresh used to be the correct command here, but that command is deprecated. It might show up on the exam though.

https://learn.hashicorp.com/tutorials/terraform/refresh

53. You have declared the variable as shown below. How should you reference this variable throughout your configuration?

<pre>
variable "aws_region" {
  type        = string
  description = "region used to deploy workloads"
  default     = "us-east-1"
  
  validation {
    condition     = can(regex("^us-", var.aws_region))
    error_message = "The aws_region value must be a region in the USA, starting with \"us-\"."
  }
} </pre>

- var.aws_region
- The correct way to reference a variable within your configuration is by using the syntax var.variable_name. In this case, the variable is named "aws_region," so it should be referenced as var.aws_region.
- Input variables (commonly referenced as just 'variables') are often declared in a separate file called `variables.tf`, although this is not required. Most people will consolidate variable declaration in this file for organization and simplification of management. Each variable used in a Terraform configuration must be declared before it can be used. Variables are declared in a variable block - one block for each variable. The variable block contains the variable name, most importantly, and then often includes additional information such as the type, a description, a default value, and other options.

- The value of a Terraform variable can be set multiple ways, including setting a default value, interactively passing a value when executing a terraform plan and apply, using an environment variable, or setting the value in a `.tfvars` file. Each of these different options follows a strict order of precedence that Terraform uses to set the value of a variable.

- A huge benefit of using Terraform is the ability to reference other resources throughout your configuration for other functions. These might include getting certain values needed to create other resources, creating an output to export a specific value, or using data retrieved from a data block. Most of these use dot-separated paths for elements of object values.

- The following represents the kinds of named values available in Terraform:

    * <RESOURCE TYPE>.<NAME> represents a managed resource of the given type and name.

    * var.<NAME> is the value of the input variable of the given name.

    * local.<NAME> is the value of the local value of the given name.

    * module.<MODULE NAME> is a value representing the results of a module block.

    * data.<DATA TYPE>.<NAME> is an object representing a data resource of a given type and name

    * Additional named values include ones for filesystem and workspace info and block-local values


https://developer.hashicorp.com/terraform/language/expressions/references#input-variables