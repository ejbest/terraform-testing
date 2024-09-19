### Test Practice 5 ###

This is from Test 5 of the Udemy Course 

2.  Which of the following are true statements regarding Terraform? (select three)
- Terraform is cloud-agnostic
- Terraform can orchestrate large-scale, multi-cloud infrastructure deployments
- A single configuration file can use multiple providers

Not Correct - READ READ  READ READ  READ READ  READ READ  READ READ  
- Terraform can manage dependencies within a single cloud, but not cross-cloud
- Terraform is not limited to managing dependencies within a single cloud environment. It can also manage dependencies across different cloud providers, allowing users to define and provision resources that interact with each other across multiple clouds. This cross-cloud capability is one of the key strengths of Terraform in managing modern, hybrid cloud infrastructures.

8. You have recently refactored your Terraform configuration, and a resource has been changed to be created within a module. As a result, the resource has changed from aws_instance.web to module.servers.aws_instance.web. To ensure that Terraform updates the state file correctly and does not recreate the resource, which block should you use in your configuration?
- moved block
- The "moved" block is used to inform Terraform that a resource has been moved to a new location within the configuration. By using this block and specifying the old and new resource locations, Terraform can update the state file correctly and avoid recreating the resource.

13. What is NOT a benefit of using Infrastructure as Code?
- reducing vulnerabilities in your publicly-facing applications
- Although Infrastructure as Code (IaC) tools allow you to programmatically deploy and manage your applications, it does NOT ensure that your applications have a reduced number of vulnerabilities. This security feature is not the responsibility of IaC, and you would need to pair IaC with another tool to scan your code to identify security vulnerabilities.

22. True or False? Infrastructure as code (IaC) tools allow you to manage infrastructure with configuration files rather than through a graphical user interface.
- True. 
- Infrastructure as code (IaC) tools, such as Terraform, allow you to define and manage infrastructure using configuration files written in a declarative language. This approach enables you to treat infrastructure as code, version control it, and automate its provisioning and management, all without the need for manual intervention through a graphical user interface.

24. Given the definition below, what Terraform feature is being described? "helps you share Terraform providers and Terraform modules across your organization. It includes support for versioning, a searchable list of available providers and modules, and a configuration designer to help you build new workspaces faster."
- Private Registry
- The description provided aligns with the features of a Private Registry in Terraform. Private Registries allow organizations to share Terraform providers and modules internally, providing versioning support, a searchable list of available resources, and a configuration designer to streamline workspace creation.

44. You need to start managing an existing AWS S3 bucket with Terraform that was created manually outside of Terraform. Which block type should you use to incorporate this existing resource into your Terraform configuration?
import block
resource block

46. You need to define a single input variable to support the IP address of a subnet, which is defined as a string, and the subnet mask, which is defined as a number. What type of variable variable should you use? 
- type = object ()
- A structural type allows multiple values of several distinct types to be grouped together as a single value. Structural types require a schema as an argument, to specify which types are allowed for which elements.
- object(...): a collection of named attributes that each have their own type.
- The schema for object types is { <KEY> = <TYPE>, <KEY> = <TYPE>, ... } — a pair of curly braces containing a comma-separated series of <KEY> = <TYPE> pairs. Values that match the object type must contain all of the specified keys, and the value for each key must match its specified type. (Values with additional keys can still match an object type, but the extra attributes are discarded during type conversion.)

https://developer.hashicorp.com/terraform/language/expressions/type-constraints#optional-object-type-attributes

47. Which statement below is true regarding using Sentinel in Terraform Cloud?
- Sentinel runs before a configuration is applied, therefore potentially reducing cost for public cloud resources
- Overall explanation
- Sentinel is an embedded policy-as-code framework integrated with the HashiCorp Enterprise products. It enables fine-grained, logic-based policy decisions, and can be extended to use information from external sources.
- When using Sentinel policies to define and enforce policies, it (Sentinel) runs after a terraform plan, but before a terraform apply. Therefore, you can potentially reduce costs on public cloud resources by NOT deploying resources that do NOT conform to policies enforced by Sentinel. For example, without Sentinel, your dev group might deploy instances that are too large, or too many of them, by accident or just because they can. Rather than being REACTIVE and shutting them down after they have been deployed, which it would cost you $, you can use Sentinel to prevent those large resources from being deployed in the first place.
- https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement

49. You've included two different modules from the official Terraform registry in a new configuration file. When you run a terraform init, where does Terraform Community download and store the modules locally?
- in the .terraform/modules folder in the working directory
- Overall explanation
- When plugins and modules are downloaded, they are stored under their respective directory in the .terraform folder within the current working directory. For example, providers/plugins are downloaded to .terraform/providers and modules are downloaded to the .terraform/modules directory.

52. Beyond storing state, what capability can an enhanced storage backend, such as the remote backend, provide your organization?
- execute your Terraform on infrastructure either locally or in Terraform Cloud
- Overall explanation
- Using an enhanced storage backend allows you to execute your Terraform on infrastructure either locally or in Terraform Cloud. Note that this enhanced storage backend term has now been deprecated by Terraform but it's likely to show up in the test for a while. See the note below from this site:
- Note: In Terraform versions prior to 1.1.0, backends were also classified as being 'standard' or 'enhanced', where the latter term referred to the ability of the remote backend to store state and perform Terraform operations. This classification has been removed, clarifying the primary purpose of backends. Refer to Using Terraform Cloud for details about how to store state, execute remote operations, and use Terraform Cloud directly from Terraform.
https://developer.hashicorp.com/terraform/language/settings/backends/configuration#what-backends-do